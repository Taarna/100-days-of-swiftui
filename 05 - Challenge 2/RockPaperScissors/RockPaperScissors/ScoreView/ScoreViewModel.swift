import Foundation

@Observable
class ScoreViewModel {
    var score: Int
    
    init(score: Int) {
        self.score = score
    }
}
