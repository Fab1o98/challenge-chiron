//
//  InfoEmocoes.swift
//  MeuDiario
//
//  Created by Aluno 10 on 05/05/25.
//

import Foundation


class DataLoader: ObservableObject {
    @Published var dtEmotion: [EmotionData] = []

    init() {
        self.dtEmotion = loadEmotions()
    }
}

 func loadEmotions() -> [EmotionData] {
    guard let url = Bundle.main.url(forResource: "EmotionsData", withExtension: "json") else {
        print("❌ Arquivo emocoes.json não encontrado.")
        return []
    }

    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let emotions = try decoder.decode([EmotionData].self, from: data)
        return emotions
    } catch {
        print("❌ Erro ao carregar ou decodificar o JSON: \(error)")
        return []
    }
}


//func carregarEmotion() -> [EmotionDt] {
//    if let url = Bundle.main.url(forResource: "EmotionsData", withExtension: "json"){
//        if let data = try? Data(contentsOf: url){
//            let decoder = JSONDecoder()
//            if let emotions = try? decoder.decode([EmotionDt].self, from: data){
//                return emotions
//            }
//        }
//    }
//    return []
//}
