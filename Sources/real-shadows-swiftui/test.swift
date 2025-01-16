//
//  test.swift
//  real-shadows-swiftui
//
//  Created by Siddhant Mehta on 2025-01-16.
//

import SwiftUI

struct TestShadow: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            // Traditional shadow
            Text("Traditional Shadow")
                .padding(40)
                .frame(maxWidth: .infinity, alignment: .center)
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.white)
                }
                .shadow(
                    color: .black.opacity(0.3),
                    radius: 6,
                    y: 6
                )
            
            // Layered shadow
            Text("Layered Shadow")
                .padding(40)
                .frame(maxWidth: .infinity, alignment: .center)
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.white)
                }
                .realShadow()
            
            // Colored layered shadow
            Text("Colored Layered Shadow")
                .padding(40)
                .frame(maxWidth: .infinity, alignment: .center)
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.white)
                }
                .realShadow(color: .blue)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(50)
        .preferredColorScheme(.light)
        .background(Color(.systemBackground))
    }
}

#Preview {
    TestShadow()
}
