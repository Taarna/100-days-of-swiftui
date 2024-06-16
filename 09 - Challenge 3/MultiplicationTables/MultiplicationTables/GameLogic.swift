import Foundation

struct GameSettings {
    var numberOfQuestions: Int
    var multiplicationTable: Int
}

struct Question {
    let factor1: Int
    let factor2: Int
    
    var answer: Int {
        return factor1 * factor2
    }
}

@Observable
class GameLogic {
    private let settings: GameSettings
    
    private var questions: Array<Question> = []
    private var currentQuestionNumber = 1
    private var currentQuestionIndex = 0
    private var score: Int = 0
    
    ///

    init(settings: GameSettings) {
        self.settings = settings
        generateQuestions()
    }
    
    ///
    
    func getNumberOfQuestions() -> Int {
        return settings.numberOfQuestions
    }
    
    func getCurrentQuestionNumber() -> Int {
        return currentQuestionNumber
    }
    
    func getScore() -> Int {
        return score
    }
    
    func getCurrentQuestion() -> Question {
//        guard currentQuestionIndex < questions.count else { return nil }
        return questions[currentQuestionIndex]
    }
    
    func getNextQuestion() -> Question {
        currentQuestionIndex += 1
        return getCurrentQuestion()
    }
    
    func increaseScore() {
        score += 1
    }
    
    func decreaseScore() {
        if score > 0 {
            score -= 1
        }
    }
    
    func startNewGame() {
        questions.removeAll()
        generateQuestions()
    }
    
    ///
    
    private func generateQuestions() {
        let selectedTable = settings.multiplicationTable
        
        questions = (1...settings.numberOfQuestions).map { _ in
            Question(factor1: selectedTable, factor2: Int.random(in: 1...(selectedTable + 1)))
        }
    }
}
