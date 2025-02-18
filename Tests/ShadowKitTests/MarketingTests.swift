import XCTest
@testable import ShadowKit

@MainActor
final class MarketingTests: XCTestCase {
    func testGenerateMarketingAssets() throws {
        #if os(macOS)
        print("Working directory: \(FileManager.default.currentDirectoryPath)")
        MarketingAssets.generateAssets()
        #endif
    }
} 
