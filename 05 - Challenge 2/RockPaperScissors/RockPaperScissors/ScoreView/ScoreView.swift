//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct ScoreView: View {
    var score: Int
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text("Score")
                .fontWeight(.bold)
            Text("\(score)")
        }
        .foregroundStyle(.accent)
    }

}

#Preview {
    ScoreView(score: 50)
}
