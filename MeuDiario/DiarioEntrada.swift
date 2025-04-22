//
//  File.swift
//  MeuDiario
//
//  Created by Aluno 14 on 4/10/25.
//

import Foundation

struct DiarioEntrada: Identifiable, Codable{
    var id = UUID()
    var titulo: String
    var descricao : String
    var data: Date
    var emocao: Emocao
}
