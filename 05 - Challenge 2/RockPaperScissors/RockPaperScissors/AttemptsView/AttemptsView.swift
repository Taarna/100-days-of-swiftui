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
            HStack(spacing: 0) {
                ForEach(0..<viewModel.maxAttempts, id: \.self) { index in
                    index <= viewModel.remainingAttempts - 1 ? Heart(imageName: "heart.fill") : Heart(imageName: "heart")
                }
            }
        }
    }
}

struct Heart: View {
    var imageName: String
    
    var body: some View {
        Image(systemName: imageName).foregroundStyle(.accent)
    }
}

#Preview {
    AttemptsView(viewModel: AttemptsViewModel(remainingAttempts: 6, maxAttempts: 10))
}
