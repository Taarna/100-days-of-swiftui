//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

enum Day: String, Codable, CaseIterable {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    
    var firstLetter: String {
        String(self.rawValue.prefix(1)).capitalized
    }
    var firstThreeLetters: String {
        String(self.rawValue.prefix(3)).capitalized
    }
}
