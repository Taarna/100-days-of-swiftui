//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import Foundation
import SwiftData

@Model
class ExpenseItem {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    let isPrivate: Bool
    
    init(id: UUID = UUID(), name: String, type: String, amount: Double, isPrivate: Bool) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
        self.isPrivate = isPrivate
    }
}
