//
//  OnboardingView.swift
//  social_wifi
//
//  Created by BigBright on 11/19/23.
//

import SwiftUI

struct OnboardingView3: View {
    @State private var gotoNext: Bool = false
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Image("image_arm")
                    .resizable()
                    .frame(width: 221, height: 223)
                Spacer()
                VStack (alignment: .leading, spacing: 10){
                    HStack{
                        Text("Ready to Get Started ?")
                            .foregroundColor(Color(red: 63/255, green: 49/255, blue: 120/255))
                            .font(.system(size: 32, weight: .bold))
                    }

                        Text(" Join our community and embark on a journey\n of discovery.")
                            .foregroundColor(Color(red: 63/255, green: 49/255, blue: 120/255))
                            .font(.system(size: 16, weight: .bold))
                }
                Spacer()
                VStack(alignment: .center){
                    Text(" By clicking “Get Started” you agreeing to the\n          Terms of Services & Privacy Policy")
                        .foregroundColor(Color(red: 63/255, green: 49/255, blue: 120/255))
                        .font(.system(size: 13))
                    HStack{
                        Spacer()
                        SubmitButton(text: "Continue with Apple", status: true) {
                            gotoNext = true
                        }
                        Spacer()
                    }
                }
                Spacer()
            }
        }
        .navigationDestination(isPresented: $gotoNext) {
                       OnboardingView2()
                   }
    }
}

struct OnboardingView3_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView3()
    }
}
