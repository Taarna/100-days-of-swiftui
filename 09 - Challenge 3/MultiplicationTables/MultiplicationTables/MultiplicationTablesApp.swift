//

import SwiftUI

@main
struct MultiplicationTablesApp: App {
    @State var gameViewModel = GameViewModel()
    
    init() {
        for family in UIFont.familyNames {
            print("Family: \(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("   - \(name)")
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: gameViewModel)
        }
    }
}
