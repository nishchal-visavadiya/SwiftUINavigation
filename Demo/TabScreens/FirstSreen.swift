//
//  FirstSreen.swift
//  Demo
//
//  Created by Nishchal Visavadiya on 04/07/24.
//

import SwiftUI

struct FirstSreen: View {
    
    @State var id: Int = 1
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0...100, id: \.self) { index in
                    Text("\(index)")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
    }
}

#Preview {
    FirstSreen()
}
