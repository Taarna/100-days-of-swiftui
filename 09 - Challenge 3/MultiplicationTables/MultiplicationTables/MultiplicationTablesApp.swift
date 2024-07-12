//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

@main
struct MultiplicationTablesApp: App {
    let initialSettings = GameSettings(
        numberOfQuestions: Defaults.defaultNumberOfQuestions,
        multiplicationTable: Defaults.defaultMultiplicationTable
    )
    
    var body: some Scene {
        WindowGroup {
            SettingsView(viewModel: SettingsViewModel(settings: initialSettings))
        }
    }
}
