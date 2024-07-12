//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct SettingsButton : ButtonStyle {
    var isSelected : Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.pixel(size: 34.0))
            .background(.clear)
            .padding()
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(configuration.isPressed || isSelected ? .black : .blue, lineWidth: 3)
            )
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    VStack {
        HStack {
            Button("5") {}
            .buttonStyle(SettingsButton(isSelected: true))
            Button("10") {}
            .buttonStyle(SettingsButton(isSelected: false))
            Button("15") {}
            .buttonStyle(SettingsButton(isSelected: false))
        }
    }
    .frame(width: 300, height: 100)
    .background(Color.yellow)
}
