//
//  ColorsTag.swift
//  MeuDiario
//
//  Created by Aluno 14 on 5/7/25.
//

import SwiftUI

struct ColorsTag {
    static let Yellow = Color(hex: "FFD700") // Amarelo Ouro
    static let Blue = Color(hex: "87CEEB") // Azul Celeste
    static let Orange = Color(hex: "FF4500") // Laranja Avermelhado
    static let Purple = Color(hex: "9400D3") // Roxo Profundo
    static let Green = Color(hex: "3CB371") // Verde Marinho
    static let Gray = Color(hex: "696969") // Cinza Escuro
    static let Brown = Color(hex: "A0522D") // Marrom Siena
    static let Pink = Color(hex: "FF69B4") // Rosa Quente
}

extension Color {
    init(hex: String) {
        var cleanHex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        var rgbValue: UInt64 = 0

        Scanner(string: cleanHex).scanHexInt64(&rgbValue)

        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}
