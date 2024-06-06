import SwiftUI

@Observable
class GameViewModel {
    private var model = GameLogic()
    
    var attemptsViewModel: AttemptsViewModel
    var scoreViewModel: ScoreViewModel
    var circleViewModel: CircleViewModel
    var selectionViewModel: SelectionViewModel
    
    var isGameFinished: Bool
    
    init() {
        let tempModel = GameLogic()
        
        self.model = tempModel
        
        self.attemptsViewModel = AttemptsViewModel(remainingAttempts: Constants.maxAttempts, maxAttempts: Constants.maxAttempts)
        self.scoreViewModel = ScoreViewModel(score: 0)
        self.circleViewModel = CircleViewModel(size: 250, move: tempModel.currentMove)
        self.selectionViewModel = SelectionViewModel(expectedOutcome: tempModel.getExpectedOutcome())
        
        isGameFinished = tempModel.isGameFinished
        
        self.selectionViewModel.onMoveSelected = { [weak self] move in
            self?.handleMoveSelection(move)
        }
    }
    
    func getExpectedOutcome() -> String {
        return model.getExpectedOutcome()
    }
    
    func startNewGame() {
        model.startNewGame()
        
        refreshValues()
    }
    
    private func handleMoveSelection(_ move: Move) {
        model.playerSelected(move: move)
        
        refreshValues()
    }
    
    private func refreshValues() {
        attemptsViewModel.remainingAttempts = model.remainingAttempts
        scoreViewModel.score = model.score
        circleViewModel.move = model.currentMove
        selectionViewModel.expectedOutcome = model.getExpectedOutcome()
        
        isGameFinished = model.isGameFinished
    }
}
