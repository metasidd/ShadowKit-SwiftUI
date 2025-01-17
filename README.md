# Soft Shadows SwiftUI

A SwiftUI package that provides more realistic, layered shadows that better mimic natural light behavior. This package enhances the default SwiftUI shadow implementation by using multiple shadow layers with varying intensities and spreads.

## Features

- 🎨 Realistic shadow rendering with 5 layered shadows
- 📱 Simple SwiftUI modifier API
- 🔧 Fully customizable shadow properties
- 💨 Dynamic shadow adaptation based on offset
- ⚡️ Lightweight implementation

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/soft-shadows-swiftui.git", from: "1.0.0")
]
```

## Usage

### Basic Usage

```swift
import RealShadowsSwiftUI

struct ContentView: View {
    var body: some View {
        Rectangle()
            .fill(.white)
            .frame(width: 200, height: 200)
            .realShadow(radius: 8)  // Default black shadow
    }
}
```

### Example Configurations

#### 1. Subtle Elevation
Perfect for cards or elevated surfaces with minimal elevation:

```swift
.realShadow(
    color: .black,
    radius: 4,
    x: 0,
    y: 2
)
```

#### 2. Medium Drop Shadow
Ideal for floating elements or modals:

```swift
.realShadow(
    color: .black.opacity(0.25),
    radius: 8,
    x: 0,
    y: 4
)
```

#### 3. Dramatic Shadow
For high-emphasis elements:

```swift
.realShadow(
    color: .black,
    radius: 16,
    x: 4,
    y: 12
)
```

#### 4. Colored Shadow
For creative effects:

```swift
.realShadow(
    color: .blue.opacity(0.3),
    radius: 12,
    x: 8,
    y: 8
)
```

#### 5. Directional Shadow
For simulating specific light sources:

```swift
.realShadow(
    color: .black.opacity(0.2),
    radius: 10,
    x: -8,  // Negative X for left-side light source
    y: 6
)
```

### Complete Card Example

```swift
struct ElevatedCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Title")
                .font(.headline)
            Text("This is a card with realistic shadows that provide depth and elevation to your interface.")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(16)
        .realShadow(
            color: .black.opacity(0.2),
            radius: 12,
            x: 0,
            y: 6
        )
    }
}
```

### Interactive Demo Example

```swift
struct ShadowDemo: View {
    @State private var shadowRadius: CGFloat = 8
    @State private var xOffset: CGFloat = 0
    @State private var yOffset: CGFloat = 0
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
                .frame(width: 200, height: 200)
                .realShadow(
                    radius: shadowRadius,
                    x: xOffset,
                    y: yOffset
                )
            
            // Controls
            VStack {
                Slider(value: $shadowRadius, in: 0...32) {
                    Text("Radius")
                }
                Slider(value: $xOffset, in: -32...32) {
                    Text("X Offset")
                }
                Slider(value: $yOffset, in: -32...32) {
                    Text("Y Offset")
                }
            }
            .padding()
        }
    }
}
```

## Parameter Guide

### Color
- Default: `.black`
- Recommended opacity range: 0.1 to 0.4
- Use `.opacity()` to adjust shadow intensity

### Radius
- Default: `8`
- Recommended range: 4 to 32
- Smaller values (4-8): Subtle elevation
- Medium values (8-16): Standard elevation
- Larger values (16-32): Dramatic elevation

### Offset (x, y)
- Default: `0, 0`
- Recommended range: -32 to 32
- Positive y: Shadow appears below (common)
- Negative y: Shadow appears above
- x offset: Controls light source direction

## How It Works

Real Shadows creates a more natural shadow effect by combining five shadow layers with different intensities and spreads:

1. Tight shadow (1/16 of the base values)
2. Medium shadow (1/8 of the base values)
3. Wide shadow (1/4 of the base values)
4. Broader shadow (1/2 of the base values)
5. Broadest shadow (full base values)

This layered approach creates a more realistic shadow that better mimics how shadows appear in the physical world.

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

## Requirements

- iOS 14.0+
- macOS 11.0+
- tvOS 14.0+
- watchOS 7.0+
- Swift 5.5+

## License

This package is available under the MIT license. See the LICENSE file for more info.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
