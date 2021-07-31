import Foundation
import SwiftSoup

public func webPageText(uri: String) -> String {
    guard let myURL = URL(string: uri) else {
        print("Error: \(uri) doesn't seem to be a valid URL")
        fatalError("invalid URI")
    }
    let html = try! String(contentsOf: myURL, encoding: .ascii)
    let doc: Document = try! SwiftSoup.parse(html)
    let plain_text = try! doc.text()
    return plain_text
}

