import Foundation

class ColorManager {
    
    static let cores: [String: [Int]] = [
        "Pride": [255, 163, 100],
        "Joy": [255, 169, 126],
        "Anxiety": [252, 217, 89],
        "Relief": [252, 249, 53],
        "Hope": [191, 243, 79],
        "Surprise": [81, 231, 161],
        "Sadness": [70, 155, 220],
        "Fear": [70, 155, 220],
        "Shame":[109, 207, 255],
        "Guilt": [167, 180, 255],
        "Solitude": [210, 138, 255],
        "Anger": [255, 137, 121],
    ]
    
    static func rgb(for emocao: String) -> [Int]? {
        return cores[emocao]
    }
}
