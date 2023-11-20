//
//  CustomCircle.swift
//  social_wifi
//
//  Created by BigBright on 11/20/23.
//

import SwiftUI

struct CustomCircle: View {
    var width: CGFloat
    var height: CGFloat

       var body: some View {
           Circle()
               .fill(Color.white)
               .overlay(Circle().stroke(Color(red: 7/255, green: 31/255, blue: 93/255, opacity: 0.53), lineWidth: 0.8))
               .frame(width: width, height: height)
       }
}

