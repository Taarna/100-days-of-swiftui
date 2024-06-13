//

import SwiftUI

@main
struct MultiplicationTablesApp: App {
    @State var gameViewModel = GameViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: gameViewModel)
        }
    }
}
