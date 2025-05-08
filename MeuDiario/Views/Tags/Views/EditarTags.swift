import SwiftUI

struct EditarTags: View {

    @State private var corSelecionada: Color = .blue
    let corPadraoHex = "#0000FF"
    @Environment(\.dismiss) var dismiss
    @Binding var tag: TagsBasicas
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Nome da Tag", text: $tag.nome)
//                Picker("Selecione a cor", selection: $cor){
//                    ForEach(emocaoList.emocoes, id: \.self){ emocao in
//                        Text(emocao.nome).tag(emocao as Emocao?)
//                    }
//                }
//                .pickerStyle(.menu)
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
