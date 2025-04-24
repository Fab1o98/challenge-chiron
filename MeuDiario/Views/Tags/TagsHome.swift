import SwiftUI

struct TagsHome: View {
    
    let colunas: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    
    var body: some View {
        NavigationView{
            VStack {
                Divider()
                    .foregroundColor(.black)
                LazyVGrid(columns: colunas){
                    Tag(id: "Family", cor: .red, quantidade: 0)
                    Tag(id: "Friends", cor: .blue, quantidade: 0)
                    Tag(id: "Health", cor: .green, quantidade: 0)
                    Tag(id: "Dating", cor: .gray, quantidade: 0)
                    Tag(id: "Identity", cor: .pink, quantidade: 0)
                    Tag(id: "Money", cor: .brown, quantidade: 0)
                }.padding()
                Spacer()
            }
                
                .navigationTitle("Tags")
                    .toolbar{
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            Button(action: {
                                print("Buscar")
                            }) {
                                Image(systemName: "magnifyingglass")
                            }
                            
                            NavigationLink(destination: AdicionarTags(), label: {
                                Image(systemName: "plus")
                            })

                            NavigationLink(destination: PerfilHome(), label: {Image(systemName: "person.circle")})
                        }
                    }
        }
    }
}

struct TagsHome_Previews: PreviewProvider {
    static var previews: some View {
            TagsHome()
    }
}


struct Tag: View{
    
    var id: String
    var cor: Color
    var quantidade: Int
        
    var body: some View{
        HStack {
            Text(id)
            Spacer()
            Text("\(quantidade)")
        }
        .padding()
        .foregroundColor(.white)
        .background(cor)
        .cornerRadius(20)
    }
}

