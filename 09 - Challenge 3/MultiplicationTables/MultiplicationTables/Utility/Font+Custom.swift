//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import Foundation
import SwiftUI

extension Font {
    
    /*
     There are no other types, just regular. If there were (bold, italic, etc.)
     this would be an enum with all types.
     */
    struct PixelFont {
        static var value: String {
            return "EXEPixelPerfect"
        }
    }
    
    static func pixel(size: CGFloat = 22) -> Font {
        return .custom(PixelFont.value, size: size)
    }
}
