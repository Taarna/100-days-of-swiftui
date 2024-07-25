//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @AppStorage("data-downloaded") private var dataDownloaded = false
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) private var users: [User]
    
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
                        if (!dataDownloaded) {
                            await downloadData()
                            dataDownloaded = true
                            print("Data downloaded")
                        }
                    }
                }
                .navigationTitle("FriendFace")
                .navigationDestination(for: User.self, destination: { user in
                    UserDetailsView(user: user)
                })
            }
        }
        .onAppear {
            print("Number of users: \(users.count)")
            for user in users {
                print(user.name)
            }
        }
    }
    
    func downloadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                let users = decodedResponse
                
                for user in users {
                    modelContext.insert(user)
                }
                print("Data saved")
            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
}
