import SwiftUI

struct ComparisonImageView: View {
    var body: some View {
        HStack(spacing: 32) {
            // Traditional Shadow
            demoCard(title: "Traditional Shadow")
                .compositingGroup()
                .shadow(
                    color: .black.opacity(0.15),
                    radius: 8,
                    y: 4
                )
            
            // Soft Shadow
            demoCard(title: "Soft Shadow")
                .compositingGroup()
                .proShadow(
                    radius: 8,
                    opacity: 0.15,
                    y: 4
                )
            
            // Gradient Shadow
            demoCard(title: "Gradient Shadow")
                .compositingGroup()
                .proGradientShadow(
                    gradient: .linearGradient(
                        colors: [.blue, .purple],
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    opacity: 0.2,
                    radius: 8,
                    y: 4
                )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(60)
        .background(Color.white)
    }
    
    private func demoCard(title: String) -> some View {
        Text(title)
            .font(.system(.headline, design: .monospaced))
            .frame(width: 180, height: 100)
            .background(Color.white)
            .cornerRadius(12)
    }
} 
