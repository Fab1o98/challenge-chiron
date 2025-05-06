//
//  SwiftUIView.swift
//  MeuDiario
//
//  Created by Aluno 14 on 4/22/25.
//

import SwiftUI

struct JournalHome: View {
    
    @State private var mostrarFormulario = false
    @State private var needsRefresh = false
//    @Binding var corEmocao: TagsBasicas
    
    @ObservedObject var tags = TagViewModel()
    @EnvironmentObject var diarioViewModel: DiarioViewModel
    @StateObject private var emocaoManager = EmocaoManager()
    
    var body: some View {
        NavigationView{
            Form{
                VStack{
                    HStack(spacing: 0) {
                        Image(systemName: "person.fill")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 20, height: 20)
                        Text("Reflection Prompts")
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 8)
                        Image(systemName: "circle.fill")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 10, height: 10)
                    }
                    
                    Text("Hobbies")
                        .font(.system(size: 20, weight : .bold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Outside of media consumptions, do you have a hobby?")
                        .font(.system(size: 18, weight: .regular))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                }
                Section(header: Text("Entries")
                    .font(.system(size: 17, weight: .bold))
                            .foregroundColor(.black)){
                    
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
                                            .font(Font.custom("SF Pro", size: 20))
                                            .foregroundColor(.black)
                                        
                                        Text(registro.comentario)
                                            .font(Font.custom("SF Pro", size: 18))
                                            .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.6))
                                        
                                        Text(dataFormatada(registro.horario))
                                            .font(Font.custom("SF Pro", size: 18))
                                            .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.6))
                                    }
                                    .frame(width: 140, alignment: .leading)
                                    
                                    Spacer()
                                    
                                    HStack{
                                        Text("\(registro.intensidade)")
                                            .font(Font.custom("SF Pro", size: 28)
                                                    .weight(.semibold)
                                            )
                                        
                                        Text("Intensidade")
                                            .font(Font.custom("Sf Pro", size: 18)
                                                    .weight(.semibold)
                                            )
                                    }
                                }
                                .frame(width: 310, height: 87)
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.white, Color(registro.emocao)]),
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
            .navigationTitle("Journal")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Buscar")
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                    
                    Button(action: {
                        mostrarFormulario = true
                    }) {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $mostrarFormulario, onDismiss: {
                        needsRefresh.toggle()
                    }){
                        EntradasJournal()
                    }
                    
                    Button(action: {
                        print("Perfil")
                    }) {
                        Image(systemName: "person.crop.circle")
                    }
                }
            }
            .id(needsRefresh)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        JournalHome()
    }
}
