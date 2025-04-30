import Foundation

class EmocaoManager: ObservableObject {
        
    struct RegistrarEmocao: Codable {
        let emocao: String
        let comentario: String
        let horario: Date
        let intensidade: Int
    }
    
    private var registros: [RegistrarEmocao] = []
    
    private var arquivoURL: URL? {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("registro_emocoes.json")
    }
    
    init() {
        carregarRegistros()
    }
    
    func salvarEmocaoJSON(emocao: String, comentario: String, horario: Date, intensidade: Int) {
        let novoRegistro = RegistrarEmocao(emocao: emocao, comentario: comentario, horario: horario, intensidade: intensidade)
        registros.append(novoRegistro)
        salvarRegistros()
    }
    
    private func salvarRegistros() {
        guard let url = arquivoURL else { return }
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        encoder.dateEncodingStrategy = .iso8601
        
        do {
            let dados = try encoder.encode(registros)
            try dados.write(to: url)
            print("Registros atualizados salvos em: \(url)")
        } catch {
            print("Erro ao salvar os registros: \(error)")
        }
    }
    
    private func carregarRegistros() {
        guard let url = arquivoURL else { return }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            let dados = try Data(contentsOf: url)
            registros = try decoder.decode([RegistrarEmocao].self, from: dados)
        } catch {
            print("Nenhum registro anterior encontrado ou erro ao carregar: \(error)")
            registros = []
        }
    }
    
    func listarRegistros() -> [RegistrarEmocao]{
        guard let url = arquivoURL else { return []}
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
            
        do{
            let dadosJSON = try Data(contentsOf: url)
            let registros = try decoder.decode([RegistrarEmocao].self, from: dadosJSON)
            return registros
        } catch{
            print("Erro ao carregar os registros: \(error)")
            return []
        }
    }
}
