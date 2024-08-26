//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import Foundation
import SwiftData

@Model
class Prospect {
    var name: String
    var emailAddress: String
    var isContacted: Bool
    var createdAt: Date
    
    init(name: String, emailAddress: String, isContacted: Bool, createdAt: Date) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
        self.createdAt = createdAt
    }
}
