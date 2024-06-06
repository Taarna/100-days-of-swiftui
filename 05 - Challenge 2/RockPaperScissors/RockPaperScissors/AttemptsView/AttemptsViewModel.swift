import Foundation

@Observable
class AttemptsViewModel {
    private(set) var remainingAttempts: Int
    private(set) var maxAttempts: Int
    
    init(remainingAttempts: Int, maxAttempts: Int) {
        assert(remainingAttempts >= 0, "Number of remaining attempts must be >= 0.")
        assert(maxAttempts == Constants.maxAttempts, "Number of max attempts must be \(Constants.maxAttempts).")
        assert(remainingAttempts <= maxAttempts, "Number of remaining attempts cannot be higher than number of max attempts.")
        
        self.remainingAttempts = remainingAttempts
        self.maxAttempts = maxAttempts
    }
}
