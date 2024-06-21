import SwiftUI

struct MissionsListLayout: View {
    var missions: [Mission]
    var astronauts: [String: Astronaut]
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionDetailsView(mission: mission, astronauts: astronauts)
                } label: {
                    MissionCellView(mission: mission)
                }
            }
            .listRowBackground(Color.darkBackground)
        }
        .padding([.horizontal, .bottom])
        .listStyle(.plain)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionsListLayout(missions: missions, astronauts: astronauts)
}
