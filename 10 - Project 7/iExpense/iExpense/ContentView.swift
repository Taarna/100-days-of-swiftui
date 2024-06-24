import Observation
import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var isAddExpensePresented = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Private") {
                    ForEach(expenses.privateItems) { item in
                        ListRow(name: item.name, type: item.type, amount: item.amount)
                    }
                    .onDelete(perform: removePrivateItems)
                }
                Section("Business") {
                    ForEach(expenses.businessItems) { item in
                        ListRow(name: item.name, type: item.type, amount: item.amount)
                    }
                    .onDelete(perform: removeBusinessItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    isAddExpensePresented = true
                }
            }
            .navigationDestination(isPresented: $isAddExpensePresented, destination: {
                AddView(expenses: expenses)
            })
        }
    }
    
    private func removePrivateItems(at offsets: IndexSet) {
        expenses.privateItems.remove(atOffsets: offsets)
    }
    
    private func removeBusinessItems(at offsets: IndexSet) {
        expenses.businessItems.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
