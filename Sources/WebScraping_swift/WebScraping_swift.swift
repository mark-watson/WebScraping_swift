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

func webPageHeadersHelper(uri: String, headerName: String) -> [String] {
    var ret: [String] = []
    guard let myURL = URL(string: uri) else {
        print("Error: \(uri) doesn't seem to be a valid URL")
        fatalError("invalid URI")
    }
    do {
        let html = try String(contentsOf: myURL, encoding: .ascii)
        let doc: Document = try SwiftSoup.parse(html)
        let h1_headers = try doc.select(headerName)
        for el in h1_headers {
            let h1 = try el.text()
            ret.append(h1)
        }
    } catch {
        print("Error")
    }
    return ret
}


public func webPageH1Headers(uri: String) -> [String] {
    return webPageHeadersHelper(uri: uri, headerName: "h1")
}
    
public func webPageH2Headers(uri: String) -> [String] {
    return webPageHeadersHelper(uri: uri, headerName: "h2")
}


public func webPageAnchors(uri: String) -> [[String]] {
    var ret: [[String]] = []
    guard let myURL = URL(string: uri) else {
        print("Error: \(uri) doesn't seem to be a valid URL")
        fatalError("invalid URI")
    }
    do {
        let html = try String(contentsOf: myURL, encoding: .ascii)
        let doc: Document = try SwiftSoup.parse(html)
        let anchors = try doc.select("a")
        for a in anchors {
            let text = try a.text()
            let a_uri = try a.attr("href")
            if a_uri.hasPrefix("#") {
                ret.append([text, uri + a_uri])
            } else {
                ret.append([text, a_uri])
            }
        }
    } catch {
        print("Error")
    }
    return ret
}

