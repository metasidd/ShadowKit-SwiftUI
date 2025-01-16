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
            VStack(alignment: .leading, spacing: 64) {
                // Traditional shadow
                Text("Traditional Shadow")
                    .padding(40)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .background {
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .fill(.white)
                    }
                    .compositingGroup()
                    .shadow(
                        color: .purple,
                        radius: shadowRadius,
                        y: 12
                    )
                
                // Layered shadow
                Text("Soft Shadow")
                    .padding(40)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .background {
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .fill(.white)
                    }
                    .compositingGroup()
                    .realShadow(
                        color: .purple,
                        radius: shadowRadius
                    )
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(64)
            
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
        .background(Color.purple.opacity(0.25))
    }
}

#Preview {
    TestShadow()
}
