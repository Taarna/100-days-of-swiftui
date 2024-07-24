//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct FriendListRowView: View {
    var name: String
    
    var body: some View {
        HStack {
            Text(name)
            Spacer()
        }
    }
}

#Preview {
    FriendListRowView(name: "Chandler Bing")
}
