//
//  Date+Extension.swift
//  MeuDiario
//
//  Created by Aluno 14 on 4/15/25.
//

import Foundation

extension Date{
    func formatada() -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: self)
    }
}
