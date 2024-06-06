import Foundation

@Observable
class CircleViewModel {
    private(set) var size: Double
    private(set) var move: Move
    
    var emoji: String {
        switch(move) {
        case .rock:
            return "✊🏼"
        case .paper:
            return "✋🏼"
        case .scissors:
            return "✌🏼"
        }
    }
    
    init(size: Double, move: Move) {
        self.size = size
        self.move = move
    }
}
