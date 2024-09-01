//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct SimpleGesturesView: View {
    var body: some View {
        Text("Double Tap")
            .foregroundColor(.black)
            .padding()
            .background(RoundedRectangle(cornerRadius: 5).fill(Color.pink.opacity(0.2)))
            .onTapGesture(count: 2) {
                print("Double tapped!")
            }
        
        Text("Long Press")
            .foregroundColor(.black)
            .padding()
            .background(RoundedRectangle(cornerRadius: 5).fill(Color.pink.opacity(0.2)))
            .onLongPressGesture {
                print("Long pressed!")
            }
        
        Text("2 Seconds Long Press")
            .foregroundColor(.black)
            .padding()
            .background(RoundedRectangle(cornerRadius: 5).fill(Color.pink.opacity(0.2)))
            .onLongPressGesture(minimumDuration: 2) {
                print("Long pressed!")
            }
        
        Text("Gesture Change")
            .foregroundColor(.black)
            .padding()
            .background(RoundedRectangle(cornerRadius: 5).fill(Color.pink.opacity(0.2)))
            .onLongPressGesture(minimumDuration: 1) {
                print("Long pressed!")
            } onPressingChanged: { inProgress in
                print("In progress: \(inProgress)!")
            }
    }
}

#Preview {
    SimpleGesturesView()
}
