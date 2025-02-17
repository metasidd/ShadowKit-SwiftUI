//
//  ElevationDemo.swift
//  soft-shadows-swiftui
//
//  Created by Siddhant Mehta on 2025-02-17.
//

import SwiftUI

struct ElevationDemo: View {
    private let color: Color = Color.blue
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("Elevation Examples")
                .font(.title2)
                .fontWeight(.black)
            
            VStack(alignment: .leading, spacing: 24) {
                ForEach(1..<7) { index in
                    softShadowCard(elevation: index * 4)
                }
            }
        }
        .fontDesign(.monospaced)
        .padding(32)
        .background(color.opacity(0.25))
    }
    
    private func softShadowCard(elevation: Int) -> some View {
        Text("**\(elevation)pts**")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(.white)
            }
            .compositingGroup()
            .softShadow(
                color: color,
                elevation: CGFloat(elevation)
            )
    }
}

#Preview {
    ElevationDemo()
}
