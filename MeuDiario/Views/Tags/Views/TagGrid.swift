import SwiftUI

struct TagGrid: View {
    
    @Binding var tags: [TagsBasicas]
    var filteredTags: [TagsBasicas]
    @Binding var fireEditing: Bool
    @Binding var selectedTag: TagsBasicas?

    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(filteredTags) { tag in
                HStack {
                    Text(tag.nome)
                    Spacer()
                    Text("\(tag.qtd)")
                }
                .padding()
                .background(Color(tag.nomecor))
                .cornerRadius(15)
                .contextMenu {
                    Button() {
                        selectedTag = tag
                        fireEditing = true
                    }label:{
                        HStack{
                            Text("Edit Tag")
                            Spacer()
                            Image(systemName: "pencil")
                        }.padding()
                    }

                    Button(role: .destructive) {
                        if let index = tags.firstIndex(where: { $0.id == tag.id }) {
                                tags.remove(at: index)
                                TagStorage.save(tags)
                        }
                    }label:{
                        HStack{
                            Text("Delete")
                            Spacer()
                            Image(systemName: "trash")
                        }.padding()
                    }
                }
            }
        }
        .padding()
    }
}

