import SwiftUI

struct HabitDetailsView: View {
    @State var viewModel: HabitDetailsViewModel
    
    var body: some View {
        VStack {
            Text(Date.currentFormatted)
            Text("\(viewModel.getTimesCompleted())")
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
                ForEach(viewModel.getDays(), id: \.day) { dayCompletion in
                    let isCurrentDay = viewModel.isCurrentDay(dayCompletion)
                    let isCompleted = viewModel.isDayCompleted(dayCompletion)
                    
                    Button(viewModel.getFirstLetter(forDayCompletion: dayCompletion)) {
                        viewModel.updateHabit(forDayCompletion: dayCompletion)
                    }
                    .buttonStyle(DayButton(isCompleted: isCompleted, isCurrentDay: isCurrentDay))
                }
            }
            Spacer()
            
            Text(viewModel.getName())
                .font(.system(size: 64))
            Text(viewModel.getDescription())
            Spacer()
        }
    }
}

#Preview {
    let habits = Habits()
    let habit = Habit(
        id: UUID(),
        name: "Hydration",
        description: "Drink at least 2L of water daily",
        timesCompleted: 3
    )
    let viewModel = HabitDetailsViewModel(habit: habit, habits: habits)
    
    return HabitDetailsView(viewModel: viewModel)
}
