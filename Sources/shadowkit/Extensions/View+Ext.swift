import SwiftUI

public extension View {
    /// A real shadow effect that mimics the API of SwiftUI's native shadow modifier
    /// but provides more realistic layered shadows.
    ///
    /// - Parameters:
    ///   - color: The color of the shadow. Defaults to black.
    ///   - radius: The blur radius of the shadow. Defaults to 0.
    ///   - x: The horizontal offset of the shadow. Defaults to 0.
    ///   - y: The vertical offset of the shadow. Defaults to 0.
    func softShadow(
        color: Color = .black,
        radius: CGFloat = 0,
        opacity: CGFloat = 0.25,
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

    func softShadow(
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
    /// - Parameters:
    ///   - gradient: The gradient to use for the shadow. Defaults to a subtle gray gradient.
    ///   - radius: The blur radius of the shadow. Defaults to 8.
    ///   - opacity: The opacity of the shadow. Defaults to 0.25.
    ///   - x: The horizontal offset of the shadow. Defaults to 0.
    ///   - y: The vertical offset of the shadow. Defaults to 0.
    func gradientShadow<G: GradientStyle>(
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
    
    /// Applies a colorful gradient shadow effect with customizable properties.
    /// - Parameters:
    ///   - colors: The colors to use in the gradient.
    ///   - radius: The blur radius of the shadow. Defaults to 8.
    ///   - opacity: The opacity of the shadow. Defaults to 0.25.
    ///   - x: The horizontal offset of the shadow. Defaults to 0.
    ///   - y: The vertical offset of the shadow. Defaults to 0.
    func colorfulGradientShadow(
        colors: [Color],
        radius: CGFloat = 8,
        opacity: CGFloat = 0.25,
        x: CGFloat = 0,
        y: CGFloat = 0
    ) -> some View {
        gradientShadow(
            gradient: LinearGradient(
                colors: colors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ),
            opacity: opacity,
            radius: radius,
            x: x,
            y: y
        )
    }
}
