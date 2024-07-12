//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import Foundation

@Observable
class SettingsViewModel {
    private var settings: GameSettings
    
    init(settings: GameSettings) {
        self.settings = settings
    }
    
    func getMultiplicationTable() -> Int {
        return settings.multiplicationTable
    }
    
    func getNumberOfQuestions() -> Int {
        return settings.numberOfQuestions
    }
    
    func getQuestionNumbers() -> Array<Int> {
        return Defaults.possibleNumberOfQuestions
    }
    
    func getSettings() -> GameSettings {
        return settings
    }
    
    func increaseMultiplicationTable() {
        if (settings.multiplicationTable < 10) {
            settings.multiplicationTable += 1
        }
    }
    
    func decreaseMultiplicationTable() {
        if (settings.multiplicationTable > 2) {
            settings.multiplicationTable -= 1
        }
    }
    
    func setNumberOfQuestions(_ numOfQuestions: Int) {
        settings.numberOfQuestions = numOfQuestions
    }
    
    func saveSettings(numberOfQuestions: Int, multiplicationTable: Int) {
        settings.numberOfQuestions = numberOfQuestions
        settings.multiplicationTable = multiplicationTable
    }
}
