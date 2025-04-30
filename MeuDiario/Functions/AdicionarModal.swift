import SwiftUI

struct AdicionarModal<Modal: View>: View {
    
    @Binding var botao:Bool
    var nomesimbolo: String
    
    var modal: () -> Modal
    
    var body: some View {
        VStack {
            Button{
                botao.toggle()
            }label:{
                Image(systemName: nomesimbolo)
            }
        }.sheet(isPresented: $botao, content:{
            modal()
        })
    }
}

struct AdicionarModal_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State private var botao = false

        var body: some View {
            AdicionarModal(botao: $botao, nomesimbolo: "plus.circle") {
                ViewTest()
            }
        }
    }

    static var previews: some View {
        PreviewWrapper()
    }
}

struct ViewTest: View{
    var body: some View{
        
        VStack {
            Text("Coloque o nome da struct que chama a modal")
        }.padding()
    }
}
