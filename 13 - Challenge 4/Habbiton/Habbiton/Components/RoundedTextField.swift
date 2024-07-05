import SwiftUI

struct RoundedTextField: View {
    var placeholder: String
    
    @Binding var text: String
    
    var body: some View {
        TextField("", text: $text, prompt: Text(placeholder).foregroundColor(.gray))
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(Color.accent, lineWidth: 2)
            )
    }
}

#Preview {
    @State var text = ""
    
    return RoundedTextField(placeholder: "Name", text: $text)
}
