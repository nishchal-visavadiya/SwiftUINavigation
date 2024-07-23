//
//  ThirdScreen.swift
//  Demo
//
//  Created by Nishchal Visavadiya on 04/07/24.
//

import SwiftUI

struct ThirdScreen: View {
    
    @State var id: Int = Int.random(in: 201...300)
    
    var body: some View {
        Text("Third screen: \(id)")
    }
}

#Preview {
    ThirdScreen()
}
