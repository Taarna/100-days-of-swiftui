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

#Preview {
    let friends = [
        Friend(id: "1-1", name: "Monica"),
        Friend(id: "1-2", name: "Phoebe")
    ]
    let user = User(
        id: "2-1",
        about: "I like water sports",
        age: 30,
        company: "Unknown LLC",
        friends: friends,
        isActive: true,
        name: "Chandler"
    )
    UserDetailsView(user: user)
}
