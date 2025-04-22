import SwiftUI

struct RelatorioView: View {
    let entradas: [DiarioEntrada]
    
    @Environment(\.dismiss) var dismiss

    struct EmocaoResumo: Identifiable {
        let id = UUID()
        let nome: String
        let cor: Color
        let mediaIntensidade: Int
    }

    var resumoEmocoes: [EmocaoResumo] {
        let agrupadas = Dictionary(grouping: entradas) { $0.emocao.nome }

        return agrupadas.compactMap { (nome, entradas) in
            guard let exemplo = entradas.first else { return nil }
            let media = entradas.map { $0.emocao.intensidade }.reduce(0, +) / entradas.count

            return EmocaoResumo(
                nome: nome,
                cor: exemplo.emocao.cor,
                mediaIntensidade: media
            )
        }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Relatório Emocional")
                        .font(.title2)
                        .bold()
                        .padding(.top)
                        .padding(.horizontal)

                    ForEach(resumoEmocoes) { emocao in
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text("\(emocao.nome)")
                                    .font(.headline)
                                Spacer()
                                Text("Intensidade: \(emocao.mediaIntensidade)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }

                            GeometryReader { geo in
                                Rectangle()
                                    .fill(emocao.cor)
                                    .frame(width: CGFloat(emocao.mediaIntensidade) / 10 * geo.size.width, height: 20)
                                    .cornerRadius(5)
                            }
                            .frame(height: 20)
                        }
                        .padding(.horizontal)
                    }

                    Spacer()
                }
                .padding(.bottom)
            }
            .navigationTitle("Relatório")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {
                dismiss()
            }) {
                HStack{
                    Image(systemName: "chevron.left")
                    Text("Voltar")
                }
            })
        }
    }
}

