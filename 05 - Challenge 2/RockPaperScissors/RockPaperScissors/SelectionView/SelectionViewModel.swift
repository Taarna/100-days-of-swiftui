import Foundation

@Observable
class SelectionViewModel {
    private(set) var expectedOutcome: String
    
    init(expectedOutcome: String) {
        self.expectedOutcome = expectedOutcome
    }
}
