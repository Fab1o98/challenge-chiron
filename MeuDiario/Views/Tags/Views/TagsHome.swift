//.
import SwiftUI

struct TagsHome: View {
      
    @State private var tags: [TagsBasicas] = TagStorage.load()
    @State private var isEditing: Bool = false
    @State private var selectedTag: TagsBasicas?
    @State private var searchText: String = ""
    @State private var showingAddSheet = false
    @State private var galleryIsShowing = false

    var filteredTags: [TagsBasicas] {
        if searchText.isEmpty {
            return tags
        } else {
            return tags.filter { $0.nome.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                Divider().foregroundColor(.black)

                TagGrid(tags: $tags,
                        filteredTags: filteredTags,
                        fireEditing: $isEditing,
                        selectedTag: $selectedTag)
                    .foregroundColor(.black)

                Spacer()
            }
            .navigationTitle("Tags")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddSheet = true
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.blue)
                    }
                    NavigationLink(destination: GalleryView(), label: {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(.blue)
                    })
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                AdicionarTags(tags: $tags)
            }
            .sheet(isPresented: $isEditing) {
                if let tag = selectedTag,
                   let index = tags.firstIndex(where: { $0.id == tag.id }) {
                    EditarTags(tag: $tags[index])
                }
            }
            .searchable(text: $searchText)
        }
        .onAppear{
            tags = TagStorage.load()
        }
    }
}


struct TagsHome_Previews: PreviewProvider {
    static var previews: some View {
            TagsHome()
    }
}
