//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var name = ""
    @State private var description = ""
    
    @State var viewModel: AddHabitViewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Save") {
                    viewModel.addHabit(name: name, description: description)
                    dismiss()
                }
                .disabled(name.isEmpty || description.isEmpty)
            }
            VStack {
                RoundedTextField(placeholder: "Name", text: $name)
                RoundedTextField(placeholder: "Description", text: $description)
                Spacer()
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    AddHabitView(viewModel: AddHabitViewModel(habits: Habits()))
}
