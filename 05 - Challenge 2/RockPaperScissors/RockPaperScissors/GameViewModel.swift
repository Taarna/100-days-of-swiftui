import SwiftUI

@Observable
class GameViewModel {
    private var model: GameLogic
    
    init() {
        self.model = GameLogic()
    }
}
