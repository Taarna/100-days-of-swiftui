import SwiftUI

@main
struct HabbitonApp: App {
    var body: some Scene {
        WindowGroup {
            HabitsListView(viewModel: HabitsListViewModel(habits: Habits()))
        }
    }
}
