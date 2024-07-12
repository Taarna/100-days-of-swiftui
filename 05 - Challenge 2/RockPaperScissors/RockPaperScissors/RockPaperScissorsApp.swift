//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

@main
struct RockPaperScissorsApp: App {
    @State var gameViewModel = GameViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: gameViewModel)
        }
    }
}
