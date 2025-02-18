//
//  GradientShadow.swift
//  ShadowKit
//
//  Created by Siddhant Mehta on 2025-02-17.
//

import SwiftUI

///  A view modifier that creates a multi-layered gradient shadow effect.
///
///  `GradientShadow` uses multiple layers of gradient-based shadows to create a rich,
///  depth-enhancing effect that can use any SwiftUI gradient type.
///
///  Example usage:
///  ```swift
///  Text("Hello")
///      .padding()
///      .background(Color.white)
///      .gradientShadow(
///          gradient: LinearGradient(colors: [.blue, .purple], 
///                                 startPoint: .topLeading,
///                                 endPoint: .bottomTrailing),
///          radius: 10,
///          opacity: 0.3
///      )
///  ```
public struct GradientShadow<G: GradientStyle>: ViewModifier {
    private let gradient: G
    private let radius: CGFloat
    private let opacity: Double
    private let xOffset: CGFloat
    private let yOffset: CGFloat

    /// Creates a new gradient shadow modifier.
    /// - Parameters:
    ///   - gradient: The gradient to use for the shadow effect.
    ///   - radius: The blur radius of the shadow.
    ///   - opacity: The opacity of the shadow (0.0-1.0).
    ///   - xOffset: Horizontal offset of the shadow.
    ///   - yOffset: Vertical offset of the shadow.
    public init(
        gradient: G,
        radius: CGFloat,
        opacity: Double,
        xOffset: CGFloat,
        yOffset: CGFloat
    ) {
        self.gradient = gradient
        self.radius = radius
        self.opacity = opacity
        self.xOffset = xOffset
        self.yOffset = yOffset
    }

    /// Calculates a dynamic radius that adjusts based on the shadow's offset.
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

    /// A single layer of the gradient shadow effect.
    private struct InnerShadowLayer: ViewModifier {
        let content: Any
        let gradient: G
        let radius: CGFloat
        let opacity: Double
        let xOffset: CGFloat
        let yOffset: CGFloat

        /// Calculates the final x-offset including dynamic adjustments.
        private var calculatedXOffset: CGFloat {
            xOffset + (xOffset == 0 ? 0 : (xOffset > 0 ? 1 : -1) * radius * 0.5) + ShadowConstants.additionalBlur
        }
        
        /// Calculates the final y-offset including dynamic adjustments.
        private var calculatedYOffset: CGFloat {
            yOffset + (yOffset == 0 ? 0 : (yOffset > 0 ? 1 : -1) * radius * 0.5) + ShadowConstants.additionalBlur
        }

        func body(content: Content) -> some View {
            content
                .background {
                    Rectangle()
                        .fill(gradient)
                        .opacity(opacity)
                        .mask {
                            content
                        }
                        .offset(
                            x: calculatedXOffset,
                            y: calculatedYOffset
                        )
                        .blur(radius: radius + ShadowConstants.additionalBlur)
                }
        }
    }
}
