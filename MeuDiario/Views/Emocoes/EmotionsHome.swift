import SwiftUI

struct EmotionsHome: View {
    
    @EnvironmentObject var viewModel: DiarioViewModel//Estudar essa chamada e por que a de baixo nao funcionou
    
    //@ObservedObject var viewModel: DiarioViewModel -> nao apgar ainda

    var body: some View {
        NavigationView {
            List(viewModel.emocoes) { emocao in
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(emocao.nome)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                        Text(emocao.descricao)
                            .font(.system(size: 18, weight: .light))
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical)

                    Spacer()

                    Image(emocao.imagemNome)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 70)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black.opacity(0.1), lineWidth: 1)
                        )
                }
            }
            .listStyle(.plain)
            .navigationTitle("Emoções")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Buscar")
                    }) {
                        Image(systemName: "magnifyingglass")
                    }

                    Button(action: {
                        print("Perfil") // aaaaa
                    }) {
                        Image(systemName: "person.crop.circle")
                    }
                }
            }
        }
    }
}

struct EmotionsHome_Previews: PreviewProvider {
    static var previews: some View {
        EmotionsHome()
            .environmentObject(DiarioViewModel())
    }
}
