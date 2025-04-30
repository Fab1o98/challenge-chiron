import Foundation

class TagDataLoader{
    static func loadItems() -> [TagsBasicas] {
            guard let url = Bundle.main.url(forResource: "tagsBasicasData", withExtension: "json") else {
                fatalError("Erro: tagsBasicasData.json não encontrado.")
            }
            
            do {
                let data = try Data(contentsOf: url)
                let tags = try JSONDecoder().decode([TagsBasicas].self, from: data)
                return tags
            } catch {
                fatalError("Erro ao carregar ou decodificar JSON: \(error)")
            }
        }
}


struct TagStorage {
    
    static let filename = "userTags.json"

    static private var fileURL: URL {
        let manager = FileManager.default
        let folder = manager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return folder.appendingPathComponent(filename)
    }

    static func load() -> [TagsBasicas] {
        do {
            let data = try Data(contentsOf: fileURL)
            let decoded = try JSONDecoder().decode([TagsBasicas].self, from: data)
            return decoded
        } catch {
            print("🔄 Nenhum arquivo salvo encontrado, usando dados padrão.")
            return TagDataLoader.loadItems() // fallback para o JSON do bundle
        }
    }

    static func save(_ tags: [TagsBasicas]) {
        do {
            let data = try JSONEncoder().encode(tags)
            try data.write(to: fileURL, options: [.atomicWrite])
            print("💾 Tags salvas com sucesso.")
        } catch {
            print("❌ Erro ao salvar tags: \(error)")
        }
    }
}
