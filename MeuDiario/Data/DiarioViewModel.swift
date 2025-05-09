import Foundation
import CoreData

class DiarioViewModel: ObservableObject {
    @Published var entradas: [DiarioEntrada] = []
    @Published var emocoes = [
        Emocao(nome: "Pride", descricao: "Sinto-me satisfeito e confiante nas minhas conquistas.", intensidade: 8),
        Emocao(nome: "Joy", descricao: "Sinto-me cheio de alegria e contentamento.", intensidade: 9),
        Emocao(nome: "Relief", descricao: "Sinto-me grato pelas pessoas e oportunidades na minha vida.", intensidade: 10),
        Emocao(nome: "Hope", descricao: "Tenho a sensação de que algo bom vai acontecer.", intensidade: 5),
        Emocao(nome: "Surprise", descricao: "Algo inesperado aconteceu, e estou em choque.", intensidade: 6),
        Emocao(nome: "Sadness", descricao: "Sinto-me para baixo e melancólico.", intensidade: 3),
        Emocao(nome: "Fear", descricao: "Estou apreensivo e com sensação de insegurança.", intensidade: 7),
        Emocao(nome: "Shame", descricao: "Sinto-me constrangido e envergonhado.", intensidade: 4),
        Emocao(nome: "Guilt", descricao: "Sinto-me constrangido e envergonhado.", intensidade: 4),
        Emocao(nome: "Envy", descricao: "Sinto-me constrangido e envergonhado.", intensidade: 4),
        Emocao(nome: "Anger", descricao: "Sinto-me irritado e frustrado.", intensidade: 8),
        Emocao(nome: "Anxiety", descricao: "Sinto-me desconectado e isolado dos outros.", intensidade: 2)
    ]
}
