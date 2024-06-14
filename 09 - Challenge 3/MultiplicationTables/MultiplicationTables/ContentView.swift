import SwiftUI

struct ContentView: View {
    var viewModel: GameViewModel
    
    var body: some View {
        if !viewModel.isGameActive() {
            ZStack {
                Color.blue.ignoresSafeArea()
                
                VStack {
                    Section("Which table do you want to practice?") {
                        HStack {
                            Button(action: {
                                viewModel.decreaseTableNumber()
                            }, label: {
                                Text("-")
                                    .font(Font.pixel(.regular, size: 36.0))
                                    .tint(Color.black)
                            })
                            .padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 7))
                            
                            Text("\(viewModel.getSelectedTable())")
                                .font(Font.arcade(.regular, size: 30.0))
                            
                            Button(action: {
                                viewModel.increaseTableNumber()
                            }, label: {
                                Text("+")
                                    .font(Font.pixel(.regular, size: 36.0))
                                    .tint(Color.black)
                            })
                            .padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 7))
                        }
                    }
                    .font(Font.pixel(.regular, size: 30.0))
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))
                    
                    Spacer()
                        .frame(height: 30)
                    
                    Section("How many questions?") {
                        HStack {
                            ForEach(0..<viewModel.getPossibleQuestions().count, id: \.self) { questionIndex in
                                Button(action: {
                                    let questionNumber = viewModel.getPossibleQuestions()[questionIndex]
                                    viewModel.setNumberOfQuestions(questionNumber)
                                }) {
                                    Text("\(viewModel.getPossibleQuestions()[questionIndex])")
                                }
                                .buttonStyle(QuestionsButton(isSelected: viewModel.getNumberOfQuestions() == viewModel.getPossibleQuestions()[questionIndex]))
                            }
                        }
                    }
                    .font(Font.pixel(.regular, size: 30.0))
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Button("Start Game") {
                        withAnimation(.smooth) {
                            viewModel.startNewGame()
                        }
                    }
                    .font(Font.pixel(.regular, size: 30.0))
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.clear)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 3)
                    )
                    .padding()
                }
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.yellow)
                        .shadow(radius: 10)
                )
                .padding()
            }
            
        } else {
            HStack {
                VStack {
                    Text("Score")
                    Text("2")
                }
                Spacer()
                VStack {
                    Text("Round")
                    Text("5/10")
                }
            }
            .padding()
            
            Text("9 x 8")
            
            VStack {
                HStack {
                    Button("1") { }
                    Button("2") { }
                    Button("3") {}
                }
                HStack {
                    Button("4") { }
                    Button("5") { }
                    Button("6") { }
                }
                HStack {
                    Button("7") { }
                    Button("8") { }
                    Button("9") { }
                }
                HStack {
                    Button("<") { }
                    Button("0") { }
                    Button("ok") { }
                }
            }
        }
    }
}

#Preview {
    ContentView(viewModel: GameViewModel())
}
