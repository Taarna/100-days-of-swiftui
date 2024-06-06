import SwiftUI

struct ContentView: View {
    var viewModel: GameViewModel
    
    @State private var currentChoice = Constants.possibleMoves.randomElement() ?? .rock
    @State private var playerShouldWin: Bool = Bool.random()
    @State private var score = 0
    @State private var infoText = "That's correct! 🥳"
    
    var body: some View {
        VStack {
            HStack {
                AttemptsView(viewModel: AttemptsViewModel(remainingAttempts: 5, maxAttempts: 10))
                Spacer()
                ScoreView(viewModel: ScoreViewModel(score: score))
            }
            Spacer()
            Text(infoText)
                .font(.largeTitle)
            Spacer()
            CircleView(viewModel: CircleViewModel(size: 250, move: currentChoice))
            Spacer()
            Spacer()
            VStack {
                HStack {
                    ForEach(Constants.possibleMoves, id: \.self) { move in
                        CircleView(viewModel: CircleViewModel(size: 100, move: move))
                    }
                }
                Text("Pick an option")
            }
        }
        .padding()
        .background(Color.cinnabar.opacity(0.8))
    }
}

#Preview {
    ContentView(viewModel: GameViewModel())
}
