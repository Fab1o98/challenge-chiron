import Foundation

struct EntradaProcessada {
    let emocao: String
    let quantidade: Int
}

class MosaicoProcessor {
    
    func processarEntradas(_ entradas: [EmocaoManager.RegistrarEmocao], paraSemanaDa dataReferencia: Date) -> [EntradaProcessada] {
        // 1. Filtra entradas da mesma semana
        let entradasSemana = entradas.filter {
            Calendar.current.isDate($0.horario, equalTo: dataReferencia, toGranularity: .weekOfYear)
        }
        
        // 2. Soma intensidades por emoção
        var contagem: [String: Int] = [:]
        for entrada in entradasSemana {
            contagem[entrada.emocao, default: 0] += entrada.intensidade
        }
        
        guard !contagem.isEmpty else { return [] }

        let total = contagem.values.reduce(0, +)
        guard total > 0 else { return [] }

        // 3. Calcula proporção real, arredonda para baixo
        var distribuicao: [String: Int] = [:]
        var sobras: [(emo: String, resto: Double)] = []

        for (emo, valor) in contagem {
            let proporcao = Double(valor) / Double(total) * 48
            let parteInteira = Int(floor(proporcao))
            let resto = proporcao - Double(parteInteira)

            distribuicao[emo] = parteInteira
            sobras.append((emo, resto))
        }

        // 4. Calcula quantos ainda faltam para atingir 48
        var atribuídos = distribuicao.values.reduce(0, +)
        let faltando = 48 - atribuídos

        if faltando > 0 {
            // Ordena sobras por maior parte decimal
            sobras.sort { $0.resto > $1.resto }

            for i in 0..<faltando {
                let emo = sobras[i % sobras.count].emo
                distribuicao[emo, default: 0] += 1
            }
        }
        print(distribuicao)
        return distribuicao.map { EntradaProcessada(emocao: $0.key, quantidade: $0.value) }
    }
}
