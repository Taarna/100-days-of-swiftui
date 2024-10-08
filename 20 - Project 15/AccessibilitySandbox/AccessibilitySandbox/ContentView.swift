//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 10
    
    var body: some View {
        VStack {
            Button("John Fitzgerald Kennedy") {
                print("Button tapped")
            }
            .accessibilityInputLabels(["John Fitzgerald Kennedy", "Kennedy", "JFK"])
            
            VStack {
                Text("Value: \(value)")
                
                Button("Increment") {
                    value += 1
                }
                
                Button("Decrement") {
                    value -= 1
                }
            }
            .accessibilityElement()
            .accessibilityLabel("Value")
            .accessibilityValue(String(value))
            .accessibilityAdjustableAction { direction in
                switch direction {
                case .increment:
                    value += 1
                case .decrement:
                    value -= 1
                default:
                    print("Not handled.")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
