import SwiftUI

struct AttemptsView: View {
    @State private var viewModel: AttemptsViewModel
    
    init(viewModel: AttemptsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Attempts left")
                .foregroundStyle(.accent)
                .fontWeight(.bold)
            HStack(spacing: 0) {
                ForEach(0..<viewModel.maxAttempts, id: \.self) { index in
                    Heart(isFull: index <= viewModel.remainingAttempts - 1)
                }
            }
        }
    }
}

struct Heart: View {
    var isFull: Bool
    
    var body: some View {
        
        Image(systemName: isFull ? "heart.fill" : "heart")
            .foregroundStyle(.accent)
    }
}

#Preview {
    AttemptsView(viewModel: AttemptsViewModel(remainingAttempts: 6, maxAttempts: 10))
}
