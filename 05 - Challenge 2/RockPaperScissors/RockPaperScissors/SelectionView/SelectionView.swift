import SwiftUI

struct SelectionView: View {
    @State private var viewModel: SelectionViewModel
    
    init(viewModel: SelectionViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                ForEach(Constants.possibleMoves, id: \.self) { move in
                    Button{
                        viewModel.onMoveSelected?(move)
                    } label: {
                        CircleView(viewModel: CircleViewModel(size: 100, move: move))
                    }
                }
            }
            Text("Pick a \(viewModel.expectedOutcome) option")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.accent)
        }
    }
}

#Preview {
    SelectionView(viewModel: SelectionViewModel(expectedOutcome: "winning")).fontDesign(.monospaced)
}
