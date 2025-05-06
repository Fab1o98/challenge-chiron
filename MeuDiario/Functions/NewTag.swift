//
//  NewTag.swift
//  MeuDiario
//
//  Created by Aluno 14 on 4/24/25.
//

import Foundation

class TagViewModel : ObservableObject{
    @Published var tags: [TagsBasicas] = []

        init() {
            carregarTags()
        }

        func carregarTags() {
            self.tags = TagStorage.load()
        }

        func salvarTags() {
            TagStorage.save(tags)
        }
}
