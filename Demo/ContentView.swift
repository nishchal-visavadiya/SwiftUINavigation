//
//  ContentView.swift
//  Demo
//
//  Created by Nishchal Visavadiya on 03/07/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @StateObject var appRouter = AppRouter()
    @State var showSplash = true
    @AppStorage(UserDefaultKeys.isLogin) private var isLoggedIn: Bool = false
    @State var isUserLoggedIn = false
    
    var body: some View {
        NavigationStack(path: $appRouter.navPath) {
            if showSplash {
                SplashScreen()
                    .onLoad {
                        Task {
                            try await Task.sleep(nanoseconds: 1000000000)
                            withAnimation {
                                showSplash = false
                            }
                        }
                    }
                    .onAppear {
                        isUserLoggedIn = isLoggedIn
                    }
                    .transition(.move(edge: .leading))
            } else {
                if isUserLoggedIn {
                    HomeScreen(isUserLoggedIn: $isUserLoggedIn)
                        .navigationDestination(for: Route.self) { route in
                            switch route {
                            case .Second:
                                SecondScreen()
                                    .environmentObject(appRouter)
                            }
                        }
                        .environmentObject(appRouter)
                        .transition(.move(edge: .trailing).combined(with: .identity))
                        .animation(.spring, value: isUserLoggedIn)
                } else {
                    LoginScreen(isUserLoggedIn: $isUserLoggedIn)
                        .transition(.move(edge: .leading).animation(.easeOut).combined(with: .identity))
                        .animation(.spring, value: isUserLoggedIn)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
