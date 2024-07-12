//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct MissionsListLayout: View {
    var missions: [Mission]
    var astronauts: [String: Astronaut]
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink(value: mission) {
                    MissionCellView(mission: mission)
                }
            }
            .listRowBackground(Color.darkBackground)
        }
        .padding([.horizontal, .bottom])
        .listStyle(.plain)
        .navigationDestination(for: Mission.self, destination: { mission in
            MissionDetailsView(mission: mission, astronauts: astronauts)
        })
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionsListLayout(missions: missions, astronauts: astronauts)
}
