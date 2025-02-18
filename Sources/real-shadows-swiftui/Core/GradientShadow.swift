//
//  GradientShadow.swift
//  soft-shadows-swiftui
//
//  Created by Siddhant Mehta on 2025-02-17.
//
import Foundation
import SwiftUI

public struct GradientShadow<S: ShapeStyle>: ViewModifier {
    private let gradient: S
    private let radius: CGFloat
    private let opacity: Double
    private let xOffset: CGFloat
    private let yOffset: CGFloat

    public init(
        gradient: S,
        radius: CGFloat = 8,
        opacity: Double = 0.25,
        xOffset: CGFloat = 0,
        yOffset: CGFloat = 0
    ) {
        self.gradient = gradient
        self.radius = radius
        self.opacity = opacity
        self.xOffset = xOffset
        self.yOffset = yOffset
    }

    private func dynamicRadius(_ baseRadius: CGFloat) -> CGFloat {
        let offsetMagnitude = sqrt(pow(xOffset, 2) + pow(yOffset, 2))
        let radiusMultiplier = max(1.0, 1.0 + (offsetMagnitude / 32) * 0.5)
        return baseRadius * radiusMultiplier
    }

    public func body(content: Content) -> some View {
        content
            // Layer 1: Tight shadow
            .modifier(InnerShadowLayer(
                content: content,
                gradient: gradient,
                radius: dynamicRadius(radius / 16),
                opacity: opacity,
                xOffset: xOffset / 16,
                yOffset: yOffset / 16
            ))
            // Layer 2: Medium shadow
            .modifier(InnerShadowLayer(
                content: content,
                gradient: gradient,
                radius: dynamicRadius(radius / 8),
                opacity: opacity,
                xOffset: xOffset / 8,
                yOffset: yOffset / 8
            ))
            // Layer 3: Wide shadow
            .modifier(InnerShadowLayer(
                content: content,
                gradient: gradient,
                radius: dynamicRadius(radius / 4),
                opacity: opacity,
                xOffset: xOffset / 4,
                yOffset: yOffset / 4
            ))
            // Layer 4: Broader shadow
            .modifier(InnerShadowLayer(
                content: content,
                gradient: gradient,
                radius: dynamicRadius(radius / 2),
                opacity: opacity,
                xOffset: xOffset / 2,
                yOffset: yOffset / 2
            ))
            // Layer 5: Broadest shadow
            .modifier(InnerShadowLayer(
                content: content,
                gradient: gradient,
                radius: dynamicRadius(radius),
                opacity: opacity,
                xOffset: xOffset,
                yOffset: yOffset
            ))
    }

    private struct InnerShadowLayer: ViewModifier {
        let content: Any
        let gradient: S
        let radius: CGFloat
        let opacity: Double
        let xOffset: CGFloat
        let yOffset: CGFloat

        func body(content: Content) -> some View {
            content
                .background {
                    GeometryReader { geometry in
                        Rectangle()
                            .fill(gradient)
                            .opacity(opacity)
                            .mask {
                                content
                            }
                            .offset(
                                x: xOffset,
                                y: yOffset
                            )
                            .blur(radius: radius * 1.35)
                    }
                }
        }
    }
}
