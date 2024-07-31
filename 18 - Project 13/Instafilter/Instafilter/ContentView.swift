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
        
        guard var instantOutput = instantFilter.outputImage else { return }
        
        guard let cgImage = context.createCGImage(instantOutput, from: instantOutput.extent) else { return }
        
        let uiImage = UIImage(cgImage: cgImage)
        image = Image(uiImage: uiImage)
    }
}

#Preview {
    ContentView()
}
