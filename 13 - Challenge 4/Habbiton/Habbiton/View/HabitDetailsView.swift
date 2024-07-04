import SwiftUI

struct HabitDetailsView: View {
    var habit: Habit
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 30)
            Text(Date.currentFormatted)
            Text("\(habit.timesCompleted)")
                .foregroundStyle(Color.counter)
                .font(.title)
                .padding(50)
                .background(
                    Circle()
                        .fill(Color.accent)
                )
            Spacer()
                .frame(height: 80)
            
            HStack {
                ForEach(habit.days, id: \.day) { dayCompletion in
                    Text(dayCompletion.day.firstLetter)
                        .foregroundStyle(Color.counter)
                        .padding()
                        .frame(width: 48)
                        .background(
                            Circle()
                                .fill(Color.accent)
                                .frame(width: 50)
                        )
                }
            }
            .padding()
            Spacer()
                
            Text(habit.name)
                .font(.system(size: 64))
            Text(habit.description)
            Spacer()
        }
    }
}

#Preview {
    let habit = Habit(id: UUID(), name: "Name", description: "Description", timesCompleted: 3)
    
    return HabitDetailsView(habit: habit)
}
