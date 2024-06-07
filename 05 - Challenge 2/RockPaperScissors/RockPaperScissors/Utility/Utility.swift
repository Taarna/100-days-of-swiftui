import Foundation

func getEmojiForMove(_ move: Move) -> String {
    return switch(move) {
    case .rock:
        "✊🏼"
    case .paper:
        "✋🏼"
    case .scissors:
        "✌🏼"
    }
}
