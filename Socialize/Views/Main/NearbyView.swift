//
//  NearbyView.swift
//  social_wifi
//
//  Created by BigBright on 11/20/23.
//

import SwiftUI

struct NearbyView: View {
    var userData = UserData.shared.users
    
    
    var body: some View {
        VStack{
            MainHeader()
            HStack{
                Text("\(userData.count )")
                    .font(.custom("Manrope", size: 35))
                    .fontWeight(.semibold) // this is closest to font-weight of 600
                    .foregroundColor(Color(red: 8/255, green: 37/255, blue: 105/255)) // #082569
                VStack{
                    Spacer()
                        .frame(height: 5.5)
                    Text("People found :")
                        .font(.custom("Manrope", size: 24))
                        .fontWeight(.semibold) // this is closest to font-weight of 600
                        .foregroundColor(Color(red: 8/255, green: 37/255, blue: 105/255)) // #082569
                }
                Spacer()
            }
            ScrollView {
                VStack{
                    ForEach(userData.indices , id: \.self) { index in
                        let user = userData[index]
                        let imageNames = [
                               !user.instagram.isEmpty ? "instagram" : nil,
                               !user.facebook.isEmpty ? "facebook" : nil,
                               !user.tictok.isEmpty ? "tictok" : nil,
                               !user.snapchat.isEmpty ? "snapchat" : nil
                           ].compactMap { $0 } // This removes nil values from the array

                        UserList(imageNames: imageNames, avatarName: "user_1")
                    }
//                    UserList(imageNames:["instagram", "facebook", "tictok", "snapchat"], avatarName: "user_1")
//                    UserList(imageNames:["instagram", "facebook", "tictok"], avatarName: "user_2")
//                    UserList(imageNames:["instagram", "facebook"], avatarName: "user_3")
//                    UserList(imageNames:["instagram", "tictok", "snapchat"], avatarName: "user_4")
//                    UserList(imageNames:["instagram"], avatarName: "user_5")
//                    UserList(imageNames:["instagram"], avatarName: "user_5")
                }
            }
            Spacer()
            CustomeButton(text: "Search again", Button_width: 250, status: true) {
                
            }
            
        }
        .padding()
        
    }
}

struct NearbyView_Previews: PreviewProvider {
    static var previews: some View {
        NearbyView()
    }
}
