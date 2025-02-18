import SwiftUI
import Foundation
import os

/// Generates marketing assets for the README and documentation
@MainActor
@available(iOS 13.0, macOS 10.15, *)
public struct MarketingAssets {
    private static let logger = Logger(
        subsystem: "com.shadowkit.marketing",
        category: "AssetGeneration"
    )
    
    /// Generates all marketing assets
    public static func generateAssets() {
        logger.info("Starting marketing asset generation")
        
        // Create directory if it doesn't exist
        let directory = createAssetsDirectory()
        
        // Generate each asset
        generateCoverImage(in: directory)
        generateComparisonImage(in: directory)
        generateElevationImage(in: directory)
        generateGradientShowcase(in: directory)
        
        logger.info("Completed marketing asset generation")
    }
    
    private static func createAssetsDirectory() -> URL {
        let fileManager = FileManager.default
        
        // Get the package directory by going up from the current source file
        let sourceFileURL = URL(fileURLWithPath: #file)
        let packageRoot = sourceFileURL
            .deletingLastPathComponent() // Marketing
            .deletingLastPathComponent() // ShadowKit
            .deletingLastPathComponent() // Sources
            .deletingLastPathComponent() // Root
        
        // Create directory in Tests/Artifacts
        let assetsURL = packageRoot
            .appendingPathComponent("Tests")
            .appendingPathComponent("ShadowKitTests")
            .appendingPathComponent("Exports", isDirectory: true)
        
        do {
            // Create directory if it doesn't exist
            try fileManager.createDirectory(
                at: assetsURL,
                withIntermediateDirectories: true
            )
            logger.info("Created or verified assets directory at: \(assetsURL.path)")
        } catch {
            logger.error("Failed to create assets directory: \(error.localizedDescription)")
        }
        
        return assetsURL
    }
    
    private static func generateCoverImage(in directory: URL) {
        logger.info("Generating cover image...")
        let view = CoverImageView()
        saveImage(view, name: "cover", size: ImageSize.size, in: directory)
    }
    
    private static func generateComparisonImage(in directory: URL) {
        logger.info("Generating comparison image...")
        let view = ComparisonImageView()
        saveImage(view, name: "comparison", size: ImageSize.size, in: directory)
    }
    
    private static func generateElevationImage(in directory: URL) {
        logger.info("Generating elevation image...")
        let view = ElevationImageView()
        saveImage(view, name: "elevation", size: ImageSize.size, in: directory)
    }
    
    private static func generateGradientShowcase(in directory: URL) {
        logger.info("Generating gradient showcase image...")
        let view = GradientShowcaseView()
        saveImage(view, name: "gradients", size: ImageSize.size, in: directory)
    }
    
    private static func saveImage(_ view: some View, name: String, size: CGSize, in directory: URL) {
        #if os(macOS)
        logger.debug("Rendering image: \(name) at size: \(size.width)x\(size.height)")
        
        let renderer = ImageRenderer(content: view.frame(width: size.width, height: size.height))
        renderer.scale = 2.0
        
        guard let nsImage = renderer.nsImage else {
            logger.error("Failed to render NSImage for \(name)")
            return
        }
        
        guard let tiffData = nsImage.tiffRepresentation else {
            logger.error("Failed to create TIFF representation for \(name)")
            return
        }
        
        guard let bitmapImage = NSBitmapImageRep(data: tiffData) else {
            logger.error("Failed to create bitmap image representation for \(name)")
            return
        }
        
        guard let pngData = bitmapImage.representation(using: .png, properties: [:]) else {
            logger.error("Failed to create PNG representation for \(name)")
            return
        }
        
        let fileURL = directory.appendingPathComponent("\(name).png")
        
        do {
            try pngData.write(to: fileURL)
            logger.info("Successfully saved \(name).png to: \(fileURL.path)")
        } catch {
            logger.error("Failed to save \(name).png: \(error.localizedDescription)")
        }
        #endif
    }
} 
