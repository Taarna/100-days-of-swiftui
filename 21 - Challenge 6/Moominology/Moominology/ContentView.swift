//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var characters = [
        "Moomin",
        "Moominpapa",
        "Little My"
    ]
    
    @State private var isEditSheetPresented = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(characters, id:\.self) { character in
                        Text(character)
                    }
                }
                .toolbar {
                    Button("Add", systemImage: "plus") {
                        isEditSheetPresented = true
                    }
                }
                .sheet(isPresented: $isEditSheetPresented) {
                    AddView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
