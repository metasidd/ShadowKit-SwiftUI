import SwiftUI

struct CoverImageView: View {
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                colors: [.white, Color(.sRGB, white: 0.95, opacity: 1)],
                startPoint: .top,
                endPoint: .bottom
            )
            
            VStack(spacing: 40) {
                // Title
                Text("ShadowKit")
                    .font(.system(size: 72, weight: .black, design: .monospaced))
                    .compositingGroup()
                    .proShadow(
                        color: .black,
                        radius: 20,
                        opacity: 0.12,
                        y: 10
                    )
                
                // Demo cards
                HStack(spacing: 32) {
                    demoCard(title: "Soft Shadows")
                        .compositingGroup()
                        .proShadow(elevation: 16, opacity: 0.15)
                    
                    demoCard(title: "Gradient Shadows")
                        .compositingGroup()
                        .proGradientShadow(
                            gradient: .linearGradient(
                                colors: [.blue, .purple],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            opacity: 0.2,
                            radius: 16
                        )
                }
            }
        }
    }
    
    private func demoCard(title: String) -> some View {
        Text(title)
            .font(.system(.title3, design: .monospaced).weight(.medium))
            .frame(width: 200, height: 120)
            .background(Color.white)
            .cornerRadius(16)
    }
} 