import SwiftUI

struct AttemptsView: View {
    var remainingAttempts: Int
    var maxAttempts: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Attempts left")
                .foregroundStyle(.accent)
                .fontWeight(.bold)
            HStack(spacing: 0) {
                ForEach(0..<maxAttempts, id: \.self) { index in
                    Heart(isFull: index <= remainingAttempts - 1)
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
    AttemptsView(remainingAttempts: 8, maxAttempts: 10)
}
