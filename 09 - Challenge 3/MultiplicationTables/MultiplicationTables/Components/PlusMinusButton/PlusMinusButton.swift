//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct PlusMinusButton : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Font.pixel(size: 36.0))
            .tint(.black)
            .padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 7))
    }
}

#Preview {
    VStack {
        Button("+") {
            
        }
        .buttonStyle(PlusMinusButton())
        Button("-") {
            
        }
        .buttonStyle(PlusMinusButton())
    }
}
