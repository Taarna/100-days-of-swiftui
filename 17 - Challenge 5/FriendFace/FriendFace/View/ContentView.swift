//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(users, id: \.id) { user in
                            NavigationLink(value: user) {
                                UserListRowView(name: user.name, age: user.age, company: user.company, isActive: user.isActive)
                            }
                        }
                    }
                    .padding()
                    .task {
                        if (users.isEmpty) {
                            await loadData()
                        }
                    }
                }
                .navigationTitle("FriendFace")
                .navigationDestination(for: User.self, destination: { user in
                    UserDetailsView(user: user)
                })
            }
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                users = decodedResponse
            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
}
