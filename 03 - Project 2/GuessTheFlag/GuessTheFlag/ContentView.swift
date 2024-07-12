//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var numberOfTries = 8
    
    @State private var showingScore = false
    @State private var showingGameFinished = false
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State private var animationRotation = 0.0
    @State private var selectedIndex = -1
    @State private var buttonOpacity = 1.0
    @State private var scaleFactor = 1.0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                            withAnimation {
                                animationRotation += 360
                                buttonOpacity = 0.25
                                scaleFactor = 0.8
                            }
                        } label: {
                            FlagView(flagImage: countries[number])
                        }
                        .rotation3DEffect(.degrees(selectedIndex == number ? animationRotation : 0), axis: (x: 0, y: 1, z: 0))
                        .opacity(selectedIndex == number ? 1.0 : buttonOpacity)
                        .scaleEffect(selectedIndex == number ? 1.0 : scaleFactor)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Text("Tries left: \(numberOfTries)")
                    .foregroundStyle(.white)
                    .font(.title)
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("Game finished!", isPresented: $showingGameFinished) {
            Button("Reset", action: resetGame)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        numberOfTries -= 1
        
        if number == correctAnswer {
            increaseScore()
            scoreTitle = "Correct"
        } else {
            reduceScore()
            let selectedCountry = countries[number]
            scoreTitle = "Wrong! That’s the flag of \(selectedCountry)"
        }
        
        selectedIndex = number
        
        showingScore = true
    }
    
    private func reduceScore() {
        if score > 0 {
            score -= 1
        }
    }
    
    private func increaseScore() {
        score += 1
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0..<3)
        
        if (numberOfTries == 0) {
            showingGameFinished = true
        }
        
        selectedIndex = -1
        buttonOpacity = 1.0
        scaleFactor = 1.0
    }
    
    private func resetGame() {
        score = 0
        numberOfTries = 8
        scoreTitle = ""
    }
    
}

#Preview {
    ContentView()
}
