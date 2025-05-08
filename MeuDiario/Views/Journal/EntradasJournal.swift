//
//  Entradas_journal.swift
//  MeuDiario
//
//  Created by Aluno 14 on 4/23/25.
// .

import SwiftUI

struct EntradasJournal: View {
    
    @EnvironmentObject var emocaoList: DiarioViewModel
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var tags = TagViewModel()
    @StateObject private var emocaoManager = EmocaoManager()
    @State var selectedTag = "Pride"
    @State var intensidade: Double = 2.5
    @State var texto = ""
    @State var horario = Date()
    @State private var emocao: Emocao?
    @State private var showingAddSheet = false
    @State private var userTags: [TagsBasicas] = TagStorage.load()
    
    let colunas = Array(repeating: GridItem(.flexible(), spacing: 1), count: 4)
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    HStack{
                        Image(systemName: "calendar.circle")
                            .font(.system(size: 60))
                        
                        VStack{
                            Text(dataFormatada(horario))
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)

                            DatePicker(
                                "Time",
                                selection: $horario,
                                displayedComponents: .hourAndMinute
                            )
                            .padding(.vertical, -23)
                            .labelsHidden()
                            .datePickerStyle(.compact)
                            .font(.system(size:20, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                                
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 15)
                    .frame(width: 390, height: 150, alignment: .leading)
                    
                    HStack{
                        Text("Emotion:")
                            .frame(width: 80, height: 40, alignment: .leading)
                            .padding(.vertical, 20)
                        
                        Picker("Select an emotion", selection: $emocao){
                            ForEach(emocaoList.emocoes, id: \.self){ emocao in
                                Text(emocao.nome).tag(emocao as Emocao?)
                            }
                        }
                        .pickerStyle(.menu)
                        
                    }
                    .frame(width: 345, alignment: .leading)
                    .padding(.vertical, -35)
                    
                    Text("Intensity:")
                        .frame(width: 345, alignment: .leading)
                        .padding(.vertical, 20)
                    
                    ZStack{
                        Slider(value: $intensidade, in: 1...5, step: 1)
                            .padding(.vertical, -15)
                            .frame(width: 300, alignment: .leading)
                        HStack {
                            Text("1")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            
                            Spacer()
                            Text("5")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                        }
                        .padding(.horizontal, 53)
                        .foregroundColor(.gray)
                    }
                    .padding(.horizontal, -30)
                    
                    Text("Comments:")
                        .padding(.vertical, 15)
                        .frame(width: 345, alignment: .leading)
                    
                    TextField("Write...", text: $texto)
                        .padding(.horizontal, -8)
                        .padding(.vertical, -60)
                        .padding()
                        .frame(width: 345, height: 140, alignment: .leading)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                    
                    Text("Tags:")
                        .padding()
                        .frame(width: 375, height: 30, alignment: .leading)
                    
                    HStack{
                        LazyVGrid(columns: colunas, spacing: 0){
                            ForEach(userTags, id: \.id){ tag in
                                Button(action: {
                                    selectedTag = tag.nome
                                }) {
                                    Text(tag.nome)
                                        .font(.system(size: 15))
                                        .padding()
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(selectedTag == tag.nome ? Color.blue : Color.gray.opacity(0.2))
                                                .frame(width: 75, height: 38)
                                                .background(Color.gray.opacity(0.2))
                                                .cornerRadius(10)
                                        )
                                }
                            }
                            Button(action: {
                                showingAddSheet = true
                            }) {
                                Image(systemName: "plus.circle")
                            }
                            .frame(width: 70, height: 20, alignment: .leading)
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                        }
                        .frame(width: 360)
                    }
                    
                    Spacer()
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Done") {
                            if let index = userTags.firstIndex(where: {$0.nome == selectedTag}) {
                                userTags[index].qtd += 1
                                TagStorage.save(userTags)
                            }
                            
                            emocaoManager.salvarEmocaoJSON(
                                emocao: emocao?.nome ?? "Joy",
                                    comentario: texto,
                                    horario: horario,
                                    intensidade: Int(intensidade)
                                )
                            dismiss()
                        }
                    }
                }
                .sheet(isPresented: $showingAddSheet) {
                    AdicionarTags(tags: $userTags)
                }
            }
        }
    }
}

struct EntradasJournal_Previews: PreviewProvider {
    static var previews: some View {
        EntradasJournal()
            .environmentObject(DiarioViewModel())
    }
}
