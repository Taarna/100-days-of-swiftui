import Foundation

@Observable
class HabitDetailsViewModel {
    var habit: Habit
    var habits: Habits
    
    init(habit: Habit, habits: Habits) {
        self.habit = habit
        self.habits = habits
    }
    
    func getName() -> String {
        habit.name
    }
    
    func getDescription() -> String {
        habit.description
    }
    
    func getTimesCompleted() -> Int {
        habit.timesCompleted
    }
    
    func getDays() -> [DayCompletion] {
        habit.days
    }
    
    func updateHabit(forDayCompletion dayCompletion: DayCompletion) {
        guard let dayCompletionIndex = habit.days.firstIndex(of: dayCompletion) else { return }
        guard let habitIndex = habits.items.firstIndex(of: habit) else { return }
        
        var newHabit = habit
        let newDayCompletion = DayCompletion(day: dayCompletion.day, isCompleted: !dayCompletion.isCompleted)
        
        if dayCompletion.isCompleted {
            newHabit.timesCompleted -= 1
        } else {
            newHabit.timesCompleted += 1
        }
        
        newHabit.days[dayCompletionIndex] = newDayCompletion
        
        habits.items[habitIndex] = newHabit
        habit = newHabit
    }
}
