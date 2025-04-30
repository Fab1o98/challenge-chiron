import SwiftUI

struct  EmotionData : Identifiable, Hashable {
    let id:UUID
    let imageName: String
    let emotion: String
    let emotionColor: Color
    let description: String
}


struct EmotionCard: View {
    
    var emocao: EmotionData
  //  @Binding var navigationToEmotionPage: Bool // = false
    
    var body: some View {
        
        HStack(spacing: 0){
            Image(emocao.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 249, height: 187)
                .clipped()
            
            VStack(alignment: .leading, spacing: 43){
                ZStack{
                    Rectangle()
                    
                        .fill(emocao.emotionColor)
                        .frame(height: 100)
                        .padding(.top, -15) // Move frame para cima
                    
                    
                    
                    VStack(alignment: .trailing){
                        //Spacer()
                        Text(emocao.emotion)
                            .font(.title3)
                            .font(.system(size: 18, weight: .medium, design: .default))
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
                    Text(emocao.description) // Texto descrição.
                        .font(.caption)
                        .frame(height: 65)
                        .padding(.top, -25)
                        .foregroundColor(.black)
                        .padding(.horizontal, 10)
//                    NavigationLink("",
//                                   destination:EmotionPageView(emotionreceive: emocao),
//                                   isActive: $navigationToEmotionPage)
                    
                }
                
              
            }
            .frame(maxWidth: 120, maxHeight: 187, alignment: .leading) // Frame definindo a Vstack.
            .background(Color.white)
            
            
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding(.horizontal)
//        .onTapGesture {
//            navigationToEmotionPage = true     
//        }
        
    }
}




struct EmotionsView: View {
    
    static let listaEmocoes = [
        EmotionData(id: UUID(), imageName:"matissejoy", emotion: "Joy", emotionColor: Color("Joy"), description: "Le Bonheur de Vivre, \nMatisse - 1906"),
        EmotionData(id: UUID(), imageName:"pride", emotion: "Pride", emotionColor: Color("Pride"), description: "Hercules & the Nemean Lion, \nPeter Paul Rubens - ca 1615"),
        EmotionData(id: UUID(), imageName:"surprise", emotion: "Surprise", emotionColor: Color("Surprise"), description: "Tiger in a Tropical Storm, \nH.Rousseau, 1891"),
        EmotionData(id: UUID(), imageName:"guiltimg", emotion: "Guilt", emotionColor: Color("Guilt"), description: "The Guilt of Gold Teeth, \nBasquiat, 1982"),
        EmotionData(id: UUID(), imageName:"envyimg", emotion: "Envy", emotionColor: Color("Envy"), description: "Jealousy, Edvard Munch, \n1913"),
        EmotionData(id: UUID(), imageName:"sadnessimg", emotion: "Sadness", emotionColor: Color("Sadness"), description: "New York Movie, Edward Hopper, 1939"),
        EmotionData(id: UUID(), imageName:"shameimg", emotion: "Shame", emotionColor: Color("Shame"), description: "Susanna and the Elders, Artemisia Gentileschi, \n1622"),
        EmotionData(id: UUID(), imageName:"angerimg", emotion: "Anger", emotionColor: Color("Anger"), description: "Dog Woman, Paula Rego, \n1994"),
        EmotionData(id: UUID(), imageName:"reliefimg", emotion: "Relief", emotionColor: Color("Relief"), description: "Louise Tiffany, Reading; Louis C. Tiffany, \n1888"),
        EmotionData(id: UUID(), imageName:"hopeimg", emotion: "Hope", emotionColor: Color("Hope"), description: "Tree of Hope, Remain Strong; Frida Kahlo, \n1946")
        //EmotionData(imageName:"hopeimg", emotion: "Satisfaction", emotionColor: Color("Satisfaction"), description: "Tree of Hope, Remain Strong; Frida Kahlo, \n1946")
    ]
    
  //  @State private var navigateToEmotionDetails: Bool = false
    
    var body: some View {
    
        NavigationView {
            ScrollView{
                    ForEach(EmotionsView.listaEmocoes) { Emocao in
                        
                       //EmotionCard(emocao: Emocao)
                        
//                        NavigationLink(isActive: $navigateToEmotionDetails) {
//                            EmotionPageView(emotionreceive: Emocao)
//                        } label: {
//                            EmotionCard(emocao: Emocao,
//                                        navigationToEmotionPage: $navigateToEmotionDetails)
//                        }

                        
                      //  NavigationLink(

                        NavigationLink {
                            EmotionPageView(emotionreceive: Emocao)
                        } label: {
                           EmotionCard(emocao: Emocao)
                        }



                        
//                        NavigationLink {
//                            EmotionPageView(emotionreceive: Emocao)
//                        } label: {
//                            EmotionCard(emocao: Emocao)
//
//                        }
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
                        }

                        NavigationLink(destination: PerfilHome(), label: {Image(systemName: "person.circle")})
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
