//
//  ComparisonDemo.swift
//  ShadowKit
//
//  Created by Siddhant Mehta on 2025-01-16.
//

import SwiftUI

struct ComparisonDemo: View {
    @State private var color: Color = Color.black.opacity(0.25)
    @State private var shadowRadius: CGFloat = 8
    @State private var xOffset: CGFloat = 0
    @State private var yOffset: CGFloat = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Text("Comparing Shadows")
                .font(.title2)
                .fontWeight(.black)

            cardStack

            VStack(spacing: 16) {
                xOffsetControl
                yOffsetControl
                radiusControl
            }
        }
        .fontDesign(.monospaced)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 32)
        .padding(.vertical, 32)
        .background(color.opacity(0.25))
    }

    private var cardStack: some View {
        VStack(alignment: .leading, spacing: 48) {
            traditionalCard
            softShadowCard
            gradientShadowCard
        }
        .font(.system(size: 14))
        .foregroundStyle(Color.black)
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.vertical, 24)
    }

    private var traditionalCard: some View {
        Text(".shadow(...)")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(.white)
            }
            .compositingGroup()
            .shadow(
                color: color,
                radius: shadowRadius,
                x: xOffset,
                y: yOffset
            )
    }
    
    private var softShadowCard: some View {
        Text(".proShadow(...)")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(.white)
            }
            .compositingGroup()
            .proShadow(
                color: color,
                radius: shadowRadius,
                x: xOffset,
                y: yOffset
            )
    }
    
    private var gradientShadowCard: some View {
        Text(".proGradientShadow(...)")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(Color.white)
            }
            .proGradientShadow(
                gradient: .linearGradient(
                    colors: [Color.blue, Color.pink, Color.orange],
                    startPoint: .top,
                    endPoint: .bottom
                ),
                opacity: 0.2,
                radius: shadowRadius,
                x: xOffset,
                y: yOffset
            )
    }

    private var xOffsetControl: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("X Offset: \(Int(xOffset))")
                .font(.caption)
                .foregroundStyle(.secondary)

            Slider(
                value: $xOffset,
                in: -32 ... 32,
                step: 1
            )
        }
    }

    private var yOffsetControl: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Y Offset: \(Int(yOffset))")
                .font(.caption)
                .foregroundStyle(.secondary)

            Slider(
                value: $yOffset,
                in: -32 ... 32,
                step: 1
            )
        }
    }

    private var radiusControl: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Shadow Radius: \(Int(shadowRadius))")
                .font(.caption)
                .foregroundStyle(.secondary)

            Slider(
                value: $shadowRadius,
                in: 0 ... 32,
                step: 1
            )
        }
    }
}

#Preview("Comparing Shadows") {
    ComparisonDemo()
}
