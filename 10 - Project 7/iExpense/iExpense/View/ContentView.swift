//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import Observation
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<ExpenseItem> { item in
        item.isPrivate == true
    }, sort: \ExpenseItem.amount) var privateItems: [ExpenseItem]
    @Query(filter: #Predicate<ExpenseItem> { item in
        item.isPrivate == false
    }, sort: \ExpenseItem.amount) var businessItems: [ExpenseItem]
    
    @State private var isAddExpensePresented = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Private") {
                    ForEach(privateItems) { item in
                        ListRow(name: item.name, type: item.type, amount: item.amount)
                    }
//                    .onDelete(perform: removePrivateItems)
                }
                Section("Business") {
                    ForEach(businessItems) { item in
                        ListRow(name: item.name, type: item.type, amount: item.amount)
                    }
//                    .onDelete(perform: removeBusinessItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    isAddExpensePresented = true
                }
            }
            .navigationDestination(isPresented: $isAddExpensePresented, destination: {
                AddView()
            })
        }
    }
    
//    private func removePrivateItems(at offsets: IndexSet) {
//        expenses.privateItems.remove(atOffsets: offsets)
//    }
//    
//    private func removeBusinessItems(at offsets: IndexSet) {
//        expenses.businessItems.remove(atOffsets: offsets)
//    }
}

#Preview {
    ContentView()
}
