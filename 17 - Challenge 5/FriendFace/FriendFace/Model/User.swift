//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import Foundation

struct User: Codable, Hashable {
    var id: String
    var about: String
    var age: Int
    var company: String
    var friends: [Friend]
    var isActive: Bool
    var name: String
}
