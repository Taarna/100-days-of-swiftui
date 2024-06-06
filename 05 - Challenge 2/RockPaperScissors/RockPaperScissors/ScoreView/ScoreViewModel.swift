import Foundation

@Observable
class ScoreViewModel {
    private(set) var score: Int
    
    init(score: Int) {
        self.score = score
    }
}
