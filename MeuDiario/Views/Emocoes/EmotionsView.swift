import SwiftUI


struct EmotionsView: View {
    var body: some View {
        
        HStack{
            Image("matisse_joy_new 2")
                .resizable()
                .frame(width: 249, height: 187 )
                .clipped()
            
            
            VStack(spacing: 28 ){
                ZStack{
                    Color.orange
                    Text("Joy")
                        .font(.title)
                        .bold()
                        .foregroundColor(.black)
                }
                .frame(height: 80)
                
                ZStack(alignment: .topLeading){
                    Color.white
                    Text("Le Bonheur de Vivre, \n Matisse - 1906 ")
                        .font(.caption)
                        .padding(5)
                        .foregroundColor(.black)
                }
                .frame(height: 80)
            }
            .frame(width: 150)
        }
    }
}

struct EmotionsView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionsView()
    }
}


struct EmotionsHome_Previews: PreviewProvider {
    static var previews: some View {
        EmotionsView()
    }
}
