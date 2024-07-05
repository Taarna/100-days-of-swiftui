
struct DayCompletion: Codable, Hashable {
    let day: Day
    var completed: Bool
    
    var firstLetter: String {
        day.firstLetter
    }
}
