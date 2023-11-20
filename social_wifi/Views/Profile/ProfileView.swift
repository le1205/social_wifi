//
//  ProfileView.swift
//  social_wifi
//
//  Created by BigBright on 11/20/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var gotoDetail : Bool = false
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 25) // adjust cornerRadius to your liking
                    .fill(Color(red: 210/255, green: 210/255, blue: 210/255, opacity: 0.58))
                    .frame(width: 333.659, height: 140.474)
                    .rotationEffect(.degrees(0.093))
                    .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
                VStack(alignment: .leading){
                    HStack{
                        Text("Set Up your profile and get 5\nUnlock")
                        //                .frame(width:180, height: 43)
                            .foregroundColor(Color(red: 8/255, green: 37/255, blue: 105/255))
                            .font(.system(size: 17, weight: .bold))
                        Spacer()
                            .frame(width:30)
                        Image("right")
                            .padding([.trailing, .leading], 10)
                            .onTapGesture {
                                gotoDetail = true
                            }
                    }
                    Rectangle()
                        .fill(Color.gray) // Default color for Divider
                        .frame(width: 309.002, height: 1)
                    HStack{
                        Text("My Favorite Profiles")
                        //                .frame(width:180, height: 43)
                            .foregroundColor(Color(red: 8/255, green: 37/255, blue: 105/255))
                            .font(.system(size: 17, weight: .bold))
                        Spacer()
                            .frame(width:100)
                        Image("right")
                            .padding([.trailing, .leading], 10)
                            .onTapGesture {
                                gotoDetail = true
                            }
                    }
                    
                }
            }
            .navigationDestination(isPresented: $gotoDetail) {
                DetailView()
            }
            ZStack{
                RoundedRectangle(cornerRadius: 25) // adjust cornerRadius to your liking
                    .fill(Color(red: 210/255, green: 210/255, blue: 210/255, opacity: 0.58))
                    .frame(width: 333.659, height: 140.474)
                    .rotationEffect(.degrees(0.093))
                    .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
                VStack(alignment: .leading){
                    HStack{
                        Text("Set Up your profile and get 5\nUnlock")
                        //                .frame(width:180, height: 43)
                            .foregroundColor(Color(red: 8/255, green: 37/255, blue: 105/255))
                            .font(.system(size: 17, weight: .bold))
                        Spacer()
                            .frame(width:30)
                        Image("right")
                            .padding([.trailing, .leading], 10)
                            .onTapGesture {
                                gotoDetail = true
                            }
                    }
                    Rectangle()
                        .fill(Color.gray) // Default color for Divider
                        .frame(width: 309.002, height: 1)
                    HStack{
                        Text("My Favorite Profiles")
                        //                .frame(width:180, height: 43)
                            .foregroundColor(Color(red: 8/255, green: 37/255, blue: 105/255))
                            .font(.system(size: 17, weight: .bold))
                        Spacer()
                            .frame(width:100)
                        Image("right")
                            .padding([.trailing, .leading], 10)
                            .onTapGesture {
                                gotoDetail = true
                            }
                    }
                    
                }
            }
            .navigationDestination(isPresented: $gotoDetail) {
                DetailView()
            }
            ZStack{
                RoundedRectangle(cornerRadius: 25) // adjust cornerRadius to your liking
                    .fill(Color(red: 210/255, green: 210/255, blue: 210/255, opacity: 0.58))
                    .frame(width: 333.659, height: 140.474)
                    .rotationEffect(.degrees(0.093))
                    .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
                VStack(alignment: .leading){
                    HStack{
                        Text("Follow Us On:")
                        //                .frame(width:180, height: 43)
                            .foregroundColor(Color(red: 8/255, green: 37/255, blue: 105/255))
                            .font(.system(size: 17, weight: .bold))
                        Spacer()
                            .frame(width:30)
                    }
                   
                    HStack{
                        Text("My Favorite Profiles")
                        //                .frame(width:180, height: 43)
                            .foregroundColor(Color(red: 8/255, green: 37/255, blue: 105/255))
                            .font(.system(size: 17, weight: .bold))
                        Spacer()
                            .frame(width:100)
                        Image("right")
                            .padding([.trailing, .leading], 10)
                            .onTapGesture {
                                gotoDetail = true
                            }
                    }
                    
                }
            }
            .navigationDestination(isPresented: $gotoDetail) {
                DetailView()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
