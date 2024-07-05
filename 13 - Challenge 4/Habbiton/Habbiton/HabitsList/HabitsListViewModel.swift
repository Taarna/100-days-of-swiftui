import Foundation

@Observable
class HabitsListViewModel {
    var habits: Habits
    
    init(habits: Habits) {
        self.habits = habits
    }
}
