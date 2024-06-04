//
//  Copyright (c) 2024 Taarna. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        Button("Tap me!", systemImage: "heart") {
            useRedText.toggle()
        }
        .frame(width: 150, height: 80)
        .tint(useRedText ? .red : .accentColor)
        
        Button("Button with no tint set to it", systemImage: "heart") {
//            useRedText.toggle()
        }
        .frame(width: 150, height: 80)
        .tint(useRedText ? .red : .blue)
        
        Button("No, tap me!", systemImage: "star") {
            useRedText.toggle()
        }
        .frame(width: 150, height: 80)
        .foregroundStyle(useRedText ? .red : .accentColor)

    }
}

#Preview {
    ContentView()
}
