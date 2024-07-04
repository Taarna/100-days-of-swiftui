import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var name = ""
    @State private var description = ""
    
    var habits: Habits
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Save") {
                    let newHabit = Habit(name: name, description: description)
                    habits.items.append(newHabit)
                    dismiss()
                }
            }
            VStack {
                RoundedTextField(placeholder: "Name", text: $name)
                RoundedTextField(placeholder: "Description", text: $description)
                Spacer()
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    AddHabitView(habits: Habits())
}
