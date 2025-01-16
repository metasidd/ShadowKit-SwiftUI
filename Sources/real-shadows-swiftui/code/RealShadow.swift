// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct RealShadow: ViewModifier {
    private let color: Color
    private let radius: CGFloat
    private let opacity: Double
    private let xOffset: CGFloat
    private let yOffset: CGFloat
    
    public init(
        color: Color = .black,
        radius: CGFloat = 8,
        opacity: Double = 0.4,
        xOffset: CGFloat = 0,
        yOffset: CGFloat = 0
    ) {
        self.color = color
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
                color: color,
                radius: dynamicRadius(radius/8),
                opacity: opacity,
                xOffset: xOffset/8,
                yOffset: yOffset/8
            ))
            // Layer 2: Medium shadow
            .modifier(InnerShadowLayer(
                content: content,
                color: color,
                radius: dynamicRadius(radius/4),
                opacity: opacity,
                xOffset: xOffset/4,
                yOffset: yOffset/4
            ))
            // Layer 3: Wide shadow
            .modifier(InnerShadowLayer(
                content: content,
                color: color,
                radius: dynamicRadius(radius/2),
                opacity: opacity,
                xOffset: xOffset/2,
                yOffset: yOffset/2
            ))
            // Layer 4: Broader shadow
            .modifier(InnerShadowLayer(
                content: content,
                color: color,
                radius: dynamicRadius(radius),
                opacity: opacity,
                xOffset: xOffset,
                yOffset: yOffset
            ))
            // Layer 5: Broadest shadow
            .modifier(InnerShadowLayer(
                content: content,
                color: color,
                radius: dynamicRadius(radius),
                opacity: opacity,
                xOffset: xOffset * 2,
                yOffset: yOffset * 2
            ))
    }
}

private struct InnerShadowLayer: ViewModifier {
    let content: Any
    let color: Color
    let radius: CGFloat
    let opacity: Double
    let xOffset: CGFloat
    let yOffset: CGFloat
    
    func body(content: Content) -> some View {
        content
            .shadow(
                color: color.opacity(opacity),
                radius: radius,
                x: xOffset,
                y: yOffset + radius
            )
    }
}
