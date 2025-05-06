import SwiftUI

struct GalleryView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {

        NavigationView{
            Form {
                VStack(alignment: .center, spacing: 10) {
                    Text("Weekly View")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Rectangle()
                        .frame(width: 140, height: 280)
                        .foregroundColor(.blue)
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                
                Section(header: Text("Reflections")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black))
                        {
                            ScrollView(.horizontal) {
                                HStack(spacing: 14) {
                                    Button{
                                        print("teste")
                                    } label: {
                                        Text("Hobbies")
                                            .font(.title3)
                                            .fontWeight(.semibold)
                                            .padding(10)
                                            .overlay(RoundedRectangle(cornerRadius: 6)
                                                        .stroke(Color.blue, lineWidth: 2))
                                    }
                                    Button{
                                        print("teste")
                                    } label: {
                                        Text("Hobbies")
                                            .font(.title3)
                                            .fontWeight(.semibold)
                                            .padding(10)
                                            .overlay(RoundedRectangle(cornerRadius: 6)
                                                        .stroke(Color.blue, lineWidth: 2))
                                    }
                                    Button{
                                        print("teste")
                                    } label: {
                                        Text("Hobbies")
                                            .font(.title3)
                                            .fontWeight(.semibold)
                                            .padding(10)
                                            .overlay(RoundedRectangle(cornerRadius: 6)
                                                        .stroke(Color.blue, lineWidth: 2))
                                    }
                                    Button{
                                        print("teste")
                                    } label: {
                                        Text("Hobbies")
                                            .font(.title3)
                                            .fontWeight(.semibold)
                                            .padding(10)
                                            .overlay(RoundedRectangle(cornerRadius: 6)
                                                        .stroke(Color.blue, lineWidth: 2))
                                    }
                                }
                                .padding(10)
                            }
                }
                
                Section(header: Text("Collection")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black))
                {
                    ScrollView(.horizontal) {
                        HStack(spacing: 14) {
                            Rectangle()
                                .frame(width: 84, height: 168)
                                .foregroundColor(.red)
                            Rectangle()
                                .frame(width: 84, height: 168)
                                .foregroundColor(.red)
                            Rectangle()
                                .frame(width: 84, height: 168)
                                .foregroundColor(.red)
                            Rectangle()
                                .frame(width: 84, height: 168)
                                .foregroundColor(.red)
                            Rectangle()
                                .frame(width: 84, height: 168)
                                .foregroundColor(.red)
                            Rectangle()
                                .frame(width: 84, height: 168)
                                .foregroundColor(.red)
                        }
                        .padding(10)
                    }
                }
            }
            .navigationTitle("User's Gallery")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        print("voltar")
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                        Text("Back")
                            .font(.title2)
                    }
                }
            }
        }
    }
}
