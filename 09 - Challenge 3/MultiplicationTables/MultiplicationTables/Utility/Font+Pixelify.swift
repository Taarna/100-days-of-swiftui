import Foundation
import SwiftUI

extension Font {
    
    enum PixelifyFont {
        case regular
        case semibold
        
        var value: String {
            switch self {
            case .regular:
                return "PixelifySans-Regular"
            case .semibold:
                return "PixelifySans-Regular_SemiBold"
            }
        }
    }
    
    static func pixelify(_ type: PixelifyFont, size: CGFloat = 22) -> Font {
        return .custom(type.value, size: size)
    }
}
