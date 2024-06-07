import SwiftUI

struct CircleView: View {
    var size: Double
    var emoji: String
    
    var body: some View {
        Text(emoji)
            .font(.system(size: size / 2))
            .frame(width: size, height: size)
            .background(Background(size: size))
    }
}

private struct Background: View {
    private var size: Double
    
    init(size: Double) {
        assert(size >= 50, "Circle size must be >= 50")
        
        self.size = size - 40
    }
    
    var body: some View {
        Circle().fill(
            RadialGradient(
                colors: [.accent, .cinnabar], center: .center, 
                startRadius: 0,
                endRadius: size
            )
        )
    }
}

#Preview {
    CircleView(size: 350, emoji: "😃")
}
