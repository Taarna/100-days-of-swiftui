//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import PhotosUI
import SwiftUI

struct ContentView: View {
    @State private var characters = [
        "Moomin",
        "Moominpapa",
        "Little My"
    ]
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var processedPhoto: Image?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(characters, id:\.self) { character in
                        Text(character)
                        PhotosPicker(selection: $selectedPhoto) {
                            if let processedPhoto {
                                processedPhoto
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    }
                }
                .toolbar {
                    Button("Add", systemImage: "plus") {
                        loadImage()
                    }
                }
            }
        }
    }
    
    private func loadImage() {
        Task {
            guard let imageData = try await selectedPhoto?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }
            processedPhoto = Image(uiImage: inputImage)
        }
    }
}

#Preview {
    ContentView()
}
