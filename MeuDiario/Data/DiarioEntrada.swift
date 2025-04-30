import Foundation

struct DiarioEntrada: Codable, Identifiable {
    var id = UUID()
    var emocao: Emocao
    var comentario: String
    var horario: Date
    var intensidade: Int
}
