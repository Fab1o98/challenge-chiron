import SwiftUI

struct EditarTags: View {
    @Environment(\.dismiss) var dismiss
    @Binding var tag: TagsBasicas

    var body: some View {
        NavigationView {
            Form {
                TextField("Nome da Tag", text: $tag.nome)
            }
            .navigationTitle("Editar Tag")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        TagStorage.save([tag])
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
