import SwiftUI

struct ElevationImageView: View {
    var body: some View {
        VStack(spacing: 48) {
            HStack(spacing: 48) {
                ForEach([2, 4, 8], id: \.self) { elevation in
                    elevationCard(elevation: elevation)
                }
            }
            HStack(spacing: 48) {
                ForEach([16, 24, 32], id: \.self) { elevation in
                    elevationCard(elevation: elevation)
                }
            }
        }
        .padding(MarketingStyle.pagePadding)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MarketingStyle.backgroundGradient.opacity(MarketingStyle.backgroundGradientOpacity))
        .background(Color.white)
    }
    
    private func elevationCard(elevation: Int) -> some View {
        return Text("\(elevation)pts")
            .font(.system(.title, design: .monospaced))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .cornerRadius(32)
            .compositingGroup()
            .proShadow(
                color: Color.black.opacity(0.2),
                elevation: CGFloat(elevation)
            )
    }
} 

#Preview {
    ElevationImageView()
}
