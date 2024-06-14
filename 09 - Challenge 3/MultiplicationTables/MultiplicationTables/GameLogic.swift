import Foundation

@Observable
class GameLogic {
    var numberOfQuestions = 0
    private(set) var selectedTable = 2
    
    private(set) var questions: Array<Int> = []
    
    private(set) var isGameActive = false
    
    let possibleNumberOfQuestions = [5, 10, 15]
    
    ///

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
        print(selectedTable)
        for _ in 0..<numberOfQuestions {
            questions.append(Int.random(in: 1..<(selectedTable + 1)))
        }
        print(questions)
    }
}
