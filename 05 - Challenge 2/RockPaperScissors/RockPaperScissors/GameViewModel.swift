import SwiftUI

@Observable
class GameViewModel {
    private var model = GameLogic()
    
    var attemptsViewModel: AttemptsViewModel
    var scoreViewModel: ScoreViewModel
    var circleViewModel: CircleViewModel
    var selectionViewModel: SelectionViewModel
    
    init() {
        let tempModel = GameLogic()
        
        self.model = tempModel
        
        self.attemptsViewModel = AttemptsViewModel(remainingAttempts: Constants.maxAttempts, maxAttempts: Constants.maxAttempts)
        self.scoreViewModel = ScoreViewModel(score: 0)
        self.circleViewModel = CircleViewModel(size: 250, move: tempModel.currentMove)
        self.selectionViewModel = SelectionViewModel(expectedOutcome: tempModel.getExpectedOutcome())
    }
    
    func getExpectedOutcome() -> String {
        return model.getExpectedOutcome()
    }
}
