//
//  Menu.swift
//  MeuDiario
//
//  Created by Aluno 47 on 28/04/25.
//

import SwiftUI

struct Menu: View {
    
    @State var botaoEditarTag:Bool = false
    @Binding var fireEditing:Bool

    var body: some View {
        VStack{
            Button{
                fireEditing = true
            }label:{
                HStack{
                    Text("Edit Tag")
                    Spacer()
                    Image(systemName: "pencil")
                }
            }
            
            Button{
                
            }label:{
                HStack{
                    Text("Delete Tag")
                    Spacer()
                    Image(systemName: "trash")
                }
            }
        }.padding()
    }
}

//
//struct Menu_Previews: PreviewProvider {
//    static var previews: some View {
//        Menu()
//    }
//}
