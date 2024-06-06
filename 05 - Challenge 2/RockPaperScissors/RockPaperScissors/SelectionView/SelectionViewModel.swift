import Foundation

@Observable
class SelectionViewModel {
    var expectedOutcome: String
    
    var onMoveSelected: ((Move) -> Void)?
    
    init(expectedOutcome: String) {
        self.expectedOutcome = expectedOutcome
    }
}
