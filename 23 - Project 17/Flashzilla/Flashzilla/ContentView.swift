//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Simple Gestures") {
                    SimpleGesturesView()
                }
                NavigationLink("Advanced Gestures") {
                    AdvancedGesturesView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
