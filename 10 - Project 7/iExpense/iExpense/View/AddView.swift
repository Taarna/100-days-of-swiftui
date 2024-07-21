//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    TextField("Name", text: $name)
                        .font(.headline)
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let isPrivate = (type == "Personal")
                        let newItem = ExpenseItem(name: name, type: type, amount: amount, isPrivate: isPrivate)
                        modelContext.insert(newItem)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddView()
}
