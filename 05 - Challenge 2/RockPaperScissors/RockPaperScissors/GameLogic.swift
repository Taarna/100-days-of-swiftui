import Foundation

enum Move: String, CaseIterable {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
}

struct GameLogic {
    private(set) var score: Int
    
    init() {
        score = 0
    }
}
