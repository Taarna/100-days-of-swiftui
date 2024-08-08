//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}
