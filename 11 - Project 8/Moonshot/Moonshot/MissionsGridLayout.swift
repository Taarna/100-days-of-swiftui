import SwiftUI

struct MissionsGridLayout: View {
    var missions: [Mission]
    var astronauts: [String: Astronaut]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink(value: mission) {
                        MissionCellView(mission: mission)
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationDestination(for: Mission.self, destination: { mission in
                MissionDetailsView(mission: mission, astronauts: astronauts)
            })
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionsGridLayout(missions: missions, astronauts: astronauts)
}
