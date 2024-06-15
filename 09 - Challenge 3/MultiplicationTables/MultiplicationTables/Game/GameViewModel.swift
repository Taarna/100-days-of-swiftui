import Foundation

@Observable
class GameViewModel {
    private var gameLogic: GameLogic
    
    private(set) var numberOfQuestions: Int = 0
    private(set) var currentQuestion: Question?
    private(set) var score: Int = 0
    
    init(settings: GameSettings) {
        self.gameLogic = GameLogic(settings: settings)
        self.currentQuestion = gameLogic.getNextQuestion()
    }
    
    ///
    
//    func getSelectedTable() -> Int {
//        return model.selectedTable
//    }
//    
//    func getNumberOfQuestions() -> Int {
//        return model.numberOfQuestions
//    }
//    
//    func setNumberOfQuestions(_ numberOfQuestions: Int) {
//        model.numberOfQuestions = numberOfQuestions
//    }
//    
//    func getPossibleQuestions() -> Array<Int> {
//        return model.possibleNumberOfQuestions
//    }
//    
//    func isGameActive() -> Bool {
//        return model.isGameActive
//    }
    
    ///
    
//    func startNewGame() {
//        model.startNewGame()
//    }
//    
//    func decreaseTableNumber() {
//        model.decreaseTableNumber()
//    }
//    
//    func increaseTableNumber() {
//        model.increaseTableNumber()
//    }
//    
//    func selectedQuestionNumber(at index: Int) {
//        model.selectedQuestionNumber(at: index)
//    }
}
