import Foundation
import SwiftUI

struct TagsBasicas: Identifiable, Codable, Hashable{
    var id: Int
    var nome: String
    var qtd: Int
    var nomecor: String
    
    var cor: Color {Color(nomecor)}
    
    }
