//.
import SwiftUI

struct AdicionarTags: View {
    @Environment(\.dismiss) var dismiss
    @Binding var tags: [TagsBasicas]
    @State private var nome: String = ""
    @State private var nomecor: String = "NadaAtribuido"
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Nome da Tag", text: $nome)
            }
            .navigationTitle("New Tag")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        let newId = (tags.last?.id ?? 0) + 1
                            let nova = TagsBasicas(id: newId, nome: nome, qtd: 0, nomecor: nomecor)
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

