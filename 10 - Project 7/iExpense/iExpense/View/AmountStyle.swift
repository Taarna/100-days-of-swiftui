//
//  Copyright (c) 2024 Ivana Rast. All rights reserved.
//

import SwiftUI

struct LowAmountStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.green)
    }
}

struct MidAmountStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.orange)
    }
}

struct HighAmountStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.red)
    }
}

extension View {
    func lowAmountStyle() -> some View {
        self.modifier(LowAmountStyle())
    }
    func midAmountStyle() -> some View {
        self.modifier(MidAmountStyle())
    }
    func highAmountStyle() -> some View {
        self.modifier(HighAmountStyle())
    }
}

#Preview {
    HStack {
        VStack(alignment: .leading) {
            Text("Hotel")
                .font(.headline)
            Text("Bussines")
        }

        Spacer()
        Text(10000, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            .lowAmountStyle()
    }
    .padding()
}
