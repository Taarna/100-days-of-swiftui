//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import LocalAuthentication
import MapKit
import SwiftUI

struct ContentView: View {
    @State private var isUnlocked = false
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 43.54502919029371, longitude: 16.326003451328376),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    var body: some View {
        VStack {
            if isUnlocked {
                MapReader { proxy in
                    Map(position: $position) {
                        ForEach(locations) { location in
                            Annotation(location.name, coordinate: location.coordinate) {
                                Text(location.name)
                                    .font(.headline)
                                    .padding()
                                    .background(.blue)
                                    .foregroundStyle(.white)
                                    .clipShape(.capsule)
                            }
                            .annotationTitles(.hidden)
                        }
                    }
                    .mapStyle(.hybrid(elevation: .realistic))
                    .onMapCameraChange(frequency: .continuous) { context in
                        print(context.region)
                    }
                    .onTapGesture { position in
                        if let coordinate = proxy.convert(position, from: .local) {
                            print(coordinate)
                        }
                    }
                }
                
                HStack(spacing: 50) {
                    Button("Paris") {
                        position = MapCameraPosition.region(
                            MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
                                span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                            )
                        )
                    }

                    Button("Tokyo") {
                        position = MapCameraPosition.region(
                            MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: 35.6897, longitude: 139.6922),
                                span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                            )
                        )
                    }
                }
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    isUnlocked = true
                } else {
                    isUnlocked = false
                }
            }
        } else {
            // no biometrics
        }
    }
}

#Preview {
    ContentView()
}
