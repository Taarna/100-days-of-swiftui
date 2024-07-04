import Foundation

struct Habit: Codable, Identifiable, Hashable {
    var id = UUID()
    let name: String
    let description: String
    var timesCompleted: Int
    var days: [DayCompletion] = Day.allCases.map { day in
        return DayCompletion(day: day, completed: false)
    }
}
