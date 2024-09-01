//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct AdvancedGesturesView: View {
    @State private var dragOffset: CGSize = .zero
    
    @State private var currentScaleAmount = 0.0
    @State private var finalScaleAmount = 1.0
    
    @State private var longPressBackgroundColor = Color.pink.opacity(0.2)
    
    @State private var rotationAngle = Angle(degrees: 0.0)
    
    var body: some View {
        Text("Drag Me")
            .foregroundColor(.black)
            .padding()
            .background(RoundedRectangle(cornerRadius: 5).fill(Color.pink.opacity(0.2)))
            .offset(dragOffset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        dragOffset = value.translation
                    }
                    .onEnded { value in
                        dragOffset = .zero
                    }
            )
        
        Text("Pinch to Magnify")
            .foregroundColor(.black)
            .padding()
            .background(RoundedRectangle(cornerRadius: 5).fill(Color.pink.opacity(0.2)))
            .scaleEffect(finalScaleAmount + currentScaleAmount)
            .gesture(
                MagnifyGesture()
                    .onChanged { value in
                        currentScaleAmount = value.magnification - 1
                    }
                    .onEnded { value in
                        finalScaleAmount += currentScaleAmount
                        currentScaleAmount = 0
                    }
            )
        
        Text("Long Press")
            .foregroundColor(.black)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(longPressBackgroundColor))
            .gesture(
                LongPressGesture()
                    .onChanged { _ in
                        longPressBackgroundColor = Color.blue.opacity(0.2)
                    }
                    .onEnded { _ in
                        longPressBackgroundColor = Color.pink.opacity(0.2)
                    }
            )
        
        Text("Rotate Gesture")
            .foregroundColor(.black)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(longPressBackgroundColor))
            .rotationEffect(rotationAngle)
            .gesture(
                RotateGesture()
                    .onChanged { value in
                        rotationAngle = value.rotation
                    }
                    .onEnded { _ in
                        rotationAngle = .zero
                    }
            )
    }
}

#Preview {
    AdvancedGesturesView()
}
