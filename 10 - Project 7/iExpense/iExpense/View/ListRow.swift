//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct ListRow: View {
    var name: String
    var type: String
    var amount: Double
    
    var body: some View {
        let formattedAmount = amount.formatted(.currency(code: Locale.current.currency?.identifier ?? "USD"))
        
        HStack {
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                Text(type)
            }

            Spacer()
            
            switch (amount) {
            case 1...10:
                Text(formattedAmount)
                    .lowAmountStyle()
            case 11...100:
                Text(formattedAmount)
                    .midAmountStyle()
            case 101...:
                Text(formattedAmount)
                    .highAmountStyle()
            default:
                Text(formattedAmount)
            }
        }
        .accessibilityLabel("\(name), \(amount)")
        .accessibilityHint(type)
    }
}

#Preview {
    ListRow(name: "Food", type: "Personal", amount: 100.0)
}
