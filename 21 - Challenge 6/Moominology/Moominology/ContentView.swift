//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Character.name) var characters: [Character]
    
    @State private var isEditSheetPresented = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(characters, id:\.self) { character in
                        HStack {
                            if let uiImage = UIImage(data: character.photo) {
                                let image = Image(uiImage: uiImage)
                                image
                                    .resizable()
                                    .frame(width: 100, height: 100)
                            }
                            Text(character.name)
                            Spacer()
                        }
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
