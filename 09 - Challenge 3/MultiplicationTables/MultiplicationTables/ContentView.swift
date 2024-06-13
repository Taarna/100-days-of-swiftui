import SwiftUI

struct ContentView: View {
    var viewModel: GameViewModel
    
    var body: some View {
        Section("Which table do you want to practice?") {
            HStack {
                Button("-") {
                    viewModel.decreaseTableNumber()
                }
                Text("\(viewModel.getSelectedTable())")
                Button("+") {
                    viewModel.increaseTableNumber()
                }
            }
        }
        
        Section("How many questions?") {
            Picker("How many questions?", selection: Binding(
                get: { viewModel.getNumberOfQuestions() },
                set: { viewModel.setNumberOfQuestions($0)})
            ){
                ForEach(0..<viewModel.getPossibleQuestions().count, id: \.self) { index in
                    Text("\(viewModel.getPossibleQuestions()[index])").tag(viewModel.getPossibleQuestions()[index])
                }
            }
            .labelsHidden()
            .pickerStyle(.segmented)
        }
        
        Button("Start Game") {
            viewModel.startNewGame()
        }
    }
}

#Preview {
    ContentView(viewModel: GameViewModel())
}
