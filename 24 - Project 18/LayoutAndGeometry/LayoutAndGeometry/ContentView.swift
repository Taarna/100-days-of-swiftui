//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                ForEach(1..<20) { num in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.teal)
                        .frame(height: 90)
                        .visualEffect { content, proxy in
                            content
                                .hueRotation(Angle(degrees: proxy.frame(in: .global).origin.y) / 10)
                        }
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        
    }
}
