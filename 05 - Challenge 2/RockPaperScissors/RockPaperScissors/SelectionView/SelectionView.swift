import SwiftUI

struct SelectionView: View {
    var expectedOutcome: String
    var moveSelected: ((Move) -> ())?
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                ForEach(Constants.possibleMoves, id: \.self) { move in
                    Button{
                        moveSelected?(move)
                    } label: {
                        CircleView(size: 100, emoji: getEmojiForMove(move))
                    }
                }
            }
            Text("Pick a \(expectedOutcome) option")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.accent)
        }
    }
}

#Preview {
    SelectionView(expectedOutcome: "winning").fontDesign(.monospaced)
}
