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
    @State var afterSplashPush = true
    
    var body: some View {
        NavigationStack(path: $appRouter.navPath) {
            ZStack {
                if showSplash {
                    SplashScreen()
                        .id("splash")
                        .onLoad {
                            Task {
                                try await Task.sleep(nanoseconds: 1000000000)
                                withAnimation {
                                    showSplash = false
                                }
                                isUserLoggedIn = isLoggedIn
                            }
                        }
                        .transition(.move(edge: .leading))
                } else {
                    if isUserLoggedIn {
                        HomeScreen()
                            .onAppear {
                                afterSplashPush = false
                            }
                            .id("home")
                            .transition(.move(edge: .trailing))
                    } else {
                        LoginScreen()
                            .onAppear {
                                afterSplashPush = false
                            }
                            .id("login")
                            .transition(.move(edge: afterSplashPush ? .trailing : .leading))
                    }
                }
            }
            .environmentObject(appRouter)
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .Second:
                    SecondScreen()
                        .environmentObject(appRouter)
                }
            }
            .animation(.easeOut(duration: 0.35), value: isUserLoggedIn)
            .animation(.easeOut(duration: 0.35), value: showSplash)
            .onChange(of: isLoggedIn) { oldValue, newValue in
                guard oldValue != newValue else { return }
                withAnimation {
                    isUserLoggedIn = newValue
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
