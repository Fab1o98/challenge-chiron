//
//  SalvarEmocao.swift
//  MeuDiario
//
//  Created by Aluno 14 on 4/25/25.
//

import Foundation

class EmocaoManager{
    static let shared = EmocaoManager()
    private(set) var emocaoList: [Emocao] = []
    
    private init() {}
    
    func salvarEmocao(nome: String, descricao: String, intensidade: Int){
        let novaEmocao = Emocao(
            nome: nome,
            descricao: descricao,
            intensidade: intensidade
        )
        
        emocaoList.append(novaEmocao)
    }
}
