import Foundation

//
class ReflectionManager: ObservableObject{

    // Codable torna os tipos de dados compatíveis com representações externas, como JSON
    struct RegisterReflection: Codable {
        let answer: String
        let time: Date
    }
    
    private var entries: [RegisterReflection] = []
    
    private var fileURL: URL? {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("reflection_entries.json")
    }
    
    init() {
        loadEntries()
    }
    
    func saveReflectionJSON(answer: String, time: Date) {
        let newEntry = RegisterReflection(answer: answer, time: time)
        entries.append(newEntry)
        saveEntries()
    }
    
    private func saveEntries() {
        guard let url = fileURL else { return }
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        encoder.dateEncodingStrategy = .iso8601
        
        do {
            let data = try encoder.encode(entries)
            try data.write(to: url)
            print("Entiries saved: \(url)")
        } catch {
            print("Error trying to save entries: \(error)")
        }
    }
    
    private func loadEntries() {
        guard let url = fileURL else { return }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            let data = try Data(contentsOf: url)
            entries = try decoder.decode([RegisterReflection].self, from: data)
        } catch {
            print("No previous entry found or error loading: \(error)")
            entries = []
        }
    }
    
    func listEntries() -> [RegisterReflection] {
        guard let url = fileURL else { return [] }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            let dataJSON = try Data(contentsOf: url)
            let entries = try decoder.decode([RegisterReflection].self, from: dataJSON)
            return entries
        } catch {
            print("Error loading the entries: \(error)")
            return []
        }
    }

}
