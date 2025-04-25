import SwiftUI

struct  EmotionData : Identifiable {
       let id = UUID()
       let imageName: String
       let emotion: String
       let emotionColor: Color
       let description: String
   }


struct EmotionCard: View {
    
    var emocao: EmotionData
    
    var body: some View {
        
        HStack(spacing: 0){
            Image(emocao.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 249, height: 187)
                .clipped()
            
            VStack(alignment: .leading, spacing: 43){
                Text(emocao.emotion)
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .frame(height: 65)// Altura fixa do titulo
                    .padding()
                    .background(emocao.emotionColor)
                    
                
                Text(emocao.description)
                    .font(.caption)
                    .foregroundColor(.black)
                    .padding(.horizontal, 5)
                    
                
            }
            .frame(maxWidth: 120, maxHeight: 187, alignment: .leading)
            .background(Color.white)
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
    
}

struct EmotionsView: View {
    
    let listaEmocoes = [
        EmotionData(imageName:"matissejoy", emotion: "Joy", emotionColor:.orange, description: "Le Bonheur de Vivre, \n Matisse - 1906"),
        EmotionData(imageName:"pride", emotion: "Pride", emotionColor:.purple, description: "Hercules & the Nemean Lion, \n Peter Paul Rubens - ca 1615"),
        EmotionData(imageName:"surprise", emotion: "Surprise", emotionColor:.green, description: "Tiger in a Tropical Storm, \n H.Rousseau, 1891")
    ]
    
    var body: some View {
    
        
        VStack(alignment: .leading, spacing: 20){
            Text("Emotions")
                .font(.largeTitle)
                .bold()
                .padding(.horizontal)
            
            ForEach(listaEmocoes) { Emocao in
                EmotionCard(emocao: Emocao)}
            
            
        }
    }
}

struct EmotionsView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionsView()
    }
}
