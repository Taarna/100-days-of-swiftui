import SwiftUI

@Observable
class GameViewModel {
    private var model: GameLogic
    
    init() {
        self.model = GameLogic()
    }
    
    ///
    
    func getMaxAttempts() -> Int {
        return model.maxAttempts
    }
    
    func getRemainingAttempts() -> Int {
        return model.remainingAttempts
    }
    
    func getScore() -> Int {
        return model.score
    }
    
    func getCurrentMoveEmoji() -> String {
        let currentMove = getCurrentMove()
        let emoji = getEmojiForMove(currentMove)
        
        return emoji
    }
    
    func getExpectedOutcome() -> String {
        let playerShouldWin = model.playerShouldWin
        return playerShouldWin ? "winning" : "losing"
    }
    
    func getIsGameFinished() -> Bool {
        return model.isGameFinished
    }
    
    ///
    
    func playerSelected(move: Move) {
        model.playerSelected(move: move)
    }
    
    func startNewGame() {
        model.startNewGame()
    }
    
    ///
    
    private func getCurrentMove() -> Move {
        return model.currentMove
    }
}
