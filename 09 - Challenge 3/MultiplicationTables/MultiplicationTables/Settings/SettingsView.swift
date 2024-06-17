import SwiftUI

struct SettingsView: View {
    @State private var showGameScreen = false
    
    private var viewModel: SettingsViewModel
    
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
    }
    
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
                    
                    NavigationLink(destination: GameView(viewModel: GameViewModel(settings: viewModel.getSettings()))) {
                        Text("Start Game")
                    }
                    .buttonStyle(SettingsButton(isSelected: false))
                }
                .padding(30)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.yellow)
                        .shadow(radius: 10)
                )
                
            }
        }
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
