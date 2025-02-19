import SwiftUI

public enum ImageSize {
    static let width: CGFloat = 1280
    static let height: CGFloat = 720
    static var size: CGSize { CGSize(width: width, height: height) }
}

public enum MarketingStyle {
    
    static let backgroundColor = Color.black.opacity(0.15)
    
    static let pagePadding: CGFloat = 128
    
    static let backgroundGradient = LinearGradient(
        colors: [.yellow, .green, .blue, .purple],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static let backgroundGradientOpacity: CGFloat = 0.1
}
