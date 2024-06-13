import Foundation

@Observable
class GameViewModel {
    private var model: GameLogic
    
    private(set) var numberOfQuestions: Int = 0
    
    init() {
        self.model = GameLogic()
    }
    
    ///
    
    func getSelectedTable() -> Int {
        return model.selectedTable
    }
    
    func getNumberOfQuestions() -> Int {
        return model.numberOfQuestions
    }
    
    func setNumberOfQuestions(_ numberOfQuestions: Int) {
        model.numberOfQuestions = numberOfQuestions
    }
    
    func getPossibleQuestions() -> Array<Int> {
        return model.possibleNumberOfQuestions
    }
    
    func isGameActive() -> Bool {
        return model.isGameActive
    }
    
    ///
    
    func startNewGame() {
        model.startNewGame()
    }
    
    func decreaseTableNumber() {
        model.decreaseTableNumber()
    }
    
    func increaseTableNumber() {
        model.increaseTableNumber()
    }
    
}
