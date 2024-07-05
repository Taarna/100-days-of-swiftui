import SwiftUI

struct HabitsListView: View {
    @State private var habits = Habits()
    @State private var isAddHabitPresented = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(habits.items) { habit in
                        NavigationLink(value: habit) {
                            VStack(alignment: .leading) {
                                Text(habit.name)
                                Text(habit.description)
                                HStack {
                                    ForEach(habit.days, id: \.day) { dayCompletion in
                                        Text(dayCompletion.day.firstLetter)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Habbiton")
            .navigationDestination(for: Habit.self, destination: { habit in
                HabitDetailsView(viewModel: HabitDetailsViewModel(habit: habit, habits: habits))
            })
            .toolbar {
                Button("Add") {
                    isAddHabitPresented = true
                }
            }
            .sheet(isPresented: $isAddHabitPresented) {
                AddHabitView(viewModel: AddHabitViewModel(habits: habits))
            }
        }
    }
}

#Preview {
    HabitsListView()
}
