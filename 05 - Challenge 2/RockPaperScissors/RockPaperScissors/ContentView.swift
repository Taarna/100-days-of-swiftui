import SwiftUI

struct ContentView: View {
    var viewModel: GameViewModel
    
    @State private var currentChoice = Constants.possibleMoves.randomElement()
    @State private var playerShouldWin: Bool = Bool.random()
    @State private var score = 0
    @State private var infoText = ""
    
    var body: some View {
        VStack {
            HStack {
                AttemptsView(viewModel: AttemptsViewModel(remainingAttempts: 5, maxAttempts: 10))
                Spacer()
                ScoreView(score: score)
            }
            Spacer()
            Text(infoText)
                .font(.largeTitle)
            Spacer()
            CircleView( size: 100, emoji: "✊")
            Spacer()
            Spacer()
            VStack {
                HStack {
                    ForEach(Constants.possibleMoves, id: \.self) { move in
                        CircleView( size: 50, emoji: getEmojiFor(move: move))
                    }
                }
                Text("Pick an option")
            }
        }
        .padding()
    }
    
    private func getEmojiFor(move: Move) -> String {
        switch (move) {
        case .rock:
            return "✊"
        case .paper:
            return "🤚"
        case .scissors:
            return "✌️"
        }
    }
}

struct CircleView: View {
    var size: Double
    var emoji: String
    
    var body: some View {
        Text(emoji)
            .frame(width: size, height: size)
            .padding()
            .background(Circle().fill(RadialGradient(colors: [.teal, .yellow, .white], center: .center, startRadius: 0, endRadius: 350)))
            
    }
}

struct ScoreView: View {
    var score: Int
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text("Score")
            Text("\(score)")
        }
    }
}

#Preview {
    ContentView(viewModel: GameViewModel())
}
