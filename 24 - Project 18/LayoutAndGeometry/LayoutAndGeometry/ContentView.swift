//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(Color(hue: min(proxy.frame(in: .global).minY/fullView.size.height, 1), saturation: 1, brightness: 1))
                            .rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .visualEffect { content, geometryProxy in
                                content
                                    .opacity(geometryProxy.frame(in: .global).origin.y / 200)
                                    .scaleEffect(0.3 + geometryProxy.frame(in: .global).minY / fullView.size.height)
                            }
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}
