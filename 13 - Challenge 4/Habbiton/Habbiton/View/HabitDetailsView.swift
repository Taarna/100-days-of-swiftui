import SwiftUI

struct HabitDetailsView: View {
    var habit: Habit
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 30)
            Text("Wed, 4")
            Text("320")
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
                ForEach(Day.allCases, id: \.self) { day in
                    Text(day.firstLetter)
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
                
            Text("Hydration")
                .font(.system(size: 64))
            Text("Drink at least 2L of water daily")
            Spacer()
        }
    }
}

#Preview {
    let habit = Habit(id: UUID(), name: "Name", description: "Description", timesCompleted: 3)
    
    return HabitDetailsView(habit: habit)
}
