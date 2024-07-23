//
//  HomeScreen.swift
//  Demo
//
//  Created by Nishchal Visavadiya on 22/07/24.
//

import SwiftUI

struct HomeScreen: View {
    
    @State var selection: Int = 0
    @State private var isOpened = false
    @EnvironmentObject var appRouter: AppRouter
    @AppStorage(UserDefaultKeys.isLogin) private var isLoggedIn: Bool = false
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            VStack {
                Button(action: {
                    isLoggedIn = false
                }, label: {
                    Text("Logout")
                })
                Button(action: {
                    appRouter.push(route: Route.Second)
                }, label: {
                    Text("Second Screen")
                })
                homeContent
            }
        }
    }
    
    private var drawer: some View {
        VStack {
            ForEach(1...3, id: \.self) { index in
                Button {
                    selection = index + 10
                    isOpened.toggle()
                } label: {
                    Text("\(index)")
                }
            }
        }
        .frame(minWidth: 200, maxHeight: .infinity)
        .background(Color.gray)
    }
    
    private var homeContent: some View {
        VStack {
            Button {
                selection = 12
                isOpened.toggle()
            } label: {
                Text("Hello")
            }
            TabView(selection: $selection) {
                FirstSreen()
                    .tabItem {
                        Text("First")
                    }
                    .tag(11)
                SecondScreen()
                    .tabItem {
                        Text("Second")
                    }
                    .tag(12)
                ThirdScreen()
                    .tabItem {
                        Text("Third")
                    }
                    .tag(13)
            }
        }
    }
}
