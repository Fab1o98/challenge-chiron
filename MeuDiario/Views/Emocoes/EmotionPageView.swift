//
//  EmotionPageView.swift
//  MeuDiario
//
//  Created by Aluno 10 on 29/04/25.
//

import SwiftUI

struct EmotionPageView: View {
    var emotionreceive: EmotionData
    
    var body: some View {
        
        ScrollView{
            
            VStack(alignment: .leading, spacing: 0){
                
                ZStack(alignment: .bottomLeading){ // Levar o texto para baixo
                    Image("matissejoy")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 290)
                        .clipped()
                    
                    
                    VStack(alignment: .leading, spacing: 5){
                        Text("Aqui vai puxar Titulo")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(maxHeight: 50)
                        
                        Text("Descriçao IMG")
                            .foregroundColor(.white)
                    }
                    .padding()
                }
                
                
                VStack{
                    
                    Text(emotionreceive.emotion)
                        .italic()
                        .bold()
                        .fontWeight(.medium)
                    
                    Text("TEXTO")
                        .font(.body)
                    
                    Text("Entradas")
                        .font(.title3)
                        .bold()
                    Image(systemName:"book")
                    NavigationLink("Proxima Pagina")  {
                        Text("Pagina 2!!")
                    }
                }
                .padding()
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}



//struct EmotionPageView_Previews: PreviewProvider {
// static var previews: some View {
//     EmotionPageView(emotionreceive: )
//    }
// }
