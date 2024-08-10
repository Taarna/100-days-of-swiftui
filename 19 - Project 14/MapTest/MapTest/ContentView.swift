//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    
    @State private var startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 43.54502919029371, longitude: 16.326003451328376),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )
    
    var body: some View {
        if viewModel.isUnlocked {
            ZStack {
                MapReader { proxy in
                    Map(initialPosition: startPosition) {
                        ForEach(viewModel.locations) { location in
                            Annotation(location.name, coordinate: location.coordinate) {
                                Image(systemName: "star.circle")
                                    .resizable()
                                    .foregroundStyle(.red)
                                    .frame(width: 44, height: 44)
                                    .background(.white)
                                    .clipShape(.circle)
                                    .onLongPressGesture {
                                        viewModel.selectedLocation = location
                                    }
                            }
                        }
                    }
                    .mapStyle(viewModel.selectedMapStyle)
                    .onTapGesture { position in
                        if let coordinate = proxy.convert(position, from: .local) {
                            viewModel.addLocation(at: coordinate)
                        }
                    }
                    .sheet(item: $viewModel.selectedLocation) { location in
                        EditView(location: location) {
                            viewModel.update(location: $0)
                        }
                    }
                }
            }
            .overlay(alignment: .bottomTrailing) {
                Picker("Map Style", selection: $viewModel.mapType) {
                    Text("Standard").tag(0)
                    Text("Hybrid").tag(1)
                }
                .offset(y: 20)
                .padding(.bottom, 20)
            }
            .pickerStyle(.menu)
        } else {
            VStack {
                Button("Unlock Places", action: viewModel.authenticate)
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
            .alert("Authentication Failed", isPresented: $viewModel.authenticationFailed) {
                Button("OK") { }
            }
        }
    }
}

#Preview {
    ContentView()
}
