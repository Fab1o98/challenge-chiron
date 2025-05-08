//
//  AddReflection.swift
//  MeuDiario
//
//  Created by Aluno 08 on 29/04/25.
//

import SwiftUI

struct AddReflection: View {
    @Binding var isShowingAddReflection: Bool
    @State var texto = ""
    
    var body: some View {
        ZStack{
            LinearGradient(stops: [Gradient.Stop(color: Color("Reflection"), location: 0.00),
                                               Gradient.Stop(color: Color(red: 0.5, green: 0.74, blue: 1), location: 0.39),
                                               Gradient.Stop(color: .white, location: 0.70)],
                                       startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                HStack{
                    Spacer()
                    Button {
                        isShowingAddReflection = false
                    } label: {
                        Text("Done")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                }.padding(10)
                
                VStack {
                    Image(systemName: "person.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                    Text("Weekly")
                        .font(.title)
                        .fontWeight(.bold)
                     Text("Reflection")
                         .font(.title)
                         .fontWeight(.bold)
                }.padding(.bottom, 80)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Prompt: Hobbies")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Outside of media consumption (watching Tv/Movies, listening to Music or playing Games, do you have a hobby?")
                        .font(.body)
                }
                
                TextField("Write...", text: $texto)
                    .padding(.horizontal, -8)
                    .padding(.vertical, -60)
                    .padding()
                    .frame(width: 345, height: 140, alignment: .leading)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                
                Spacer()
            }
            .padding(20)
        }
    }
}

struct AddReflection_Previews: PreviewProvider {
    static var previews: some View {
        AddReflection(isShowingAddReflection: .constant(false))
    }
}
