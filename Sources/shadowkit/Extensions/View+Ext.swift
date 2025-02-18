//
//  View+Ext.swift
//  ShadowKit
//
//  Created by Siddhant Mehta on 2025/02/18.
//

import SwiftUI

public extension View {
    /// Applies a realistic, multi-layered shadow effect that provides better depth perception than SwiftUI's native shadow.
    ///
    /// The soft shadow effect is created by combining multiple shadow layers with different intensities and offsets,
    /// resulting in a more natural-looking shadow that better simulates real-world lighting.
    ///
    /// ```swift
    /// Text("Hello World")
    ///     .proShadow(
    ///         color: .black,
    ///         radius: 8,
    ///         opacity: 0.25,
    ///         x: 0,
    ///         y: 4
    ///     )
    /// ```
    ///
    /// - Parameters:
    ///   - color: The color of the shadow. Defaults to black.
    ///   - radius: The blur radius of the shadow. Larger values create softer shadows. Defaults to 0.
    ///   - opacity: The opacity of the shadow, ranging from 0 to 1. Defaults to 0.25.
    ///   - x: The horizontal offset of the shadow. Positive values move right, negative left. Defaults to 0.
    ///   - y: The vertical offset of the shadow. Positive values move down, negative up. Defaults to 0.
    /// - Returns: A view with the soft shadow effect applied.
    func proShadow(
        color: Color = .black,
        radius: CGFloat = 0,
        opacity: CGFloat = 0.2,
        x: CGFloat = 0,
        y: CGFloat = 0
    ) -> some View {
        let validatedRadius = max(0, radius)
        return modifier(
            SoftShadow(
                color: color,
                radius: validatedRadius,
                opacity: opacity,
                xOffset: x,
                yOffset: y
            )
        )
    }

    /// Applies a soft shadow effect based on Material Design elevation principles.
    ///
    /// This modifier automatically calculates appropriate shadow properties based on the elevation value,
    /// following Material Design guidelines for creating consistent shadow hierarchies.
    ///
    /// ```swift
    /// VStack {
    ///     Text("Card 1").proShadow(elevation: 2)
    ///     Text("Card 2").proShadow(elevation: 8)
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - color: The shadow color. Defaults to black.
    ///   - elevation: The height of the surface in points. Higher values create larger shadows. Defaults to 4.
    ///   - opacity: The shadow opacity, ranging from 0 to 1. Defaults to 0.25.
    ///   - x: Additional horizontal offset. Defaults to 0.
    ///   - y: Additional vertical offset. Defaults to 0.
    /// - Returns: A view with elevation-based shadow applied.
    func proShadow(
        color: Color = .black,
        elevation: CGFloat = 4,
        opacity: CGFloat = 0.25,
        x: CGFloat = 0,
        y: CGFloat = 0
    ) -> some View {
        modifier(
            SoftShadow(
                color: color,
                radius: elevation,
                opacity: opacity,
                xOffset: x == 0 ? 0 : x + (elevation / 2),
                yOffset: y == 0 ? 0 : y + (elevation / 2)
            )
        )
    }
    
    /// Applies a gradient shadow effect with customizable properties.
    ///
    /// This modifier creates a shadow effect using any SwiftUI gradient type, allowing for
    /// creative shadow effects that can enhance your UI's visual hierarchy.
    ///
    /// ```swift
    /// Text("Gradient Shadow")
    ///     .gradientShadow(
    ///         gradient: LinearGradient(
    ///             colors: [.blue, .purple],
    ///             startPoint: .topLeading,
    ///             endPoint: .bottomTrailing
    ///         ),
    ///         radius: 10,
    ///         opacity: 0.3
    ///     )
    /// ```
    ///
    /// - Parameters:
    ///   - gradient: The gradient to use for the shadow.
    ///   - opacity: The opacity of the shadow (0.0-1.0).
    ///   - radius: The blur radius of the shadow.
    ///   - x: Horizontal offset of the shadow.
    ///   - y: Vertical offset of the shadow.
    /// - Returns: A view with the gradient shadow effect applied.
    func proGradientShadow<G: GradientStyle>(
        gradient: G = LinearGradient(
            colors: [.red, .blue],
            startPoint: .top,
            endPoint: .bottom
        ),
        opacity: CGFloat = 0.25,
        radius: CGFloat = 8,
        x: CGFloat = 0,
        y: CGFloat = 0
    ) -> some View {
        modifier(
            GradientShadow(
                gradient: gradient,
                radius: radius,
                opacity: opacity,
                xOffset: x,
                yOffset: y
            )
        )
    }
}
