import SwiftUI

struct HabitsListView: View {
    @State var viewModel: HabitsListViewModel
    @State private var isAddHabitPresented = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(viewModel.habits.items) { habit in
                        NavigationLink(value: habit) {
                            VStack(alignment: .leading) {
                                Text(habit.name)
                                    .font(.system(size: 44))
                                Text(habit.description)
                                HStack {
                                    ForEach(habit.days, id: \.day) { dayCompletion in
                                        let isCurrentDay = viewModel.isCurrentDay(dayCompletion)
                                        let isCompleted = viewModel.isDayCompleted(dayCompletion)
                                        
                                        Button(dayCompletion.firstLetter) {
                                            viewModel.updateHabit(habit, forDayCompletion: dayCompletion)
                                        }
                                        .buttonStyle(DayButton(isCompleted: isCompleted, isCurrentDay: isCurrentDay))
                                    }
                                }
                            }
                            .padding(.vertical)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Habbiton")
            .navigationDestination(for: Habit.self, destination: { habit in
                HabitDetailsView(viewModel: HabitDetailsViewModel(habit: habit, habits: viewModel.habits))
            })
            .toolbar {
                Button("Add") {
                    isAddHabitPresented = true
                }
            }
            .sheet(isPresented: $isAddHabitPresented) {
                AddHabitView(viewModel: AddHabitViewModel(habits: viewModel.habits))
            }
        }
    }
}

#Preview {
    HabitsListView(viewModel: HabitsListViewModel(habits: Habits()))
}
