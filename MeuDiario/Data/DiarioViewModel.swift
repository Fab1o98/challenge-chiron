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
        Emocao(nome: "Pride", descricao: "descrição", intensidade: 8),
        Emocao(nome: "Joy", descricao: "descrição", intensidade: 6),
        Emocao(nome: "Satisfaction", descricao: "descrição", intensidade: 9),
        Emocao(nome: "Relief", descricao: "descrição", intensidade: 7),
        Emocao(nome: "Hope", descricao: "descrição", intensidade: 3),
        Emocao(nome: "Anger", descricao: "descrição", intensidade: 3),
        Emocao(nome: "Sadness", descricao: "descrição", intensidade: 3),
        Emocao(nome: "Fear", descricao: "descrição", intensidade: 3),
        Emocao(nome: "Shame", descricao: "descrição", intensidade: 3),
        Emocao(nome: "Guilt", descricao: "descrição", intensidade: 3),
        Emocao(nome: "Envy", descricao: "descrição", intensidade: 3),
        Emocao(nome: "Reflection", descricao: "descrição", intensidade: 3),
        Emocao(nome: "Pride claro", descricao: "descrição", intensidade: 3),
        Emocao(nome: "Joy claro", descricao: "descrição", intensidade: 3),
        Emocao(nome: "Satisfaction claro", descricao: "descrição", intensidade: 3),
        Emocao(nome: "Relief claro", descricao: "descrição", intensidade: 3),
        Emocao(nome: "Hope claro", descricao: "descrição", intensidade: 3),
        Emocao(nome: "Sadness claro", descricao: "descrição", intensidade: 3),
        Emocao(nome: "Fear claro", descricao: "descrição", intensidade: 3),
        Emocao(nome: "Shame claro", descricao: "descrição", intensidade: 3),
        Emocao(nome: "Guilt claro", descricao: "descrição", intensidade: 3),
        Emocao(nome: "Envy claro", descricao: "descrição", intensidade: 3),
        Emocao(nome: "Anger claro", descricao: "descrição", intensidade: 3)
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
