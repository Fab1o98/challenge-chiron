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
    
    let colunas = Array(repeating: GridItem(.flexible(), spacing: 1), count: 4)
    
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
                    
                    Text("Aqui tem que colocar as tags que estão vinculadas")
                    
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
                    
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.")
                        .frame(width: 340, height: 500, alignment: .leading)
                        .padding(.vertical, -100)
                    
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
