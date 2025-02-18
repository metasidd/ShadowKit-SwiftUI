import SwiftUI

struct GradientShowcaseView: View {
    var body: some View {
        HStack(spacing: 32) {
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
        .padding(60)
        .background(Color.white)
    }
    
    private func showcaseCard(colors: [Color], title: String) -> some View {
        Text(title)
            .font(.system(.headline, design: .monospaced))
            .frame(width: 160, height: 100)
            .background(Color.white)
            .cornerRadius(12)
            .compositingGroup()
            .proGradientShadow(
                gradient: .linearGradient(
                    colors: colors,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                opacity: 0.2,
                radius: 12
            )
    }
} 