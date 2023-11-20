//
//  UserList.swift
//  social_wifi
//
//  Created by BigBright on 11/20/23.
//

import SwiftUI

struct UserList: View {
//    let imageNames = ["instagram", "facebook", "tictok", "snapchat"]
    @State private var gotoDetail: Bool = false
    var imageNames : Array<String>
    var avatarName : String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25) // Adjust cornerRadius to your liking
                .fill(Color(red: 238/255, green: 238/255, blue: 238/255)) // #EEE
                .frame(height: 84)
            HStack{
                Image(avatarName)
                    .frame(width:60)
                    .padding([.top, .bottom, .leading], 10)
                Spacer()
                    .frame(width:23)
                VStack(alignment: .leading){
                    Text("more details")
                        .foregroundColor(Color(red: 8/255, green: 37/255, blue: 105/255))
                        .font(.system(size: 21, weight: .bold))
                    HStack{
                        ForEach(imageNames, id: \.self) { imageName in
                                        Image(imageName)
                                    }
                    }
                }
                Spacer()
                Image("right")
                    .padding(.trailing, 10)
                    .onTapGesture {
                        gotoDetail = true
                    }
            }
        }
        .navigationDestination(isPresented: $gotoDetail) {
                                DetailView()
        }
    }
   
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        UserList(imageNames:["instagram", "facebook", "tictok", "snapchat"], avatarName: "user_1")
    }
}
