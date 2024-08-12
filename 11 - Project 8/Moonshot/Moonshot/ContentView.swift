//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingGrid = false
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    private var toolbarIcon: String {
        return isShowingGrid ? "rectangle.grid.1x2" : "rectangle.grid.3x2"
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if isShowingGrid {
                    MissionsGridLayout(missions: missions, astronauts: astronauts)
                } else {
                    MissionsListLayout(missions: missions, astronauts: astronauts)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button(action: {
                    isShowingGrid.toggle()
                }, label: {
                    Image(systemName: toolbarIcon)
                })
                .accessibilityHint("Changes the layout of missions")
            }
        }
    }
}

#Preview {
    ContentView()
}
