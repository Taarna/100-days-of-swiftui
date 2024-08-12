//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var score = 0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        VStack {
            Text("Word Scramble")
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
                .frame(height: 16)
            
            Text("Your score: \(score) points")
                .listRowBackground(Color.shakespeare)
            
            Spacer()
                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            
            Text("\(rootWord)")
                .background(
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .fill(.thinMaterial)
                        .frame(width: 250, height: 100)
                )
                .font(.largeTitle)
            
            
            Spacer()
                .frame(height: 100)
            
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 15.0, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .fill(.thinMaterial)
                    .frame(width: 250, height: 50)
                
                TextField("Enter your word", text: $newWord)
                    .padding()
                    .frame(width: 230, height: 40)
                    .background(Color.clear)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal)
            
            Spacer()
                .frame(height: 20)
            
            ScrollView {
                ForEach(usedWords, id: \.self) { usedWord in
                    HStack(alignment: .center) {
                        Image(systemName: "\(usedWord.count).circle")
                        Text(usedWord)
                    }
                    .accessibilityElement()
                    .accessibilityLabel("\(usedWord), \(usedWord.count) letters")
                    .padding(5)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.shakespeare)
        .fontDesign(.monospaced)
        .onAppear(perform: startGame)
        .onSubmit(addNewWord)
        .alert(errorTitle, isPresented: $showingError) { } message: {
            Text(errorMessage)
        }
    }
    
    private func addNewWord() {
        let answer = newWord
            .lowercased()
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 2 else {
            wordError(title: "Word too short", message: "Words should have at least 3 characters")
            return
        }
        
        guard answer != rootWord else {
            wordError(title: "Wrong!", message: "You can't use the start word")
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        score += answer.count
        
        newWord = ""
    }
    
    private func startGame() {
        guard let wordsFileURL = Bundle.main.url(forResource: "start", withExtension: "txt") else {
            fatalError("Could not load start.txt from bundle.")
        }
        guard let startWords = try? String(contentsOf: wordsFileURL) else {
            fatalError("Could not load the file content.")
        }
        
        let allWords = startWords.components(separatedBy: .newlines)
        rootWord = allWords.randomElement() ?? "silkworm"
        
        score = 0
        usedWords.removeAll()
        newWord = ""
    }
    
    private func isOriginal(word: String) -> Bool {
        return !usedWords.contains(word)
    }
    
    private func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    private func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    private func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

#Preview {
    ContentView()
}
