
import SwiftUI
import Foundation

class CorEmocaoManager: ObservableObject {
    @Published var coresPorEmocao: [String: String] = [:] // Mapeia emoção para nome da cor

    init() {
        carregarCoresEmocoesDoJSON()
    }

    func carregarCoresEmocoesDoJSON() {
        if let url = Bundle.main.url(forResource: "cores_emocoes", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                coresPorEmocao = try decoder.decode([String: String].self, from: data)
                print("Cores de emoções carregadas: \(coresPorEmocao)")
            } catch {
                print("Erro ao carregar cores de emoções: \(error)")
                coresPorEmocao = [:]
            }
        } else {
            print("Arquivo JSON de cores de emoções não encontrado.")
            coresPorEmocao = [:]
        }
    }

    func cor(paraEmocao emocao: String) -> Color {
        if let nomeCor = coresPorEmocao[emocao] {
            return Color(nomeCor)
        }
        return .gray.opacity(0.5)
        
    }
}
