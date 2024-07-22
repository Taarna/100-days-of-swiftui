//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import Observation
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name)
    ]
    @Query(sort: \ExpenseItem.name) var items: [ExpenseItem]
    
    @State private var isAddExpensePresented = false
    
    var body: some View {
        NavigationStack {
            ExpensesView(sortOrder: sortOrder)
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    isAddExpensePresented = true
                }
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\ExpenseItem.name)
                            ])
                        
                        Text("Sort by Amount")
                            .tag([
                                SortDescriptor(\ExpenseItem.amount)
                            ])
                    }
                }
            }
            .navigationDestination(isPresented: $isAddExpensePresented, destination: {
                AddView()
            })
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let item = items[index]
            modelContext.delete(item)
        }
    }
}

struct ExpensesView: View {
    @Environment(\.modelContext) var modelContext
    @Query var items: [ExpenseItem]
    
    init(sortOrder: [SortDescriptor<ExpenseItem>]) {
        _items = Query(sort: sortOrder)
    }
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRow(name: item.name, type: item.type, amount: item.amount)
            }
            .onDelete(perform: deleteItems)
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let item = items[index]
            modelContext.delete(item)
        }
    }
}

#Preview {
    ContentView()
}
