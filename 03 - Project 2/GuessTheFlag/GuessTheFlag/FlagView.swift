//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct FlagView: View {
    var flagImage: String
    
    var body: some View {
        Image(flagImage)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

#Preview {
    FlagView(flagImage: "Nigeria")
}
