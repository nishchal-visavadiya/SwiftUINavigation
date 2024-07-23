//
//  SecondScreen.swift
//  Demo
//
//  Created by Nishchal Visavadiya on 04/07/24.
//

import SwiftUI

struct SecondScreen: View {
    
    @EnvironmentObject var appRouter: AppRouter
    @State var id: Int = Int.random(in: 101...200)
    @AppStorage(UserDefaultKeys.isLogin) private var isLoggedIn: Bool = false
    
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            VStack {
                Text("Second screen: \(id)")
                Button {
                    appRouter.popToRoot()
                    isLoggedIn = false
                } label: {
                    Text("PopToRoot")
                }
            }
        }
    }
}

#Preview {
    SecondScreen()
}
