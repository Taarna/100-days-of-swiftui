import Foundation
import SwiftUI

extension Font {
    
    enum ArcadeFont {
        case regular
        
        var value: String {
            switch self {
            case .regular:
                return "ArcadeClassic"
            }
        }
    }
    
    enum PixelFont {
        case regular
        
        var value: String {
            switch self {
            case .regular:
                return "EXEPixelPerfect"
            }
        }
    }
    
    static func arcade(_ type: ArcadeFont, size: CGFloat = 22) -> Font {
        return .custom(type.value, size: size)
    }
    
    static func pixel(_ type: PixelFont, size: CGFloat = 22) -> Font {
        return .custom(type.value, size: size)
    }
}
