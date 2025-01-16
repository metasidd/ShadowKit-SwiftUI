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
    
    public func body(content: Content) -> some View {
        content
            // Layer 1: 1/16 of radius
            .modifier(InnerShadowLayer(
                content: content,
                color: color,
                radius: radius/16,
                opacity: opacity,
                xOffset: xOffset,
                yOffset: yOffset
            ))
            // Layer 2: 1/8 of radius
            .modifier(InnerShadowLayer(
                content: content,
                color: color,
                radius: radius/8,
                opacity: opacity,
                xOffset: xOffset,
                yOffset: yOffset
            ))
            // Layer 3: 1/4 of radius
            .modifier(InnerShadowLayer(
                content: content,
                color: color,
                radius: radius/4,
                opacity: opacity,
                xOffset: xOffset,
                yOffset: yOffset
            ))
            // Layer 4: 1/2 of radius
            .modifier(InnerShadowLayer(
                content: content,
                color: color,
                radius: radius/2,
                opacity: opacity,
                xOffset: xOffset,
                yOffset: yOffset
            ))
            // Layer 5: full radius
            .modifier(InnerShadowLayer(
                content: content,
                color: color,
                radius: radius,
                opacity: opacity,
                xOffset: xOffset,
                yOffset: yOffset
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
