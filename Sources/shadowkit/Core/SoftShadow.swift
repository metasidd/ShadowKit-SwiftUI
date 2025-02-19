// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

/// A view modifier that creates realistic shadows by combining multiple layers with varying intensities.
///
/// `SoftShadow` improves upon SwiftUI's native shadow by using a multi-layered approach that better
/// simulates real-world lighting conditions. Each shadow layer has different properties that combine
/// to create a more natural-looking shadow effect.
///
/// Example usage:
/// ```swift
/// Text("Hello")
///     .padding()
///     .background(Color.white)
///     .softShadow(
///         color: .black,
///         radius: 8,
///         opacity: 0.25,
///         x: 0,
///         y: 4
///     )
/// ```
public struct SoftShadow: ViewModifier {
    private let color: Color
    private let radius: CGFloat
    private let opacity: Double
    private let xOffset: CGFloat
    private let yOffset: CGFloat

    /// Creates a new soft shadow modifier.
    /// - Parameters:
    ///   - color: The color of the shadow.
    ///   - radius: The blur radius of the shadow.
    ///   - opacity: The opacity of the shadow (0.0-1.0).
    ///   - xOffset: Horizontal offset of the shadow.
    ///   - yOffset: Vertical offset of the shadow.
    public init(
        color: Color = .black,
        radius: CGFloat = 8,
        opacity: Double = 0.25,
        xOffset: CGFloat = 0,
        yOffset: CGFloat = 0
    ) {
        self.color = color
        self.radius = radius
        self.opacity = opacity
        self.xOffset = xOffset
        self.yOffset = yOffset
    }

    /// Calculates the dynamic radius based on offset magnitude.
    /// - Parameter baseRadius: The base radius to adjust.
    /// - Returns: An adjusted radius that takes into account the shadow's offset.
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
                radius: dynamicRadius(radius / 16),
                opacity: opacity,
                xOffset: xOffset / 16,
                yOffset: yOffset / 16
            ))
            // Layer 2: Medium shadow
            .modifier(InnerShadowLayer(
                content: content,
                color: color,
                radius: dynamicRadius(radius / 8),
                opacity: opacity,
                xOffset: xOffset / 8,
                yOffset: yOffset / 8
            ))
            // Layer 3: Wide shadow
            .modifier(InnerShadowLayer(
                content: content,
                color: color,
                radius: dynamicRadius(radius / 4),
                opacity: opacity,
                xOffset: xOffset / 4,
                yOffset: yOffset / 4
            ))
            // Layer 4: Broader shadow
            .modifier(InnerShadowLayer(
                content: content,
                color: color,
                radius: dynamicRadius(radius / 2),
                opacity: opacity,
                xOffset: xOffset / 2,
                yOffset: yOffset / 2
            ))
            // Layer 5: Broadest shadow
            .modifier(InnerShadowLayer(
                content: content,
                color: color,
                radius: dynamicRadius(radius),
                opacity: opacity,
                xOffset: xOffset,
                yOffset: yOffset
            ))
    }

    /// A single layer of the soft shadow effect.
    private struct InnerShadowLayer: ViewModifier {
        let content: Any
        let color: Color
        let radius: CGFloat
        let opacity: Double
        let xOffset: CGFloat
        let yOffset: CGFloat
        
        private let additionalBlur: CGFloat = 2
        
        /// Calculates the final y-offset including dynamic adjustments.
        private var calculatedYOffset: CGFloat {
            yOffset + (yOffset == 0 ? 0 : (yOffset > 0 ? 1 : -1) * radius * 0.5) + ShadowConstants.additionalBlur
        }

        func body(content: Content) -> some View {
            content
                .shadow(
                    color: color.opacity(opacity),
                    radius: radius,
                    x: xOffset,
                    y: calculatedYOffset
                )
        }
    }
}
