import SwiftUI

struct TabBar: View {
    
    var body: some View {
        TabView {
            TagsHome()
                .tabItem {
                    Image(systemName: "tag")
                    Text("Tags")
                }
                .tag(0)
            
            JournalHome()
                .tabItem {
                    Image(systemName: "book")
                    Text("Journal")
                }
                .tag(1)
            
            EmotionsView()
                .tabItem {
                    Image(systemName: "face.smiling")
                    Text("Emotion")
                }
                .tag(2)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(DiarioViewModel())//pq isso funciona?

    }
}
