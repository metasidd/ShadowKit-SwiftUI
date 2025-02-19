import SwiftUI

struct GradientShowcaseView: View {
    var body: some View {
        HStack(spacing: 48) {
            // Blue to Purple
            showcaseCard(
                colors: [.blue, .purple],
                title: "Linear"
            )
            
            // Rainbow
            showcaseCard(
                colors: [.red, .orange, .yellow, .green, .blue, .purple],
                title: "Rainbow"
            )
            
            // Sunset
            showcaseCard(
                colors: [.orange, .pink, .purple],
                title: "Sunset"
            )
        }
        .padding(MarketingStyle.pagePadding)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MarketingStyle.backgroundGradient.opacity(MarketingStyle.backgroundGradientOpacity))
        .background(Color.white)
    }
    
    private func showcaseCard(colors: [Color], title: String) -> some View {
        return Text(title)
            .font(.system(.headline, design: .monospaced))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .cornerRadius(32)
            .compositingGroup()
            .proGradientShadow(
                gradient: .linearGradient(
                    colors: colors,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                opacity: 0.2,
                radius: 32,
                y: 16
            )
    }
}

#Preview {
    GradientShowcaseView()
        .frame(width: ImageSize.width, height: ImageSize.height)
        .previewLayout(.sizeThatFits)
} 
