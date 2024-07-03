import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var name = ""
    @State private var description = ""
    
    var habits: Habits
    
    var body: some View {
        VStack {
            HStack {
                Button("Dismiss") {
                    dismiss()
                }
                Spacer()
                Button("Save") {
                    let newHabit = Habit(name: name, description: description, timesCompleted: 0)
                    habits.items.append(newHabit)
                    dismiss()
                }
            }
            VStack {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
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
