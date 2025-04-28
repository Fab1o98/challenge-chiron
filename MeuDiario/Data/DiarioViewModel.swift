import Foundation
import CoreData

class DiarioViewModel: ObservableObject {
    @Published var entradas: [DiarioEntrada] = []
    @Published var emocoes = [
        Emocao(nome: "Felicidade", descricao: "Sinto-me cheio de alegria e contentamento.", intensidade: 9),
        Emocao(nome: "Tristeza", descricao: "Sinto-me para baixo e melancólico.", intensidade: 3),
        Emocao(nome: "Raiva", descricao: "Sinto-me irritado e frustrado.", intensidade: 8),
        Emocao(nome: "Surpresa", descricao: "Algo inesperado aconteceu, e estou em choque.", intensidade: 6),
        Emocao(nome: "Medo", descricao: "Estou apreensivo e com sensação de insegurança.", intensidade: 7),
        Emocao(nome: "Orgulho", descricao: "Sinto-me satisfeito e confiante nas minhas conquistas.", intensidade: 8),
        Emocao(nome: "Vergonha", descricao: "Sinto-me constrangido e envergonhado.", intensidade: 4),
        Emocao(nome: "Esperança", descricao: "Tenho a sensação de que algo bom vai acontecer.", intensidade: 5),
        Emocao(nome: "Gratidão", descricao: "Sinto-me grato pelas pessoas e oportunidades na minha vida.", intensidade: 10),
        Emocao(nome: "Solidão", descricao: "Sinto-me desconectado e isolado dos outros.", intensidade: 2)
    ]
}
