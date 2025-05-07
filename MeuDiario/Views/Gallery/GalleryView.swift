import SwiftUI

struct GalleryView: View {
//
//    @Binding var galleryIsShowing: Bool
    
    var body: some View {
        VStack {
            Divider().foregroundColor(.black)
            
            ScrollView {
                VStack(alignment: .center, spacing: 10) {
                    Text("Weekly View")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Rectangle()
                        .frame(width: 140, height: 280)
                        .foregroundColor(.blue)
                }
                .padding(10)
                .padding(.bottom, 40)
                
                
                Section(header:
                            VStack(alignment: .leading) {
                                Text("Next canvas")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                })
                        {
                            Button {
                                print("Next canvas")
                            } label: {
                                VStack(alignment: .leading, spacing: 5) {
                                    HStack {
                                        Text("Ready")
                                            .font(.body)
                                            .fontWeight(.regular)
                                            .foregroundColor(.gray)
                                        Spacer()
                                        Circle()
                                            .frame(width: 15, height: 15)
                                            .foregroundColor(.red)
                                    }
                                    Text("Paint")
                                        .font(.body)
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                }
                            }
                            .frame(width: 300, height: 40)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5).stroke(.blue, lineWidth: 2).shadow(radius: 4))
                            .padding(.bottom, 40)
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
        }
        .navigationBarTitle("User's Gallery")
//            .toolbar {
//                ToolbarItemGroup(placement: .navigationBarLeading) {
//                    Button {
//                        galleryIsShowing = false
//                    } label: {
//                        Image(systemName: "chevron.left")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 20, height: 20)
//                        Text("Back")
//                            .font(.title2)
//                    }
//                }
//            }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
