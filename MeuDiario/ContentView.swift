//
//  ContentView.swift
//  MeuDiario
//
//  Created by Aluno 14 on 4/10/25.
//

import SwiftUI

struct TagsView: View {
    var body: some View {
        Text("Tags")
    }
}

struct JournalView: View {
    @ObservedObject var viewModel: DiarioViewModel
    @State private var isAddingEntry = false
    
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
                        print("Adicionar")
                    }) {
                        Image(systemName: "plus")
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

struct EmotionView: View {
    @ObservedObject var viewModel: DiarioViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.emocoes) { emocao in
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(emocao.nome)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                        Text(emocao.descricao)
                            .font(.system(size: 18, weight: .light))
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical)

                    Spacer()

                    Image(emocao.imagemNome)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 70)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black.opacity(0.1), lineWidth: 1)
                        )
                }
            }
            .listStyle(.plain)
            .navigationTitle("Emoções")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Buscar")
                    }) {
                        Image(systemName: "magnifyingglass")
                    }

                    Button(action: {
                        print("Perfil") // aaaaa
                    }) {
                        Image(systemName: "person.crop.circle")
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    @StateObject var viewMode = DiarioViewModel()
    
    var body: some View {
        TabView {
            TagsView()
                .tabItem {
                    Image(systemName: "tag")
                    Text("Tags")
                }
                .tag(0)

            JournalView(viewModel: viewMode)
                .tabItem {
                    Image(systemName: "book")
                    Text("Journal")
                }
                .tag(1)

            EmotionView(viewModel: viewMode)
                .tabItem {
                    Image(systemName: "face.smiling")
                    Text("Emotion")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
