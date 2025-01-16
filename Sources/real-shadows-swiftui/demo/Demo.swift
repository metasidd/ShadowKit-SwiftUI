//
//  test.swift
//  real-shadows-swiftui
//
//  Created by Siddhant Mehta on 2025-01-16.
//

import SwiftUI

struct TestShadow: View {
    @State private var shadowRadius: CGFloat = 4
    @State private var xOffset: CGFloat = 0
    @State private var yOffset: CGFloat = 0
    
    var body: some View {
        VStack {
            cardStack
            
            VStack(spacing: 16) {
                xOffsetControl
                yOffsetControl
                radiusControl
            }
        }
        .background(Color.blue.opacity(0.25))
    }
    
    private var cardStack: some View {
        VStack(alignment: .leading, spacing: 64) {
            traditionalCard
            softShadowCard
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(64)
    }
    
    private var traditionalCard: some View {
        Text("Traditional Shadow")
            .padding(40)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(.white)
            }
            .compositingGroup()
            .shadow(
                color: .blue,
                radius: shadowRadius,
                x: xOffset,
                y: yOffset
            )
    }
    
    private var softShadowCard: some View {
        Text("Soft Shadow")
            .padding(40)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(.white)
            }
            .compositingGroup()
            .realShadow(
                color: .blue,
                radius: shadowRadius,
                x: xOffset,
                y: yOffset
            )
    }
    
    private var xOffsetControl: some View {
        VStack(spacing: 0) {
            Text("X Offset: \(Int(xOffset))")
                .font(.caption)
                .foregroundStyle(.secondary)
            
            Slider(
                value: $xOffset,
                in: -32...32,
                step: 1
            )
        }
        .padding(.horizontal, 50)
        .padding(.top, 30)
    }
    
    private var yOffsetControl: some View {
        VStack(spacing: 0) {
            Text("Y Offset: \(Int(yOffset))")
                .font(.caption)
                .foregroundStyle(.secondary)
            
            Slider(
                value: $yOffset,
                in: -32...32,
                step: 1
            )
        }
        .padding(.horizontal, 50)
    }
    
    private var radiusControl: some View {
        VStack(spacing: 0) {
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
}

#Preview {
    TestShadow()
}
