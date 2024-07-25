//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import Foundation
import SwiftData

@Model
class User: Codable {
    enum CodingKeys: String, CodingKey {
        case id, about, age, company, friends, isActive, name
    }
    
    var id: String
    var about: String
    var age: Int
    var company: String
    var friends: [Friend]
    var isActive: Bool
    var name: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.about = try container.decode(String.self, forKey: .about)
        self.age = try container.decode(Int.self, forKey: .age)
        self.company = try container.decode(String.self, forKey: .company)
        self.friends = try container.decode([Friend].self, forKey: .friends)
        self.isActive = try container.decode(Bool.self, forKey: .isActive)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.about, forKey: .about)
        try container.encode(self.age, forKey: .age)
        try container.encode(self.company, forKey: .company)
        try container.encode(self.friends, forKey: .friends)
        try container.encode(self.isActive, forKey: .isActive)
        try container.encode(self.name, forKey: .name)
    }
}
