//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import Foundation

struct Habit: Codable, Identifiable, Hashable {
    var id = UUID()
    let name: String
    let description: String
    var timesCompleted = 0
    var days: [DayCompletion] = Day.allCases.map { day in
        return DayCompletion(day: day, isCompleted: false)
    }
}
