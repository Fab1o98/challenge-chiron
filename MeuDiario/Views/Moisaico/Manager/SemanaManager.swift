import Foundation

struct SemanaManager {
    
    /// Retorna o início do domingo da semana de uma determinada data
    static func domingoDaSemana(de data: Date) -> Date? {
        var calendar = Calendar.current
        calendar.firstWeekday = 1 // Domingo
        let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: data)
        return calendar.date(from: components)
    }
    
    /// Verifica se duas datas pertencem à mesma semana (domingo a sábado)
    static func mesmaSemana(_ data1: Date, _ data2: Date) -> Bool {
        guard let d1 = domingoDaSemana(de: data1),
              let d2 = domingoDaSemana(de: data2) else {
            return false
        }
        return d1 == d2
    }

    /// Filtra entradas para manter apenas as da mesma semana de referência
    static func filtrarEntradasDaSemana<T: Identifiable>(
        entradas: [T],
        dataDe: (T) -> Date,
        referencia: Date = Date()
    ) -> [T] {
        entradas.filter { mesmaSemana(dataDe($0), referencia) }
    }
}
