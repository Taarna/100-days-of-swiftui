import SwiftUI

struct HabitDetailsView: View {
    var habit: Habit
    
    var body: some View {
        Text(habit.name)
    }
}

#Preview {
    let habit = Habit(id: UUID(), name: "Name", description: "Description", timesCompleted: 3)
    
    return HabitDetailsView(habit: habit)
}
