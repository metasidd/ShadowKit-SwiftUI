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
        x: CGFloat = 0,
        y: CGFloat = 0
    ) -> some View {
        modifier(
            SoftShadow(
                color: color,
                radius: radius,
                xOffset: x,
                yOffset: y
            )
        )
    }

    func softShadow(
        color: Color = .black,
        elevation: CGFloat = 4,
        x: CGFloat = 0,
        y: CGFloat = 0
    ) -> some View {
        modifier(
            SoftShadow(
                color: color,
                radius: elevation,
                xOffset: x == 0 ? 0 : x + (elevation / 2),
                yOffset: y == 0 ? 0 : y + (elevation / 2)
            )
        )
    }
}
