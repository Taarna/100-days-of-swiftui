//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct UserDetailsView: View {
    var user: User
    
    var body: some View {
        Text(user.name)
    }
}

#Preview {
    UserDetailsView(user: User(id: "gahjsgdhajg", isActive: true, name: "David", age: 34, company: "Disney"))
}
