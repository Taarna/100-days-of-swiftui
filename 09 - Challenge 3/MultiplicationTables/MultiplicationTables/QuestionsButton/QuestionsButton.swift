import SwiftUI

struct QuestionsButton : ButtonStyle {
    var isSelected : Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.arcade(.regular, size: 26.0))
            .frame(width: 50, height: 50)
            .background(.clear)
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(configuration.isPressed || isSelected ? .black : .blue, lineWidth: 3)
            )
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    VStack {
        HStack {
            Button("5") {
                
            }
            .buttonStyle(QuestionsButton(isSelected: true))
            Button("10") {
                
            }
            .buttonStyle(QuestionsButton(isSelected: false))
            Button("15") {
                
            }
            .buttonStyle(QuestionsButton(isSelected: false))
        }
    }
    .frame(width: 300, height: 100)
    .background(Color.yellow)
}
