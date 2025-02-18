import SwiftUI

struct ElevationImageView: View {
    var body: some View {
        HStack(spacing: 24) {
            ForEach([2, 4, 8, 16], id: \.self) { elevation in
                elevationCard(elevation: elevation)
            }
        }
        .padding(60)
        .background(Color.white)
    }
    
    private func elevationCard(elevation: Int) -> some View {
        Text("\(elevation)pts")
            .font(.system(.headline, design: .monospaced))
            .frame(width: 120, height: 80)
            .background(Color.white)
            .cornerRadius(12)
            .compositingGroup()
            .proShadow(
                elevation: CGFloat(elevation),
                opacity: 0.15
            )
    }
} 