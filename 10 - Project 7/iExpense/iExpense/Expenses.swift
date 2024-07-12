//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import Foundation

@Observable
class Expenses {
    var privateItems = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(privateItems) {
                UserDefaults.standard.set(encoded, forKey: "PrivateItems")
            }
        }
    }
    var businessItems = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(businessItems) {
                UserDefaults.standard.set(encoded, forKey: "BusinessItems")
            }
        }
    }
    
    init() {
        if let savedPrivateItems = UserDefaults.standard.data(forKey: "PrivateItems") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedPrivateItems) {
                privateItems = decodedItems
            } else {
                privateItems = []
            }
        }
        if let savedBusinessItems = UserDefaults.standard.data(forKey: "BusinessItems") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedBusinessItems) {
                businessItems = decodedItems
            }
        } else {
            businessItems = []
        }
    }
}
