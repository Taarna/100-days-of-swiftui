import SwiftUI

struct ContentView: View {
    var viewModel: GameViewModel
    
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
    }
}

#Preview {
    ContentView(viewModel: GameViewModel())
}
