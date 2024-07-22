//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import Observation
import SwiftData
import SwiftUI

enum ExpenseFilter {
    case all, privateItems, businessItems
}

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name)
    ]
    @State private var filterOption: ExpenseFilter = .all
    @Query(sort: \ExpenseItem.name) var items: [ExpenseItem]
    
    @State private var isAddExpensePresented = false
    
    @State private var showPrivate = true
    @State private var showBusiness = true
    
    var body: some View {
        NavigationStack {
            ExpensesView(sortOrder: sortOrder, filter: filterOption)
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
                    Menu("Filter", systemImage: "line.3.horizontal.decrease.circle") {
                        Picker("Filter", selection: $filterOption) {
                            Text("All").tag(ExpenseFilter.all)
                            Text("Private").tag(ExpenseFilter.privateItems)
                            Text("Business").tag(ExpenseFilter.businessItems)
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
    
    init(sortOrder: [SortDescriptor<ExpenseItem>], filter: ExpenseFilter) {
        let predicate: Predicate<ExpenseItem>
        switch filter {
        case .all:
            predicate = #Predicate<ExpenseItem> { _ in true }
        case .privateItems:
            predicate = #Predicate<ExpenseItem> { $0.isPrivate == true }
        case .businessItems:
            predicate = #Predicate<ExpenseItem> { $0.isPrivate == false }
        }
        
        _items = Query(filter: predicate, sort: sortOrder)
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
