import SwiftUI

struct ScoreView: View {
    var score: Int
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text("Score")
                .fontWeight(.bold)
            Text("\(score)")
        }
        .foregroundStyle(.accent)
    }

}

#Preview {
    ScoreView(score: 50)
}
