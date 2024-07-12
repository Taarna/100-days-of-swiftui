//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
