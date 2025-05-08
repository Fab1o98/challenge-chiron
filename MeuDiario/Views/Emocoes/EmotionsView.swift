// .
import SwiftUI

struct  EmotionData : Identifiable, Decodable, Hashable{
    let nomeTitulo: String
    let id: String
    let cabecalho: String
    let autorCabecalho: String
    let descricao: String
    
    let nomeImagem: String
    
    let textoObra:String
    let emotionColor: String

    var emotionColorName: Color {
        Color(emotionColor)
    }
}



struct EmotionCard: View {
    
    var emocao: EmotionData
    
    var body: some View {
        
        HStack(spacing: 0){
            Image(emocao.nomeImagem)
                .resizable()
                .scaledToFill()
                .frame(width: 249, height: 187)
                .clipped()
            
            VStack(alignment: .leading, spacing: 43){
                ZStack{
                    Rectangle()

                        .fill(emocao.emotionColorName)
                        .frame(height: 100)
                        .padding(.top, -15) // Move frame para cima
                    
                    
                    
                    VStack(alignment: .trailing){
                        //Spacer()
                        Text(emocao.nomeTitulo)
                            .font(.title3)
                            .font(Font.custom("SF Pro", size: 20))
                            .foregroundColor(.black)
                            .bold()
                            .lineLimit(1)
                            .minimumScaleFactor(0.5) // lineLimit e minimumScaleFactor, permitem ajustar o tamanho da letra dentro de um frame, line define a linha e minimum diminui a letra caso o tamanho passe de 1 linha ou do que foi definido.
                            .frame(maxWidth: 90 , alignment: .trailing) // Este comando deixa a fonte se ajustar ao tamanho natural do frame.
                            .frame(height: 25)// Altura fixa do titulo
                            .padding(.top, 45)
                        
                        
                    }
                }
                
                
                VStack{
                    Text(emocao.textoObra) // Texto descrição.
                        .font(Font.custom("SF Pro", size: 11)
                                .weight(.medium))
                        .frame(height: 65)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.top, -25)
                        .foregroundColor(.black)
                        .padding(.horizontal, 10)

                }
                
              
            }
            .frame(maxWidth: 120, maxHeight: 187, alignment: .leading) // Frame definindo a Vstack.
            .background(Color.white)
            
            
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding(.horizontal)

        
    }
}




struct EmotionsView: View {
    @ObservedObject var dtLoader = DataLoader()
//
//    init(){
//        UINavigationBar.appearance().tintColor = .white
//    } // Comando para mudar a cor do botão nativo da navigationView
//
    var body: some View {
        
        NavigationView {
            
            ScrollView{
                ForEach(dtLoader.dtEmotion) { emocao in
                    
                    NavigationLink {
                        EmotionPageView(emotionReceive:emocao)
                        
                    } label: {
                        EmotionCard(emocao: emocao)
                    }
                    
                    
                    
                }
                .navigationTitle("Emotions")
                .padding(.top)
                .toolbar{
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: {
                            print("Buscar")
                        }) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.blue)
                        }

                        NavigationLink(destination: GalleryView(), label: {
                            Image(systemName: "person.crop.circle")
                                .foregroundColor(.blue)
                        })
                    }
                }
            }
        }
    }
}


struct EmotionsView_Previews: PreviewProvider {
    static var previews: some View {
        
        EmotionsView()
    }
}
