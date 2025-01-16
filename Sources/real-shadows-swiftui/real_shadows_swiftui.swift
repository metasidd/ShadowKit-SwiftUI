// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct RealShadow: ViewModifier {
    private let color: Color
    private let radius: CGFloat
    
    public init(
        color: Color = .black,
        radius: CGFloat = 16
    ) {
        self.color = color
        self.radius = radius
    }
    
    private func shadowLayer(
        content: Content,
        radius: CGFloat,
        opacity: Double
    ) -> some View {
        content
            .shadow(
                color: color.opacity(opacity),
                radius: radius,
                y: radius
            )
    }
    
    public func body(content: Content) -> some View {
        content
            // Layer 1: 1px
            .modifier(InnerShadowLayer(content: content, color: color, radius: 1, opacity: 0.075))
            // Layer 2: 2px
            .modifier(InnerShadowLayer(content: content, color: color, radius: 2, opacity: 0.075))
            // Layer 3: 4px
            .modifier(InnerShadowLayer(content: content, color: color, radius: 4, opacity: 0.075))
            // Layer 4: 8px
            .modifier(InnerShadowLayer(content: content, color: color, radius: 8, opacity: 0.075))
            // Layer 5: 16px
            .modifier(InnerShadowLayer(content: content, color: color, radius: 16, opacity: 0.075))
    }
}

private struct InnerShadowLayer: ViewModifier {
    let content: Any
    let color: Color
    let radius: CGFloat
    let opacity: Double
    
    func body(content: Content) -> some View {
        content
            .shadow(
                color: color.opacity(opacity),
                radius: radius,
                y: radius
            )
    }
}

public extension View {
    func realShadow(
        color: Color = .black,
        radius: CGFloat = 16
    ) -> some View {
        modifier(RealShadow(color: color, radius: radius))
    }
}

// Helper to make any Shape into type-erased AnyShape
public extension Shape {
    func eraseToAnyShape() -> AnyShape {
        AnyShape(self)
    }
}

// Type-erased shape wrapper
public struct AnyShape: Shape, @unchecked Sendable {
    private let makePath: @Sendable (CGRect) -> Path
    
    public init<S: Shape>(_ shape: S) {
        self.makePath = { rect in
            shape.path(in: rect)
        }
    }
    
    public func path(in rect: CGRect) -> Path {
        makePath(rect)
    }
}
