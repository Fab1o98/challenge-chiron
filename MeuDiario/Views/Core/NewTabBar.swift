//
//  NewTabBar.swift
//  MeuDiario
//
//  Created by Aluno 47 on 28/04/25.
//

import SwiftUI

struct NewTabBar: View {
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                HStack {
                    NavigationLink(destination: TagsHome(), label:{
                        VStack(spacing:4){
                            Image(systemName: "tag")
                            Text("Tags")
                        }.foregroundColor(.gray)
                    }).padding(.horizontal)
                    
                    Spacer()
                    
                    NavigationLink(destination: TagsHome(), label:{
                        VStack(spacing: 4){
                            Image(systemName: "book")
                            Text("Journal")
                        }.foregroundColor(.gray)
                    })
                    
                    Spacer()
                    
                    NavigationLink(destination: TagsHome(), label:{
                        VStack(spacing: 4){
                            Image(systemName: "face.smiling")
                            Text("Emotions")
                        }.foregroundColor(.gray)
                    }).padding(.horizontal)
                }.font(.system(size: 20))
                
            }.padding(.horizontal)
        }
    }
}

struct NewTabBar_Previews: PreviewProvider {
    static var previews: some View {
        NewTabBar()
    }
}
