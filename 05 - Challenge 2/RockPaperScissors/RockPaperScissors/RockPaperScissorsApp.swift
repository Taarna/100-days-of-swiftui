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
