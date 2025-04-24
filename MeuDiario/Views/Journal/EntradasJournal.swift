//
//  Entradas_journal.swift
//  MeuDiario
//
//  Created by Aluno 14 on 4/23/25.
//

import SwiftUI

struct EntradasJournal: View {
    
    @State private var dataAtual = Date()
    let tags = ["Books", "College", "Dating", "Family", "Frineds", "Health", "Identity", "Money", "Movies", "Travel", "Work"]
    @State private var selectedTag = "Books"
    @State private var intensidade: Double = 2.5
    @State private var texto = ""
    
    let colunas = Array(repeating: GridItem(.flexible(), spacing: 1), count: 4)
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    print("Done")
                }) {
                    Text("Cancel")
                        .foregroundColor(.black)
                }
                Spacer()
            }
            HStack{
                Image(systemName: "calendar.circle")
                    .font(.system(size: 60))
                
                VStack{
                    Text(dataFormatada())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(horarioFormatado())
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                
                Spacer()
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 55)
            
            HStack{
                Text("Emotion:")
                
                Picker("Selecione a tag", selection: $selectedTag){
                    ForEach(tags, id: \.self){
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
                
            }
            .frame(width: 345, alignment: .leading)
            .padding(.vertical, -35)
            
            Text("Intensity:")
                .frame(width: 345, alignment: .leading)
                .padding()
            
            ZStack{
                Slider(value: $intensidade, in: 0...5, step: 1)
                    .padding(.vertical, -15)
                    .frame(width: 300, alignment: .leading)
                HStack {
                    Text("0")
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
                    ForEach(tags, id: \.self){ tag in
                        Text("\(tag)")
                            .font(.system(size: 15))
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(1), lineWidth: 1)
                                    .frame(width: 75, height: 38)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                            )
                    }
                }
                .frame(width: 360)
            }
            
            Spacer()
        }
        .padding(.vertical, -15)
    }
    
    func dataFormatada() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: dataAtual)
    }
    
    func horarioFormatado() -> String{
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .none
        timeFormatter.timeStyle = .medium
        timeFormatter.dateFormat = "HH:mm"
        return timeFormatter.string(from: dataAtual)
    }
}

struct EntradasJournal_Previews: PreviewProvider {
    static var previews: some View {
        EntradasJournal()
    }
}
