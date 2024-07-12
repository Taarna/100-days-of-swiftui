//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @State var viewModel: SettingsViewModel
    @State private var isGameActive = false

    var body: some View {
        NavigationStack {
            ZStack {
                Background()
                
                VStack {
                    VStack {
                        Text("Select table")
                            .styleText()
                        
                        HStack {
                            Button("-") {
                                viewModel.decreaseMultiplicationTable()
                            }
                            .buttonStyle(PlusMinusButton())
                            
                            Text("\(viewModel.getMultiplicationTable())")
                                .styleText()
                            
                            Button("+") {
                                viewModel.increaseMultiplicationTable()
                            }
                            .buttonStyle(PlusMinusButton())
                        }
                    }
                    
                    Spacer()
                        .frame(height: 30)
                    
                    VStack {
                        Text("How many questions?")
                            .styleText()
                        
                        HStack(spacing: 12) {
                            ForEach(viewModel.getQuestionNumbers(), id: \.self) { questionNum in
                                Button {
                                    withAnimation {
                                        viewModel.setNumberOfQuestions(questionNum)
                                    }
                                } label: {
                                    Text("\(questionNum)")
                                        .frame(width: 25, height: 25)
                                }
                                .buttonStyle(SettingsButton(isSelected: viewModel.getNumberOfQuestions() == questionNum))
                                
                            }
                        }
                    }
                    
                    Spacer()
                        .frame(height: 60)
                    
                    Button("Start Game") {
                        isGameActive = true
                    }
                    .buttonStyle(SettingsButton(isSelected: false))
                    .navigationDestination(isPresented: $isGameActive) {
                        GameView(viewModel: GameViewModel(settings: viewModel.getSettings()), isGameActive: $isGameActive)
                    }
                }
                .padding(30)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.yellow)
                        .shadow(radius: 10)
                )
                
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    struct Background: View {
        var body: some View {
            Color.blue.ignoresSafeArea()
        }
    }
}

#Preview {
    SettingsView(viewModel: SettingsViewModel(settings: GameSettings(numberOfQuestions: 10, multiplicationTable: 3)))
}
