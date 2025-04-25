//
//  DataFormatada.swift
//  MeuDiario
//
//  Created by Aluno 14 on 4/24/25.
//

import Foundation

private var dataAtual = Date()

func dataFormatada() -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US")
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .none
    return dateFormatter.string(from: dataAtual)
}
