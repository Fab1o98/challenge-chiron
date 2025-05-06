//
//  SpecificTag.swift
//  MeuDiario
//
//  Created by Aluno 08 on 06/05/25.
//

import SwiftUI

struct SpecificTag: View {
    var body: some View {
        NavigationView {
            VStack {
                Divider().foregroundColor(.black)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("The most felt emotions around this topic were:")
                            .font(.body)
                            .fontWeight(.regular)
                        
                        EmotionRanking(rank: 1, emotion: "Joy", logs: 10, intensity: 37)
                        EmotionRanking(rank: 2, emotion: "Pride", logs: 7, intensity: 20)
                        EmotionRanking(rank: 3, emotion: "Envy", logs: 4, intensity: 6)
                    }
                    
                    Section(header: Text("Entries")
                                .font(.title2)
                                .fontWeight(.semibold)) {
                        
                    }
                    Spacer()
                }
                .padding(20)
            }
            .navigationTitle("#Friends")
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        print("Voltar")
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                        Text("Back")
                            .font(.title2)
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        print("pesquisar")
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                    }
                    
                    Button {
                        print("Editar")
                    } label: {
                        Image(systemName: "pencil.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                    }
                    
                    Button {
                        print("Perfil")
                    } label: {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                    }
                }
            }
        }
    }
}

struct SpecificTag_Previews: PreviewProvider {
    static var previews: some View {
        SpecificTag()
    }
}

struct EmotionRanking: View {
    
    let rank: Int
    let emotion: String
    let logs: Int
    let intensity: Int
    
    var body: some View {
        HStack {
            Text("\(rank).")
                .font(.title3)
                .fontWeight(.bold)
            Text(emotion)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color(emotion))
            
            Spacer()
            
            Text("(\(logs) logs)")
                .font(.body)
                .fontWeight(.regular)
                .foregroundColor(.gray)
            
            Spacer()
            
            Text("(\(intensity) emotional intensity)")
                .font(.body)
                .fontWeight(.regular)
                .foregroundColor(.gray)
        }
    }
}

struct TagEntries: View {
    
    @StateObject private var emocaoManager = EmocaoManager()
                        
    var body: some View {
        
        let registros = emocaoManager.listarRegistros()
        
        if registros.isEmpty{
            Text("Nenhuma entrada regitrada ainda.")
                .foregroundColor(.gray)
        } else{
            ForEach(registros.sorted(by: { $0.horario > $1.horario}), id: \.horario){ registro in
                ZStack{
                    HStack{
                        VStack(alignment: .leading, spacing: 6){
                            Text(registro.emocao)
                                .font(Font.custom("SF Pro", size: 17))
                                .foregroundColor(.black)
                            
                            Text(registro.comentario)
                                .font(Font.custom("SF Pro", size: 15))
                                .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.6))
                            
                            Text(dataFormatada(registro.horario))
                                .font(Font.custom("SF Pro", size: 15))
                                .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.6))
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        HStack{
                            Text("\(registro.intensidade)")
                                .font(Font.custom("SF Pro", size: 25)
                                        .weight(.semibold)
                                )
                            
                            Text("Intensidade")
                                .font(Font.custom("Sf Pro", size: 15)
                                        .weight(.semibold)
                                )
                        }
                    }
                    .frame(width: 310, height: 70)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [.white, .orange]),
                            startPoint: UnitPoint(x: 0.60, y: 0),
                            endPoint: UnitPoint(x: 1, y: 0)
                        )
                            .frame(width: 350, height: 100)
                    )
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                }
            }
        }
    }

}
