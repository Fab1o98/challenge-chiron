//
//  Emocao.swift
//  MeuDiario
//
//  Created by Aluno 14 on 4/10/25.
//

import Foundation
import SwiftUI

struct Emocao: Identifiable, Codable, Hashable{
    var id = UUID()
    var nome: String
    var descricao: String
    var intensidade: Int
    var corHex: String
    var imagemNome: String
    
    var cor: Color{
        Color(corHex)
    }
}
