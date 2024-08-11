//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct FlagView: View {
    var flagImage: String
    var accessibilityLabel: String
    var onTapped: () -> Void
    var animation: () -> Void
    
    @State private var animationRotation = 0.0
    @State private var buttonOpacity = 1.0
    @State private var scaleFactor = 1.0
    
    var body: some View {
        Button {
            onTapped()
            withAnimation {
                animation()
            }
        } label: {
            Image(flagImage)
                .clipShape(.capsule)
                .shadow(radius: 5)
                .accessibilityLabel(accessibilityLabel)
        }
    }
}
