import Foundation

enum Move: String, CaseIterable {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
}

struct GameLogic {
    private(set) var playerShouldWin: Bool = Bool.random()
    private(set) var score: Int
    private(set) var currentMove: Move
    
    init() {
        playerShouldWin = Bool.random()
        score = 0
        currentMove = Constants.possibleMoves.randomElement()!
    }
    
    func getExpectedOutcome() -> String {
        return playerShouldWin ? "winning" : "losing"
    }
}
