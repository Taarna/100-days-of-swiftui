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
