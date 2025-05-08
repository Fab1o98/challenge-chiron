//.
import SwiftUI

struct AdicionarTags: View {
    @Environment(\.dismiss) var dismiss
    @Binding var tags: [TagsBasicas]
    @State private var nome: String = ""
    @State private var nomecor: String = "NadaAtribuido"
    @State private var opcoes = ["Hope", "Joy", "Anger", "Sadness", "Surprise", "Shame", "Guilt", "Fear", "Pride"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Nome da Tag", text: $nome)
            }
            .navigationTitle("New Tag")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        let corAleatoria = opcoes.randomElement() ?? "NadaAtribuido"
                        let newId = (tags.last?.id ?? 0) + 1
                        let nova = TagsBasicas(id: newId, nome: nome, qtd: 0, nomecor: corAleatoria)
                            tags.append(nova)
                            TagStorage.save(tags) // ✅ salva no disco
                            dismiss()
                    }
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
            }.foregroundColor(.primary)
        }
    }
}

