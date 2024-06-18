import SwiftUI

struct GameView: View {
    @State var viewModel: GameViewModel
    @State private var isAlertPresented = false
    
    @Binding var isGameActive: Bool
    
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Round")
                        Text("\(viewModel.getCurrentRound())/\(viewModel.getNumberOfQuestions())")
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("Score")
                        Text("\(viewModel.getScore())")
                    }
                    
                }
                .padding(.horizontal)
                .font(.pixel(size: 30.0))
                
                Spacer()
                    .frame(height: 100)
                
                Text("\(viewModel.getCurrentQuestion().factor1) x \(viewModel.getCurrentQuestion().factor2)")
                    .font(.pixel(size: 76.0))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.yellow)
                            .shadow(radius: 10)
                            .frame(width: 230, height: 130)
                    )
                
                Spacer()
                
                Text("= \(viewModel.getCurrentAnswer())")
                    .font(.pixel(size: 50.0))
                    .background(
                        RoundedRectangle(cornerRadius: 7)
                            .fill(Color.yellow)
                            .shadow(radius: 10)
                            .frame(width: 230, height: 40)
                    )
                
                Spacer()
                
                VStack {
                    HStack {
                        ForEach(1...3, id: \.self) { number in
                            NumberButton(number: number) { num in
                                viewModel.setAnswerNumber(num)
                            }
                            .buttonStyle(KeyboardButtonStyle())
                        }
                    }
                    HStack {
                        ForEach(4...6, id: \.self) { number in
                            NumberButton(number: number) { num in
                                viewModel.setAnswerNumber(num)
                            }
                            .buttonStyle(KeyboardButtonStyle())
                        }
                    }
                    HStack {
                        ForEach(7...9, id: \.self) { number in
                            NumberButton(number: number) { num in
                                viewModel.setAnswerNumber(num)
                            }
                            .buttonStyle(KeyboardButtonStyle())
                        }
                    }
                    HStack {
                        Button("<") {
                            viewModel.deleteLastDigit()
                        }
                        .buttonStyle(KeyboardButtonStyle())
                        Button("0") {
                            viewModel.setAnswerNumber(0)
                        }
                        .buttonStyle(KeyboardButtonStyle())
                        Button("=") {
                            viewModel.answerConfirmed()
                            isAlertPresented = viewModel.getIsGameFinished()
                        }
                        .buttonStyle(KeyboardButtonStyle())
                    }
                }
                
                Spacer()
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .alert("Game Over", isPresented: $isAlertPresented) {
            Button("Start New Game") {
                viewModel.startNewGame()
                isGameActive = false
            }
        }
    }
}

#Preview {
    @State var isGameActive = true
    return GameView(viewModel: GameViewModel(settings: GameSettings(numberOfQuestions: 5, multiplicationTable: 5)), isGameActive: $isGameActive)
}
