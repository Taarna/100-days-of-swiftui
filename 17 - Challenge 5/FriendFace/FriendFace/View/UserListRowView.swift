//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct UserListRowView: View {
    var name: String
    var age: Int
    var company: String
    var isActive: Bool
    
    let activeColor = Color(red: 61/255, green: 136/255, blue: 118/255)
    let inactiveColor = Color(red: 208/255, green: 46/255, blue: 52/255)
    
    var body: some View {
        HStack(spacing: 20) {
            ZStack {
                Image(systemName: "person")
                    .font(.system(size: 50, weight: .black))
                    .foregroundStyle(
                        Color(red: 216/255, green: 161/255, blue: 65/255, opacity: 0.6)
                    )
                Circle()
                    .fill(isActive ? activeColor : inactiveColor)
                    .frame(width: 10, height: 10)
                    .position(x: 5, y: 5)
            }
            .frame(width: 50, height: 50, alignment: .topLeading)
            
            VStack(alignment: .leading) {
                Text("\(name), \(age)")
                    .font(.headline)
                Text("\(company)")
                    .font(.title3)
            }
            .foregroundStyle(.black)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    UserListRowView(name: "David", age: 35, company: "Disney", isActive: true)
}
