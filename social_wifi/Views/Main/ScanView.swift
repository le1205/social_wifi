//
//  ScanView.swift
//  social_wifi
//
//  Created by BigBright on 11/20/23.
//

import SwiftUI

struct ScanView: View {
    @State private var gotoHome: Bool = false
    var body: some View {
        VStack{
            Spacer()
            Text("Searching for people near you...")
                .foregroundColor(Color(red: 63/255, green: 49/255, blue: 120/255))
                .font(.system(size: 16, weight: .bold))
            Spacer()
            ZStack{
                CustomCircle(width: 465, height: 465)
                CustomCircle(width: 345, height: 345)
                CustomCircle(width: 243, height: 243)
                Ellipse()
                    .fill(Color(red: 63/255, green: 49/255, blue: 120/255)) // #3F3178
                    .shadow(color: Color.black.opacity(0.70), radius: 50, x: 0, y: 10)
                    .frame(width:180, height:180)
                
                VStack{
                    Text("Tap to find")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                    Text("People near you")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                }
            }
            Spacer()
            HStack{
                Image("Home")
                    .onTapGesture{
                        gotoHome = true
                    }
                Spacer()
                Image("user")
            }
            .padding(15)
        }
        .navigationDestination(isPresented: $gotoHome) {
            TargetView()
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
