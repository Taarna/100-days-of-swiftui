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
    
    private(set) var questions: Array<Question> = []
    private(set) var currentQuestionIndex: Int = 0
    private(set) var score: Int = 0
    
    ///
    
    var numberOfQuestions = 0
    private(set) var selectedTable = 2
    
    
    
    private(set) var isGameActive = false
    
    let possibleNumberOfQuestions = [5, 10, 15]
    
    ///
    ///
    init(settings: GameSettings) {
        self.settings = settings
        generateQuestions()
    }
    
    ///
    
    func getNextQuestion() -> Question? {
        guard currentQuestionIndex < questions.count else { return nil }
        return questions[currentQuestionIndex]
    }
    
    func startNewGame() {
        questions.removeAll()
        generateQuestions()
        isGameActive = true
    }
    
    func increaseTableNumber() {
        if (selectedTable < 10) {
            selectedTable += 1
        }
    }
    
    func decreaseTableNumber() {
        if (selectedTable > 2) {
            selectedTable -= 1
        }
    }
    
    func selectedQuestionNumber(at index: Int) {
        self.numberOfQuestions = possibleNumberOfQuestions[index]
    }
    
    ///
    
    private func generateQuestions() {
        let selectedTable = settings.multiplicationTable
        
        questions = (1...settings.numberOfQuestions).map { _ in
            Question(factor1: selectedTable, factor2: Int.random(in: 1...(selectedTable + 1)))
        }
    }
}
