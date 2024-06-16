import SwiftUI

struct KeyboardButtonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.pixel(size: 42.0))
            .frame(width: 50, height: 50)
            .background(.clear)
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(configuration.isPressed ? .black : .blue, lineWidth: 3)
            )
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct NumberButton: View {
    let number: Int
    let action: (Int) -> Void
    
    var body: some View {
        Button("\(number)") {
            action(number)
        }
        .buttonStyle(KeyboardButtonStyle())
    }
}

#Preview {
    VStack {
        HStack {
            Button("1") {}
            .buttonStyle(KeyboardButtonStyle())
            Button("2") {}
            .buttonStyle(KeyboardButtonStyle())
            Button("3") {}
            .buttonStyle(KeyboardButtonStyle())
        }
        HStack {
            Button("4") {}
            .buttonStyle(KeyboardButtonStyle())
            Button("5") {}
            .buttonStyle(KeyboardButtonStyle())
            Button("6") {}
            .buttonStyle(KeyboardButtonStyle())
        }
        HStack {
            Button("7") {}
            .buttonStyle(KeyboardButtonStyle())
            Button("8") {}
            .buttonStyle(KeyboardButtonStyle())
            Button("9") {}
            .buttonStyle(KeyboardButtonStyle())
        }
        HStack {
            Button("<") {}
            .buttonStyle(KeyboardButtonStyle())
            Button("0") {}
            .buttonStyle(KeyboardButtonStyle())
            Button("\u{2713}") {}
            .buttonStyle(KeyboardButtonStyle())
        }
    }
    .frame(width: 400, height: 800)
    .background(Color.blue)
}

