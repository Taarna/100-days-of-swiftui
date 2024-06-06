import SwiftUI

enum Move: String, CaseIterable {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
}

struct ContentView: View {
    @State private var currentChoice: Move = Move.allCases.randomElement() ?? .rock
    @State private var playerShouldWin: Bool = Bool.random()
    @State private var score = 0
    
    private let maxAttempts = 10
    private var possibleMoves = [Move.rock, Move.paper, Move.scissors]
    
    var body: some View {
        VStack {
            HStack {
                AttemptsView(attemptsLeft: 5, maxAttempts: 10)
                Spacer()
                ScoreView(score: score)
            }
            Spacer()
            Text("Wrong answer 🙁")
                .font(.headline)
            Spacer()
            CircleView( size: 100, emoji: "✊")
            Spacer()
            Spacer()
            VStack {
                HStack {
                    ForEach(possibleMoves, id: \.self) { move in
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
            .background(Circle().fill(RadialGradient(colors: [.teal, .brown], center: .center, startRadius: 0, endRadius: 150)))
            
    }
}

struct AttemptsView: View {
    var attemptsLeft: Int
    var maxAttempts: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Attempts left")
            HStack(spacing: 0) {
                ForEach(0..<maxAttempts, id: \.self) { index in
                    index <= attemptsLeft ? Image(systemName: "heart.fill") : Image(systemName: "heart")
                }
            }
        }
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
    ContentView()
}
