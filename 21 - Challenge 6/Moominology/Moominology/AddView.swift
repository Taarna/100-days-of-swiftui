//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import PhotosUI
import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var selectedPhotoData: Data?
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var processedPhoto: Image?
    @State private var name = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Save") {
                    if let photoData = selectedPhotoData {
                        let character = Character(name: name, photo: photoData)
                        modelContext.insert(character)
                    }
                    dismiss()
                }
                .disabled(name.isEmpty || selectedPhoto == nil)
            }
            .padding()
            
            PhotosPicker(selection: $selectedPhoto) {
                if let processedPhoto {
                    processedPhoto
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 250)
                } else {
                    ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Import a photo to get started"))
                }
            }
            .onChange(of: selectedPhoto, loadImage)
            
            TextField("Name", text: $name)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
                )
                .padding()
                .opacity(selectedPhoto != nil ? 1 : 0)
            
            Spacer()
        }
    }
    
    private func loadImage() {
        Task {
            guard let imageData = try await selectedPhoto?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }
            processedPhoto = Image(uiImage: inputImage)
            selectedPhotoData = imageData
        }
    }
}

#Preview {
    AddView()
}
