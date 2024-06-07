import SwiftUI

struct ContentView: View {
    var viewModel: GameViewModel
    
    @State private var isAlertPresented = false
    
    var body: some View {
        VStack {
            HStack {
                AttemptsView(
                    remainingAttempts: viewModel.getRemainingAttempts(),
                    maxAttempts: viewModel.getMaxAttempts()
                )
                Spacer()
                ScoreView(score: viewModel.getScore())
            }
            Spacer()
            CircleView(size: 250, emoji: viewModel.getCurrentMoveEmoji())
            Spacer()
            Spacer()
            SelectionView(
                expectedOutcome: viewModel.getExpectedOutcome(),
                moveSelected: viewModel.playerSelected(move:)
            )
            Spacer()
        }
        .padding()
        .background(Color.cinnabar.opacity(0.8))
        .fontDesign(.monospaced)
        .alert("Game finsihed", isPresented: $isAlertPresented) {
            Button("Start a New Game", action: viewModel.startNewGame)
        }
        .onChange(of: viewModel.getIsGameFinished(), initial: false) { _, newValue  in
            isAlertPresented = newValue
        }
    }
}

#Preview {
    ContentView(viewModel: GameViewModel())
}
