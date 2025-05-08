//
//  DiarioEntry.swift
//  MeuDiario
//
//  Created by Aluno 14 on 5/7/25.
//

import Foundation

struct DiarioEntry: Identifiable, Codable {
    let id: UUID
    var data: Date
    var texto: String
    var emocao: Emocao?
    var intensidade: Int
    var tags: [TagsBasicas.ID] // Array para armazenar os IDs das TagsBasicas associadas

    init(id: UUID = UUID(), data: Date = Date(), texto: String = "", emocao: Emocao? = nil, intensidade: Int = 0, tags: [TagsBasicas.ID] = []) {
        self.id = id
        self.data = data
        self.texto = texto
        self.emocao = emocao
        self.intensidade = intensidade
        self.tags = tags
    }
}
