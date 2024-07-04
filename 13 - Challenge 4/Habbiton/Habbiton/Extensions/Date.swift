import Foundation

extension Date {
    static var currentFormatted: String {
        return self.now.formatted(
            .dateTime
                .weekday(.abbreviated)
                .day(.twoDigits)
        )
    }
}
