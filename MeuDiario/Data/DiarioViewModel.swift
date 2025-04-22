//
//  DiarioViewModel.swift
//  MeuDiario
//
//  Created by Aluno 14 on 4/10/25.
//

import Foundation

class DiarioViewModel: ObservableObject{
    @Published var entradas: [DiarioEntrada] = []
    @Published var emocoes: [Emocao] = [
        Emocao(nome: "Pride", descricao: "descrição", intensidade: 8, corHex: "#FFA09B", imagemNome: "Pride"),
        Emocao(nome: "Joy", descricao: "descrição", intensidade: 6, corHex: "#FFDC36", imagemNome: "Joy"),
        Emocao(nome: "Satisfaction", descricao: "descrição", intensidade: 9, corHex: "#FDF700", imagemNome: "Satisfaction"),
        Emocao(nome: "Relief", descricao: "descrição", intensidade: 7, corHex: "#EEF804", imagemNome: "Relief"),
        Emocao(nome: "Hope", descricao: "descrição", intensidade: 3, corHex: "#C9F408", imagemNome: "Hope"),
        Emocao(nome: "Anger", descricao: "descrição", intensidade: 3, corHex: "#FF4101", imagemNome: "Anger"),
        Emocao(nome: "Sadness", descricao: "descrição", intensidade: 3, corHex: "#89B0AA", imagemNome: "Sadness"),
        Emocao(nome: "Fear", descricao: "descrição", intensidade: 3, corHex: "#759AB7", imagemNome: "Fear"),
        Emocao(nome: "Shame", descricao: "descrição", intensidade: 3, corHex: "#01AFF6", imagemNome: "Fear"),
        Emocao(nome: "Guilt", descricao: "descrição", intensidade: 3, corHex: "#00C4F5", imagemNome: "Fear"),
        Emocao(nome: "Envy", descricao: "descrição", intensidade: 3, corHex: "#7E8DD2", imagemNome: "Fear"),
        Emocao(nome: "Reflection", descricao: "descrição", intensidade: 3, corHex: "#017AFF", imagemNome: "Fear"),
        Emocao(nome: "Pride claro", descricao: "descrição", intensidade: 3, corHex: "#FDBFBE", imagemNome: "Fear"),
        Emocao(nome: "Joy claro", descricao: "descrição", intensidade: 3, corHex: "#FFE072", imagemNome: "Fear"),
        Emocao(nome: "Satisfaction claro", descricao: "descrição", intensidade: 3, corHex: "#FCFA59", imagemNome: "Fear"),
        Emocao(nome: "Relief claro", descricao: "descrição", intensidade: 3, corHex: "#FCFA5A", imagemNome: "Fear"),
        Emocao(nome: "Hope claro", descricao: "descrição", intensidade: 3, corHex: "#D8F72F", imagemNome: "Fear"),
        Emocao(nome: "Sadness claro", descricao: "descrição", intensidade: 3, corHex: "#93BBB4", imagemNome: "Fear"),
        Emocao(nome: "Fear claro", descricao: "descrição", intensidade: 3, corHex: "#8CAAC1", imagemNome: "Fear"),
        Emocao(nome: "Shame claro", descricao: "descrição", intensidade: 3, corHex: "#54C2F8", imagemNome: "Fear"),
        Emocao(nome: "Guilt claro", descricao: "descrição", intensidade: 3, corHex: "#30CDFB", imagemNome: "Fear"),
        Emocao(nome: "Envy claro", descricao: "descrição", intensidade: 3, corHex: "#8992D9", imagemNome: "Fear"),
        Emocao(nome: "Anger claro", descricao: "descrição", intensidade: 3, corHex: "#FF7764", imagemNome: "Fear")
    ]
    
    let chave = "entradas_diario"
    
    init(){
        carregarEntradas()
    }
    
    func adicionarEntrada(_ entrada: DiarioEntrada){
        entradas.append(entrada)
        salvarEntradas()
    }
    
    func salvarEntradas(){
        if let dados = try? JSONEncoder().encode(entradas){
            UserDefaults.standard.set(dados, forKey: chave)
        }
    }
    
    func carregarEntradas(){
        if let dados = UserDefaults.standard.data(forKey: chave),
           let entradasSalvas = try? JSONDecoder().decode([DiarioEntrada].self, from: dados){
            entradas = entradasSalvas
        }
    }
    
    func deletarEntrada(at offsets: IndexSet){
        entradas.remove(atOffsets: offsets)
        salvarEntradas()
    }
}
