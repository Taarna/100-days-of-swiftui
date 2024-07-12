//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.blue)
            .font(.largeTitle)
    }
}

extension View {
    func styleTitle() -> some View {
        modifier(Title())
    }
}

#Preview {
    Text("Title view")
        .styleTitle()
}
