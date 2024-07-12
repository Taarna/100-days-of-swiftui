//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import Foundation

struct DayCompletion: Codable, Hashable {
    let day: Day
    var isCompleted: Bool
    
    var firstLetter: String {
        day.firstLetter
    }
    var isCurrentDay: Bool {
        Date.currentDay == day.firstThreeLetters
    }
}
