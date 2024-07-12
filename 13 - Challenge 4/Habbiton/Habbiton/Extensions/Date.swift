//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import Foundation

extension Date {
    static var currentDay: String {
        return self.now.formatted(.dateTime.weekday(.abbreviated))
    }
    
    static var currentFormatted: String {
        return self.now.formatted(.dateTime.weekday(.abbreviated).day(.twoDigits)
        )
    }
}
