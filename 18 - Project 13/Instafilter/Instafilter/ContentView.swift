//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    
    private var inputImage = UIImage(resource: .losinj)
    private var context = CIContext()
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Day 63 Completed! 🎉")
                    .font(.title2)
                    .foregroundColor(.white)
                
                image?
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
                
                Slider(value: $filterIntensity, in: 0...1)
                    .onChange(of: filterIntensity) {
                        loadImage()
                    }
                    .tint(.white)
            }
            .padding()
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        applyFilter()
    }
    
    func applyFilter() {
        guard let beginImage = CIImage(image: inputImage) else { return }
        
        // Apply the Instant filter
        let instantFilter = CIFilter.photoEffectTransfer()
        instantFilter.inputImage = beginImage
        
        guard let instantOutput = instantFilter.outputImage else { return }
        
        // Blend with the original image
        let blendFilter = CIFilter.sourceAtopCompositing()
        blendFilter.inputImage = instantOutput
        blendFilter.backgroundImage = beginImage
        
        guard var blendedImage = blendFilter.outputImage else { return }
        
        // Apply the blend based on intensity
        blendedImage = blendedImage.applyingFilter("CIColorMatrix", parameters: [
            "inputRVector": CIVector(x: filterIntensity, y: 0, z: 0, w: 0),
            "inputGVector": CIVector(x: 0, y: filterIntensity, z: 0, w: 0),
            "inputBVector": CIVector(x: 0, y: 0, z: filterIntensity, w: 0),
            "inputAVector": CIVector(x: 0, y: 0, z: 0, w: 1),
            "inputBiasVector": CIVector(x: 0, y: 0, z: 0, w: 0)
        ])
        
        guard let cgImage = context.createCGImage(blendedImage, from: blendedImage.extent) else { return }
        
        let uiImage = UIImage(cgImage: cgImage)
        image = Image(uiImage: uiImage)
    }
}

#Preview {
    ContentView()
}
