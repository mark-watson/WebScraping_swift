import XCTest
import Foundation
import SwiftSoup

@testable import WebScraping_swift

final class WebScrapingTests: XCTestCase {
    func testGetWebPage() {
        let text = webPageText(uri: "https://markwatson.com")
        print("\n\n\tTEXT FROM MARK's WEB SITE:\n\n", text)
    }

    func testToShowSwiftSoupExamples() {
        let myURLString = "https://markwatson.com"
        let h1_headers = webPageH1Headers(uri: myURLString)
        print("\n\n++ h1_headers:", h1_headers)
        let h2_headers = webPageH2Headers(uri: myURLString)
        print("\n\n++ h2_headers:", h2_headers)
        let anchors = webPageAnchors(uri: myURLString)
        print("\n\n++ anchors:", anchors)
}

    static var allTests = [("testGetWebPage", testGetWebPage),
                           ("testToShowSwiftSoupExamples", testToShowSwiftSoupExamples)]
}
