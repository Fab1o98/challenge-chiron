//
//  HorarioFormatado.swift
//  MeuDiario
//
//  Created by Aluno 14 on 4/24/25.
//

import Foundation

private var dataAtual = Date()

func horarioFormatado() -> String{
    let timeFormatter = DateFormatter()
    timeFormatter.dateStyle = .none
    timeFormatter.timeStyle = .medium
    timeFormatter.dateFormat = "HH:mm"
    return timeFormatter.string(from: dataAtual)
}
