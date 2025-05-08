//
//  EmotionPageView.swift
//  MeuDiario
//
//  Created by Aluno 10 on 29/04/25.
//

import SwiftUI

struct EmotionPageView: View {
    let emotionReceive: EmotionData
        
    var body: some View {
        
        ScrollView{
            
            VStack(alignment: .leading, spacing: 0){

                ZStack(alignment: .bottomLeading){ // Levar o texto para baixo
                    Image(emotionReceive.nomeImagem)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 290)
                        .clipped()


                    VStack(alignment: .leading, spacing: 5){
                        Text(emotionReceive.nomeTitulo)
                            .font(.title)
                            .font(Font.custom("SF Pro", size: 35))
                            .bold()
                            .foregroundColor(.white)
                            .frame(maxHeight: 50)

                        Text(emotionReceive.textoObra)
                            .foregroundColor(.white)

                    }
                    .padding()
                    
                }


                VStack(alignment: .leading, spacing: 16){

                    Text(emotionReceive.cabecalho)
                        .font(.body)
                        .font(Font.custom("SF Pro", size: 17))
                        .italic()
                        .bold()
                        

                    Text(emotionReceive.autorCabecalho)
                        .font(Font.custom("SF Pro", size: 17))
                    
                    Text(emotionReceive.descricao)
                        .font(Font.custom("SF Pro", size: 17))
                    

                }
                .padding()
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}
