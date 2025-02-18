import SwiftUI

struct CoverImageView: View {
    var body: some View {
        // Content
        VStack(alignment: .leading, spacing: 32) {
            // Title & Subtitle
            VStack(alignment: .leading, spacing: 16) {
                Text("ShadowKit")
                    .font(.system(size: 96, design: .monospaced))
            }
            
            // Features
            VStack(alignment: .leading, spacing: 32) {
                Text("✅ Soft shadows")
                Text("✅ Gradient shadows")
                Text("✅ Customizable elevation")
                Text("✅ Ergonomic APIs")
            }
            .font(.system(size: 32, design: .monospaced))
            .padding(.top, 16)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(MarketingStyle.pagePadding)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(alignment: .trailing) {
            // Background boxes - Right side columns
            HStack(spacing: 32) {
                // First column
                VStack(spacing: 32) {
                    ForEach(0..<3) { _ in
                        backgroundBox()
                    }
                }
                
                // Second column
                VStack(spacing: 32) {
                    ForEach(0..<4) { _ in
                        backgroundBox()
                    }
                }
                
                // Third column
                VStack(spacing: 32) {
                    ForEach(0..<3) { _ in
                        backgroundBox()
                    }
                }
            }
            .offset(x: 200)
            .mask {
                LinearGradient(colors: [Color.black, Color.white.opacity(0)], startPoint: .trailing, endPoint: .leading)
            }
        }
        .background(MarketingStyle.backgroundGradient.opacity(MarketingStyle.backgroundGradientOpacity))
        .background(Color.white)
    }
    
    private func backgroundBox() -> some View {
        RoundedRectangle(cornerRadius: 32)
            .fill(Color.white)
            .frame(width: 280, height: 400)
            .compositingGroup()
            .proShadow(
                color: .black.opacity(0.15),
                radius: 32,
                y: 8
            )
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CoverImageView()
        .frame(width: ImageSize.width, height: ImageSize.height)
} 
