import Foundation

enum Move: String, CaseIterable {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
}

@Observable
class GameLogic {
    private(set) var currentMove: Move
    private(set) var playerShouldWin: Bool = Bool.random()
    
    private(set) var score: Int
    
    private(set) var remainingAttempts: Int
    let maxAttempts = Constants.maxAttempts
    
    private(set) var isGameFinished = false
    
    init() {
        currentMove = Constants.possibleMoves.randomElement()!
        playerShouldWin = Bool.random()
        
        score = 0
        
        remainingAttempts = 10
        
        isGameFinished = false
    }
    
    func startNewGame() {
        currentMove = Constants.possibleMoves.randomElement()!
        playerShouldWin = Bool.random()
        
        score = 0
        
        remainingAttempts = 10
        
        isGameFinished = false
    }
    
    func startNewTurn() {
        currentMove = Constants.possibleMoves.randomElement()!
        playerShouldWin = Bool.random()
    }
    
    func playerSelected(move: Move) {
        let isMoveWinning = isMoveWinning(move: move)
        let isAnswerCorrect = isMoveWinning && playerShouldWin || !isMoveWinning && !playerShouldWin
        
        if isAnswerCorrect {
            score += 1
        } else {
            score -= 1
        }
        
        remainingAttempts -= 1
        
        isGameFinished = remainingAttempts == 0
        
        if !isGameFinished {
            startNewTurn()
        }
    }
    
    private func isMoveWinning(move: Move) -> Bool {
        // Treating draw as a wrong answer
        return
            move == .rock && currentMove == .scissors ||
            move == .paper && currentMove == .rock ||
            move == .scissors && currentMove == .paper
    }
}
