//
//  NewTag.swift
//  MeuDiario
//
//  Created by Aluno 14 on 4/24/25.
//

import Foundation

class TagViewModel : ObservableObject{
    @Published var tags = ["Books", "College", "Dating", "Family", "Frineds", "Health", "Identity", "Money", "Movies", "Travel", "Work"]
    
    func adicionarTag(_ tagDigitada : String) {
        let trimmed = tagDigitada.trimmingCharacters(in : .whitespaces)
        guard !trimmed.isEmpty, !tags.contains(trimmed) else {return}
        tags.append(trimmed)
    }
}
