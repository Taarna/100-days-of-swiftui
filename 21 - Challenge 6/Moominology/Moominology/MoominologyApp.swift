//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftData
import SwiftUI

@main
struct MoominologyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Character.self)
    }
}
