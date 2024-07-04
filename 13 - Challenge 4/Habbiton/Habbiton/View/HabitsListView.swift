import SwiftUI

struct HabitsListView: View {
    @State private var habits = Habits()
    @State private var isAddHabitPresented = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                    ForEach(habits.items) { habit in
                        Text(habit.name)
                    }
                })
            }
            .navigationTitle("Habbiton")
            .toolbar {
                Button("Add") {
                    isAddHabitPresented = true
                }
            }
            .sheet(isPresented: $isAddHabitPresented) {
                AddHabitView(habits: habits)
            }
        }
    }
}

#Preview {
    HabitsListView()
}
