import SwiftUI

struct SettingsView: View {
    @State private var showGameScreen = false
    
    private(set) var viewModel: SettingsViewModel
    
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue.ignoresSafeArea()
                
                VStack {
                    Section("Which table do you want to practice?") {
                        HStack {
                            Button("-") {
                                viewModel.decreaseMultiplicationTable()
                            }
                            .buttonStyle(PlusMinusButton())
                            
                            Text("\(viewModel.getMultiplicationTable())")
                                .font(Font.arcade(.regular, size: 30.0))
                            
                            Button("+") {
                                viewModel.increaseMultiplicationTable()
                            }
                            .buttonStyle(PlusMinusButton())
                        }
                    }
                    .font(Font.pixel(.regular, size: 30.0))
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                    
                    Spacer()
                        .frame(height: 30)
                    
                    Section("How many questions?") {
                        HStack {
                            ForEach(0..<viewModel.getPossibleQuestionNumbers().count, id: \.self) { questionIndex in
                                let numOfQuestions = viewModel.getPossibleQuestionNumbers()[questionIndex]
                                Button(action: {
                                    viewModel.setNumberOfQuestions(numOfQuestions)
                                }) {
                                    Text("\(numOfQuestions)")
                                }
                                .buttonStyle(QuestionsButton(isSelected: viewModel.getNumberOfQuestions() == numOfQuestions))
                            }
                        }
                    }
                    .font(Font.pixel(.regular, size: 30.0))
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                    
                    
                    Spacer()
                        .frame(height: 50)
                    
                    NavigationLink(destination: GameView(viewModel: GameViewModel(settings: viewModel.getSettings()))) {
                        Text("Start Game")
                            .font(Font.pixel(.regular, size: 30.0))
                            .foregroundColor(.black)
                            .padding()
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 3)
                            )
                            .padding()
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.yellow)
                        .shadow(radius: 10)
                )
                
            }
        }
    }
}

#Preview {
    SettingsView(viewModel: SettingsViewModel(settings: GameSettings(numberOfQuestions: 10, multiplicationTable: 3)))
}
