//
//  SplashScreen.swift
//  Demo
//
//  Created by Nishchal Visavadiya on 22/07/24.
//

import SwiftUI

struct SplashScreen: View {
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            Text("Splash Screen!!")
                .font(.system(size: 40))
        }
    }
}

#Preview {
    SplashScreen()
}
