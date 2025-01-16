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
    func realShadow(
        color: Color = .black,
        radius: CGFloat = 0,
        x: CGFloat = 0,
        y: CGFloat = 0
    ) -> some View {
        self.modifier(
            RealShadow(
                color: color,
                radius: radius,
                xOffset: x,
                yOffset: y
            )
        )
    }
} 
