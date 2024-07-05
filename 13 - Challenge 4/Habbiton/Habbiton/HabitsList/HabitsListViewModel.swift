import Foundation

@Observable
class HabitsListViewModel {
    var habits: Habits
    
    init(habits: Habits) {
        self.habits = habits
    }
    
    func isCurrentDay(_ dayCompletion: DayCompletion) -> Bool {
        Date.currentDay == dayCompletion.day.firstThreeLetters
    }
    
    func isDayCompleted(_ dayCompletion: DayCompletion) -> Bool {
        dayCompletion.completed
    }
    
    func updateHabit(_ habit: Habit, forDayCompletion dayCompletion: DayCompletion) {
        guard let dayCompletionIndex = habit.days.firstIndex(of: dayCompletion) else { return }
        guard let habitIndex = habits.items.firstIndex(of: habit) else { return }
        
        var newHabit = habit
        let newDayCompletion = DayCompletion(day: dayCompletion.day, completed: !dayCompletion.completed)
        
        if dayCompletion.completed {
            newHabit.timesCompleted -= 1
        } else {
            newHabit.timesCompleted += 1
        }
        
        newHabit.days[dayCompletionIndex] = newDayCompletion
        
        habits.items[habitIndex] = newHabit
    }
}
