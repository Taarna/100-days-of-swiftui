//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

import SwiftUI

let MAX_BLUR_AMOUNT = 30.0
let BLUR_STEP = 3.0
let START_BLUR_AMOUNT = MAX_BLUR_AMOUNT / 2

struct ContentView: View {
    @State private var sliderValue = START_BLUR_AMOUNT
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    @State private var moodText = "Neutral"
    
    private var blurAmount: Double {
        MAX_BLUR_AMOUNT - sliderValue
    }
    
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
                .blur(radius: blurAmount * 5)
            
            VStack {
                Text("How are you feeling?")
                    .font(.largeTitle)
                    .padding()
                
                VStack {
                    Text(moodText)
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                        .background(backgroundColor.opacity(0.7))
                        .cornerRadius(10)
                    
                    Slider(value: $sliderValue, in: 0...MAX_BLUR_AMOUNT, step: BLUR_STEP)
                        .frame(width: 300)
                        .onChange(of: sliderValue) { _, newValue in
                            print("Emotional clarity: \(newValue)")
                        }
                    
                    Text("Emotional Clarity: \(String(format: "%.0f", sliderValue))")
                        .font(.caption)
                }
                .opacity(moodText == "Neutral" ? 0 : 1)
                
                Spacer()
                
                Button("Change Mood") {
                    showingConfirmation = true
                }
                .frame(width: 200, height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .confirmationDialog("Select your mood", isPresented: $showingConfirmation) {
            Button("Happy") {
                backgroundColor = .yellow
                moodText = "Happy"
                sliderValue = START_BLUR_AMOUNT
            }
            Button("Angry") {
                backgroundColor = .red
                moodText = "Angry"
                sliderValue = START_BLUR_AMOUNT
            }
            Button("Energetic") {
                backgroundColor = .orange
                moodText = "Energetic"
                sliderValue = START_BLUR_AMOUNT
            }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("How are you feeling right now?")
        }
    }
}

#Preview {
    ContentView()
}
