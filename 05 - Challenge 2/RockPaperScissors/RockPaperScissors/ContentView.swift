import SwiftUI

struct ContentView: View {
    var viewModel: GameViewModel
    
    @State private var isAlertPresented = false
    @State private var infoText = ""
    
    var body: some View {
        VStack {
            HStack {
                AttemptsView(viewModel: viewModel.attemptsViewModel)
                Spacer()
                ScoreView(viewModel: viewModel.scoreViewModel)
            }
            Spacer()
            Text(infoText)
                .font(.largeTitle)
            Spacer()
            CircleView(viewModel: viewModel.circleViewModel)
            Spacer()
            Spacer()
            SelectionView(viewModel: viewModel.selectionViewModel)
            Spacer()
        }
        .padding()
        .background(Color.cinnabar.opacity(0.8))
        .fontDesign(.monospaced)
        .alert("Game finsihed", isPresented: $isAlertPresented) {
            Button("Start a New Game", action: viewModel.startNewGame)
        }
        .onChange(of: viewModel.isGameFinished, initial: false) { _, newValue  in
            isAlertPresented = newValue
        }
    }
}

#Preview {
    ContentView(viewModel: GameViewModel())
}
