//
//  LoginScreen.swift
//  Demo
//
//  Created by Nishchal Visavadiya on 22/07/24.
//

import SwiftUI

struct LoginScreen: View {
    
    @AppStorage(UserDefaultKeys.isLogin) private var isLoggedIn: Bool = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Button {
                isLoggedIn = true
            } label: {
                Text("Login Button")
            }
        }
    }
}
