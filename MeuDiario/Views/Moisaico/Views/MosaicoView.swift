import SwiftUI

extension Color {
    init(rgb: [Int]) {
        self.init(red: Double(rgb[0]) / 255.0, green: Double(rgb[1]) / 255.0, blue: Double(rgb[2]) / 255.0)
    }
}

struct MosaicoView: View {
    private let linhas = 8
    private let colunas = 6

    @State private var quadradinhos: [[[Int]]] = Array(
        repeating: Array(repeating: [0, 0, 0], count: 6),
        count: 8
    )
    @State private var preenchido: [[Color]] = Array(
        repeating: Array(repeating: Color("NadaAtribuido"), count: 6),
        count: 8
    )

    @StateObject private var emocaoManager = EmocaoManager()

    private var tamanho: CGFloat { 40 }

    var body: some View {
        VStack(spacing: 0) {
            // Grid
            VStack(spacing: 0) {
                ForEach(0..<linhas, id: \.self) { y in
                    HStack(spacing: 0) {
                        ForEach(0..<colunas, id: \.self) { x in
                            Rectangle()
                                .fill(preenchido[y][x])
                                .frame(width: tamanho, height: tamanho)
                        }
                    }
                }
            }
            Spacer()

            // Botão para iniciar o preenchimento automático
            Button("Paint!") {
                autoFillGrid()
            }
            .padding(20)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
    }
    private func autoFillGrid() {
        let registros = emocaoManager.listarRegistros()
        let processor = MosaicoProcessor()
        let entradas = processor.processarEntradas(registros, paraSemanaDa: Date())

        quadradinhos = Array(
            repeating: Array(repeating: [0, 0, 0], count: colunas),
            count: linhas
        )

        guard !entradas.isEmpty else {
            preenchido = Array(
                repeating: Array(repeating: Color("NadaAtribuido"), count: colunas),
                count: linhas
            )
            return
        }

        var estoque: [String: Int] = Dictionary(uniqueKeysWithValues:
            entradas.map { ($0.emocao, $0.quantidade) }
        )

        func crossMagnitudeSquared(_ a: [Int], _ b: [Int]) -> Int {
            let cx = a[1]*b[2] - a[2]*b[1]
            let cy = a[2]*b[0] - a[0]*b[2]
            let cz = a[0]*b[1] - a[1]*b[0]
            return cx*cx + cy*cy + cz*cz
        }

        let emoções = estoque.keys.sorted { estoque[$0]! > estoque[$1]! }
        var pos: (x: Int, y: Int)? = nil

        if let principal = emoções.first,
           let corPrimeira = ColorManager.rgb(for: principal),
           estoque[principal]! > 0 {
            let x0 = Int.random(in: 0..<colunas)
            let y0 = Int.random(in: 0..<linhas)
            quadradinhos[y0][x0] = corPrimeira
            estoque[principal]! -= 1
            pos = (x0, y0)
        }

        // Começa preenchimento animado
        var delay: Double = 0.0

        // Variável fora da função, no escopo de autoFillGrid:
        var emocaoAtual: String? = estoque.keys.randomElement()

        func preencherProximo() {
            guard estoque.values.reduce(0, +) > 0 else {
                preenchido = quadradinhos.map { $0.map { Color(rgb: $0) } }
                return
            }

            // Troca de emoção se atual zerar
            if let atual = emocaoAtual, estoque[atual] == 0 {
                let restantes = estoque.filter { $0.value > 0 }
                if let nova = restantes.keys.randomElement() {
                    emocaoAtual = nova
                } else {
                    preenchido = quadradinhos.map { $0.map { Color(rgb: $0) } }
                    return
                }
            }

            guard let emo = emocaoAtual,
                  estoque[emo]! > 0,
                  let corEmo = ColorManager.rgb(for: emo) else {
                preenchido = quadradinhos.map { $0.map { Color(rgb: $0) } }
                return
            }

            var pintou = false
            if let (xA, yA) = pos {
                for _ in 0..<12 {
                    let dx = Int.random(in: -1...1)
                    let dy = Int.random(in: -1...1)
                    let nx = xA + dx, ny = yA + dy

                    if (0..<colunas).contains(nx),
                       (0..<linhas).contains(ny),
                       quadradinhos[ny][nx] == [0,0,0],
                       crossMagnitudeSquared(corEmo, quadradinhos[ny][nx]) < 700000000 {

                        quadradinhos[ny][nx] = corEmo
                        estoque[emo]! -= 1
                        pos = (nx, ny)
                        pintou = true
                        break
                    }
                }
            }

            if !pintou {
                for _ in 0..<100 {
                    let nx = Int.random(in: 0..<colunas)
                    let ny = Int.random(in: 0..<linhas)
                    if quadradinhos[ny][nx] == [0,0,0] {
                        quadradinhos[ny][nx] = corEmo
                        estoque[emo]! -= 1
                        pos = (nx, ny)
                        break
                    }
                }
            }

            preenchido = quadradinhos.map { $0.map { Color(rgb: $0) } }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                preencherProximo()
            }
        }


        preencherProximo()
    }

}

struct MosaicoView_Previews: PreviewProvider {
    static var previews: some View {
        MosaicoView()
    }
}

