//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import Foundation
import SwiftData

@Model
class Character {
    var name: String
    @Attribute(.externalStorage) var photo: Data
    
    init(name: String, photo: Data) {
        self.name = name
        self.photo = photo
    }
}
