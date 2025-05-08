import SwiftUI

struct GalleryView: View {
    
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
                            NextCanvasButton()
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
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}

struct NextCanvasButton: View {

    var body: some View {
        let date = Date()
        let calendar = Calendar.current
        let weekDay = calendar.component(.weekday, from: date)
        
        if (calendar.firstWeekday == calendar.firstWeekday) {
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
                    
                    NavigationLink(destination: MosaicoView(), label: {
                        Text("paint")
                            .fontWeight(.regular)
                            .foregroundColor(.black)
                    })
                        .font(.body)
                        
                }
            }
            .frame(width: 300, height: 40)
            .padding()
            .background(RoundedRectangle(cornerRadius: 5).stroke(.blue, lineWidth: 2).shadow(radius: 4))
            .padding(.bottom, 40)
        } else {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text("In Production")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                    Spacer()
                }
                let count = weekDay - calendar.firstWeekday
                Text("\(count == 0 ? 7 : count) day(s) left")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(.black)
            }
            .frame(width: 300, height: 40)
            .padding()
            .background(RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 2).shadow(radius: 4))
            .padding(.bottom, 40)
        }
    }
}
