import Foundation

@Observable
class GameViewModel {
    private var gameLogic: GameLogic
    
    private var numberOfQuestions = 0
    private var currentQuestion: Question
    private var currentAnswer: Int?
    private var currentRound = 1
    private var isGameFinished = false
    
    init(settings: GameSettings) {
        let tempGameLogic = GameLogic(settings: settings)
        
        self.currentQuestion = tempGameLogic.getCurrentQuestion()
        self.gameLogic = tempGameLogic
    }
    
    ///
    
    func getNumberOfQuestions() -> Int {
        return gameLogic.getNumberOfQuestions()
    }
    
    func getCurrentQuestionNumber() -> Int {
        return gameLogic.getCurrentQuestionNumber()
    }
    
    func getCurrentRound() -> Int {
        return currentRound
    }
    
    func getScore() -> Int {
        return gameLogic.getScore()
    }
    
    func getCurrentQuestion() -> Question {
        return currentQuestion
    }
    
    func getCurrentAnswer() -> String {
        return currentAnswer.map { String($0) } ?? ""
    }
    
    func getIsGameFinished() -> Bool {
        return isGameFinished
    }
    
    func setAnswerNumber(_ number: Int) {
        if (0...9).contains(number) {
            let answerString = "\(currentAnswer ?? 0)\(number)"
            currentAnswer = Int(answerString)
        }
    }
    
    func deleteLastDigit() {
        guard let currentAnswer = currentAnswer else {
            return
        }
        
        var answerString = String(currentAnswer)
        answerString.removeLast()
        
        if let newAnswer = Int(answerString) {
            self.currentAnswer = newAnswer
        } else {
            self.currentAnswer = nil
        }
    }
    
    func answerConfirmed() {
        if currentQuestion.factor1 * currentQuestion.factor2 == currentAnswer {
            gameLogic.increaseScore()
        } else {
            gameLogic.decreaseScore()
        }
        
        if (currentRound == gameLogic.getNumberOfQuestions()) {
            isGameFinished = true
            return
        }
        
        currentQuestion = gameLogic.getNextQuestion()
        currentAnswer = nil
        currentRound += 1
    }
    
    func startNewGame() {
        gameLogic.startNewGame()
    }
}
