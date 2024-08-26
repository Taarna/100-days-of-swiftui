//
// Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct EditProspectView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var prospect: Prospect
    
    var body: some View {
        VStack {
            TextField("Name", text: $prospect.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 1)
                )
                .padding(.horizontal)
            
            TextField("Email", text: $prospect.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 1)
                )
                .padding(.horizontal)
            
            Spacer()
            
            Button("Save", action: {
                dismiss()
            })
        }
    }
}
