//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import Foundation

@Observable
class AddHabitViewModel {
    var habits: Habits
    
    init(habits: Habits) {
        self.habits = habits
    }
    
    func addHabit(name: String, description: String) {
        let newHabit = Habit(name: name, description: description)
        habits.items.append(newHabit)
    }
}
