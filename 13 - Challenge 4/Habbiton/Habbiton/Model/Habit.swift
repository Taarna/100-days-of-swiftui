import Foundation

struct Habit: Codable, Identifiable {
    var id = UUID()
    let name: String
    let description: String
    var timesCompleted: Int
}
