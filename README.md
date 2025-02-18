# ShadowKit

![Cover Image](/Tests/Artifacts/Marketing/cover.png)

A SwiftUI package that provides more realistic, layered shadows that better mimic natural light behavior. This package enhances the default SwiftUI shadow implementation by using multiple shadow layers with varying intensities and spreads.

## Features

- 🎨 Realistic shadow rendering with 5 layered shadows
- 📱 Simple SwiftUI modifier API
- 🔧 Fully customizable shadow properties
- 💨 Dynamic shadow adaptation based on offset
- ⚡️ Lightweight implementation
- 🌈 Support for gradient shadows

## Installation

Add the following dependency to your project:

```swift
dependencies: [
    .package(url: "https://github.com/metasidd/shadowkit.git", from: "1.0.0")
]
```

## Usage

We've built the API in an ergonomic way that it's easy to replace the default shadow with a ProShadow. Just find and replace all instances of `.shadow()` with `.proShadow()`. VOILA!

![Shadow Comparison](Tests/Artifacts/Marketing/comparison.png)

### The API

```swift
// Basic shadow with full control
view.proShadow(
    color: .black, // The shadow's color. Use .opacity() to adjust intensity (0.1-0.4 recommended)
    radius: 8, // Blur radius. 4-8pts for subtle, 8-16pts for medium, 16-32pts for dramatic
    opacity: 0.25, // Overall shadow opacity (0.0-1.0). Lower = subtle, Higher = dramatic
    x: 0, // Horizontal offset (-32 to 32pts). Positive = right, Negative = left
    y: 4 // Vertical offset (-32 to 32pts). Positive = down, Negative = up
)

// Quick elevation-based shadow
view.proShadow(
    elevation: 4 // Surface height in points:
                 // 4pts = low elevation (subtle)
                 // 8pts = medium elevation (cards)
                 // 16pts = high elevation (modals)
)
```

![Elevation Control](Tests/Artifacts/Marketing/elevation.png)

```swift
// Gradient shadow for creative effects
view.proGradientShadow(
    gradient: LinearGradient( // Supports all SwiftUI gradients
        colors: [.blue, .clear],
        startPoint: .top,
        endPoint: .bottom
    ),
    radius: 8,
    opacity: 0.25,
    x: 0,
    y: 4
)
```

![Gradient Shadows](Tests/Artifacts/Marketing/gradients.png)

### Example

```swift
struct ShadowCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Title")
                .font(.headline)
            Text("Description")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(16)
        .proShadow(
            color: .black.opacity(0.2), // Subtle shadow color
            radius: 12, // Medium-high blur for cards
            opacity: 0.25, // Standard opacity
            x: 0, // Centered shadow
            y: 6 // Slight downward offset
        )
    }
}
```

## How It Works

ShadowKit creates a more natural shadow effect by combining five shadow layers with different intensities and spreads:

1. Tight shadow (1/16 of the base values)
2. Medium shadow (1/8 of the base values)
3. Wide shadow (1/4 of the base values)
4. Broader shadow (1/2 of the base values)
5. Broadest shadow (full base values)

This layered approach better mimics how shadows appear in the physical world.

## Tips for Best Results

1. **Background Contrast**
   - Shadows are more visible on lighter backgrounds
   - Adjust opacity based on background color
   - Use lower opacity for darker shadows

2. **Performance Considerations**
   - Avoid applying to many small elements
   - Use `compositingGroup()` for complex views
   - Consider using regular shadows for very small elements

3. **Design Guidelines**
   - Keep shadows subtle for most UI elements
   - Use stronger shadows sparingly for emphasis
   - Maintain consistent light source direction

## License

This package is available under the MIT license. See the LICENSE file for more info.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
