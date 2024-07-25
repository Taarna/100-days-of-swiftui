//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct UserDetailsView: View {
    var user: User
    
    var body: some View {
        VStack {
            Text(user.name)
                .font(.title)
            Text("Age: \(user.age)")
            Text(user.about)
                .padding()
        }
        
        Text("Friends")
            .font(.largeTitle)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        
        ScrollView {
            LazyVStack {
                ForEach(user.friends, id: \.id) { friend in
                    FriendListRowView(name: friend.name)
                        .padding()
                }
            }
        }
    }
}
