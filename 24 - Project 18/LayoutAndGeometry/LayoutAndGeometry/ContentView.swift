//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let items = ["I", "just", "finished", "Day 92 of the", "#100DaysOfSwiftUI"]
    @State private var itemsSizes = [CGFloat](repeating: 0.0, count: 5)
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(.background)
                
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(items.indices, id: \.self) { index in
                        Text(items[index])
                            .fontWeight(.bold)
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .background(
                                GeometryReader { proxy in
                                    Color.clear
                                        .preference(key: SizePreferenceKey.self, value: proxy.size)
                                }
                            )
                            .onPreferenceChange(SizePreferenceKey.self) { size in
                                itemsSizes[index] = size.width
                            }
                            .alignmentGuide(.leading) { _ in
                                -itemsSizes.prefix(index).reduce(0, +)
                            }
                    }
                }
            }
        }
    }
}

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
