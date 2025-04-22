//
//  EmocoesView.swift
//  MeuDiario
//
//  Created by Aluno 14 on 4/15/25.
//

import SwiftUI

struct EmocoesView: View {
    @StateObject var viewMode = DiarioViewModel()
    
    var body: some View {
        List(viewMode.emocoes) { emocao in
            HStack{
                VStack(alignment: .leading, spacing: 4) {
                    Text(emocao.nome)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                    Text(emocao.descricao)
                        .font(.system(size: 18, weight: .light))
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
                
                Spacer()
                
                Image(emocao.imagemNome)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .background(Color.gray.opacity(0.2)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black.opacity(0.1), lineWidth: 1))
                    )
            }
        }
        .listStyle(.plain)
    }
}

struct EmocoesView_Previews: PreviewProvider {
    static var previews: some View {
        EmocoesView()
    }
}
