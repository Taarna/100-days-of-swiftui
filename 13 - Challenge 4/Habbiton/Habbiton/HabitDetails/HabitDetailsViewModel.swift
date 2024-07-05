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
    
    func getFirstLetter(forDayCompletion dayCompletion: DayCompletion) -> String {
        dayCompletion.day.firstLetter
    }
    
    func updateHabit(forDayCompletion dayCompletion: DayCompletion) {
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
        habit = newHabit
    }
    
    func isCurrentDay(_ dayCompletion: DayCompletion) -> Bool {
        Date.currentDay == dayCompletion.day.firstThreeLetters
    }
    
    func isDayCompleted(_ dayCompletion: DayCompletion) -> Bool {
        dayCompletion.completed
    }
}
