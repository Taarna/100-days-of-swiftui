//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SamplePackage
import SwiftUI

struct ContentView: View {
    let possibleNumbers = 1...60
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.formatted()
    }
    
    var body: some View {
        Text(results)
    }
}

#Preview {
    ContentView()
}
