import SwiftUI

struct ScoreView: View {
    @State private var viewModel: ScoreViewModel
    
    init(viewModel: ScoreViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text("Score")
            Text("\(viewModel.score)")
        }
        .foregroundStyle(.accent)
    }

}

#Preview {
    ScoreView(viewModel: ScoreViewModel(score: 50))
}
