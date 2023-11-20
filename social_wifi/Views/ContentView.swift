//
//  ContentView.swift
//  social_wifi
//
//  Created by BigBright on 11/19/23.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack (path: $path) {
            NavigationLink(destination: OnboardingView()) {
                VStack {
                    Image("ios_marketing")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
