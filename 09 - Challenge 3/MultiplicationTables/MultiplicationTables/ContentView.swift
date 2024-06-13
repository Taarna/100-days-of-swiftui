import SwiftUI

struct ContentView: View {
    var viewModel: GameViewModel
    
    var body: some View {
        if !viewModel.isGameActive() {
            Section("Which table do you want to practice?") {
                Text("Font test")
                    .font(Font.pixelify(.regular, size: 26.0))
                HStack {
                    Button("-") {
                        viewModel.decreaseTableNumber()
                    }
                    Text("\(viewModel.getSelectedTable())")
                        .font(Font.custom("PixelifySans", size: 18))
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
                withAnimation(.smooth) {
                    viewModel.startNewGame()
                }
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
