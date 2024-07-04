enum Day: String, Codable, CaseIterable {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    
    var firstLetter: String {
        String(self.rawValue.prefix(1)).capitalized
    }
}
