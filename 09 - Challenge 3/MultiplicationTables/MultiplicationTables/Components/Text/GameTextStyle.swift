//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct GameTextStyle : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.pixel(size: 36.0))
            .foregroundColor(.black)
        
    }
}

extension View {
    func styleText() -> some View {
        modifier(GameTextStyle())
    }
}
