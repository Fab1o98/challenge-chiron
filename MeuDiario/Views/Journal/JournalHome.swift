//
//  SwiftUIView.swift
//  MeuDiario
//
//  Created by Aluno 14 on 4/22/25.
//

import SwiftUI

struct JournalHome: View {
    
    @State private var mostrarFormulario = false
    
    var body: some View {
        NavigationView{
            Form{
                VStack{ //a
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
                    .sheet(isPresented: $mostrarFormulario){
                        EntradasJournal()
                    }

                    Button(action: {
                        print("Perfil")
                    }) {
                        Image(systemName: "person.crop.circle")
                    }
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        JournalHome()
    }
}
