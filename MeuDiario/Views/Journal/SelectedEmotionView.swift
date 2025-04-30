//
//  SelectedEmotionView.swift
//  MeuDiario
//
//  Created by Aluno 14 on 4/30/25.
//

import SwiftUI

struct SelectedEmotionView: View {
    
    @EnvironmentObject var diarioviewModel: DiarioViewModel
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(
                    gradient: Gradient(colors: [.cyan, .white]),
                    startPoint: UnitPoint(x: 0, y: 0),
                    endPoint: UnitPoint(x: 0, y: 0.45)
                )
                    .ignoresSafeArea()
                
                VStack{
                    HStack{
                        Text("Emoção")
                            .font(Font.custom("SF Pro", size: 30)
                                    .weight(.bold)
                            )
                        
                        Spacer()
                        
                        Text("5")
                            .font(Font.custom("SF Pro", size: 30)
                                    .weight(.bold)
                            )
                    }
                    .frame(width: 340, height: 45)
                    .padding(.vertical, 40)
                    
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                            //ação para deletar
                    }) {
                        Image(systemName: "trash.fill")
                    }
                    .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(.black)
                }
            }
        }
    }
}

struct SelectedEmotionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedEmotionView()
    }
}
