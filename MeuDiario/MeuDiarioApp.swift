//
//  MeuDiarioApp.swift
//  MeuDiario
//
//  Created by Aluno 14 on 4/10/25.
//

import SwiftUI

@main
struct MeuDiarioApp: App {
    
    @State var diarioViewModel = DiarioViewModel()//estudar State
    
    var body: some Scene {
        WindowGroup {
            TabBar()
                .environmentObject(diarioViewModel)//estudar o EnvironmentObject
        }
    }
}
