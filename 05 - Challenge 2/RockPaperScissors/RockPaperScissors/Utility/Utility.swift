//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

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
