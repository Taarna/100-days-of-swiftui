//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var number: Int

    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
    }
}

#Preview {
    return DetailView(number: 3)
}
