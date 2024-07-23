//
//  LoginScreen.swift
//  Demo
//
//  Created by Nishchal Visavadiya on 22/07/24.
//

import SwiftUI

struct LoginScreen: View {
    
    @Binding var isUserLoggedIn: Bool
    @AppStorage(UserDefaultKeys.isLogin) private var isLoggedIn: Bool = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Button {
                withAnimation {
                    isLoggedIn = true
                    isUserLoggedIn = true
                }
            } label: {
                Text("Login Button")
            }
        }
    }
}
