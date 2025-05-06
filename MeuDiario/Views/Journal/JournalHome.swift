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
    @State private var isShowingAddReflection = false
    
    @ObservedObject var tags = TagViewModel()
    @EnvironmentObject var diarioViewModel: DiarioViewModel
    @StateObject private var emocaoManager = EmocaoManager()
    
    var body: some View {
        NavigationView{
            Form{
                Button {
                    isShowingAddReflection = true
                } label: {
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
                        Text("Outside of media consumption, do you have a hobby?")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                    }
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
                                    
                                    //Spacer()
                                    
                                    /*ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(LinearGradient(
                                                gradient: Gradient(colors: [.red, .orange]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            ))

                                        Text("Intensidade: \(registro.intensidade)")
                                            .font(Font.custom("SF Pro", size: 15))
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 150, height: 70)*/
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
                    
                    NavigationLink(destination: GalleryView(), label: {
                        Image(systemName: "person.crop.circle")
                    })
                }
            }
            .id(needsRefresh)
            .sheet(isPresented: $isShowingAddReflection) {
                AddReflection(isShowingAddReflection: $isShowingAddReflection)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        JournalHome()
    }
}
