//
//  SubmitButton.swift
//  social_wifi
//
//  Created by BigBright on 11/20/23.
//

import SwiftUI

struct SubmitButton: View {
    var text: String
    var status: Bool
    var clicked: (() -> Void)
    var Button_color: Color {
        return status ? Color(red: 8/255, green: 37/255, blue: 105/255) : Color.gray.opacity(0.3)
    }
    var Text_color: Color {
        return status ? Color.white : Color.gray
    }
    
    var body: some View {
        Button(action: clicked) {
            HStack{
                Spacer()
                Text(text)
                    .font(.system(size: 18, weight: .bold))
                    .padding(.vertical, 17)
                    .foregroundColor(Text_color)
//                    .frame(maxWidth: 260)
                Image(systemName: "applelogo")
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .background(Button_color)
        .cornerRadius(100)
        .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
        .frame(width: 343, height: 69, alignment: .center)
    }
}

//struct SubmitButton_Previews: PreviewProvider {
//    static var previews: some View {
//        SubmitButton()
//    }
//}
