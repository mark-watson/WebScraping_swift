import XCTest
import Foundation
import SwiftSoup

@testable import WebScraping

final class WebScrapingTests: XCTestCase {
    func testGetWebPage() {
        let text = webPageText(uri: "https://markwatson.com")
        print(text)
    }

    func testToShowSwiftSoupStructureExamples() {
        let myURLString = "https://markwatson.com"
        guard let myURL = URL(string: myURLString) else {
            print("Error: \(myURLString) doesn't seem to be a valid URL")
            fatalError("Empty response")
        }

        do {
            let html = try String(contentsOf: myURL, encoding: .ascii)
            print("\n\n+++++\nHTML : \(html)")
            let doc: Document = try SwiftSoup.parse(html)
            let plain_text = try doc.text()
            print("\n\n+++++\nplain_text : \(plain_text)")
            let h1_headers = try doc.select("h1")
            print("\n\n+++++\nCSS selection of H1 elements : \(try h1_headers.text())")
            let h1_headers_a = try doc.select("h1 a")
            print("\n\n+++++\nCSS selection of a anchors inside of H1 elements : \(try h1_headers_a.text())")
            for el in h1_headers {
                print("next H1 text : \(try el.text())")
            }
            for el in h1_headers_a {
                print("next a anchor text inside a H1 text : \(try el.text())")
                print("             and corresponding link : \(try el.attr("href"))")
            }
        } catch let error {
            print("Error: \(error)")
        }
}

    static var allTests = [("testGetWebPage", testGetWebPage),
                           ("testToShowSwiftSoupStructureExamples", testToShowSwiftSoupStructureExamples)]
}
