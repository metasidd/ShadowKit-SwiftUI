import SwiftUI

struct ComparisonImageView: View {
    var body: some View {
        HStack(spacing: 32) {
            // Traditional Shadow
            VStack(spacing: 24) {
                demoCard(title: "Traditional Shadow")
                    .compositingGroup()
                    .shadow(
                        color: .black.opacity(0.25),
                        radius: 32,
                        y: 4
                    )
                
                Text("SwiftUI Shadow. Extra soft edges, doesn't mimic real lighting")
                    .font(.system(.body, design: .monospaced))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 32)
            }
            
            // Pro Shadow
            VStack(spacing: 24) {
                demoCard(title: "Pro Shadow")
                    .compositingGroup()
                    .proShadow(
                        color: .black.opacity(0.25),
                        radius: 32,
                        y: 4
                    )
                
                Text("Pro Shadow. Realistic shadow with natural falloff and better control on lighting")
                    .font(.system(.body, design: .monospaced))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 32)
            }
        }
        .padding(MarketingStyle.pagePadding)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MarketingStyle.backgroundGradient.opacity(MarketingStyle.backgroundGradientOpacity))
        .background(Color.white)
    }
    
    private func demoCard(title: String) -> some View {
        return Text(title)
            .font(.system(.title, design: .monospaced))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .mask {
                RoundedRectangle(cornerRadius: 32, style: .continuous)
            }
    }
}

#Preview {
    ComparisonImageView()
        .frame(width: ImageSize.width, height: ImageSize.height)
        .previewLayout(.sizeThatFits)
} 
