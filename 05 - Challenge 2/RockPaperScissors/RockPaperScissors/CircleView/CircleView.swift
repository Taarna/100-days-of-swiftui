import SwiftUI

struct CircleView: View {
    @State private var viewModel: CircleViewModel
    
    init(viewModel: CircleViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text(viewModel.emoji)
            .font(.system(size: viewModel.size / 2))
            .frame(width: viewModel.size, height: viewModel.size)
            .background(Background(size: viewModel.size))
    }
}

private struct Background: View {
    private var size: Double
    
    init(size: Double) {
        assert(size >= 50, "Circle size must be >= 50")
        
        self.size = size - 40
    }
    
    var body: some View {
        Circle().fill(RadialGradient(colors: [.accent, .cinnabar], center: .center, startRadius: 0, endRadius: size))
    }
}

#Preview {
    CircleView(viewModel: CircleViewModel(size: 350, move: .rock))
}
