//
//  test.swift
//  real-shadows-swiftui
//
//  Created by Siddhant Mehta on 2025-01-16.
//

import SwiftUI

struct TestShadow: View {
    @State private var shadowRadius: CGFloat = 16
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 40) {
                // Traditional shadow
                Text("Traditional Shadow")
                    .padding(40)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.white)
                    }
                    .compositingGroup()
                    .shadow(
                        color: .black.opacity(0.3),
                        radius: shadowRadius,
                        y: 6
                    )
                
                // Layered shadow
                Text("Soft Shadow")
                    .padding(40)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.white)
                    }
                    .compositingGroup()
                    .realShadow(radius: shadowRadius)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(50)
            
            // Radius control
            VStack(spacing: 8) {
                Text("Shadow Radius: \(Int(shadowRadius))")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                Slider(
                    value: $shadowRadius,
                    in: 0...32,
                    step: 1
                )
            }
            .padding(.horizontal, 50)
            .padding(.bottom, 30)
        }
        .preferredColorScheme(.light)
        .background(Color(.systemBackground))
    }
}

#Preview {
    TestShadow()
}
