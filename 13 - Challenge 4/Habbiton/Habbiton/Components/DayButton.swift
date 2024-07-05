import SwiftUI

struct DayButton : ButtonStyle {
    var isCompleted: Bool = false
    var isCurrentDay: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 50, height: 50)
            .background(
                Group {
                    if isCompleted {
                        Circle().fill(Color.accent)
                    } else {
                        Circle()
                            .stroke(Color.accent, style: StrokeStyle(lineWidth: 2, dash: isCurrentDay ? [] : [5]))
                    }
                }
            )
            .overlay(
                Group {
                    if isCompleted {
                        Image(systemName: "checkmark")
                            .foregroundColor(Color.counter)
                    }
                }
            )
    }
}

#Preview {
    VStack {
        HStack {
            Button("W") {}
                .buttonStyle(DayButton(isCompleted: true, isCurrentDay: true))
            Button("W") {}
                .buttonStyle(DayButton(isCompleted: true, isCurrentDay: false))
            Button("W") {}
                .buttonStyle(DayButton(isCompleted: false, isCurrentDay: true))
            Button("W") {}
                .buttonStyle(DayButton(isCompleted: false, isCurrentDay: false))
        }
    }
}
