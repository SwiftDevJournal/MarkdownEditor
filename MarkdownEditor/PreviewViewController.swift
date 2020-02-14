//
//  PreviewViewController.swift
//  MarkdownEditor
//
//  Created by mark on 2/14/20.
//  Copyright © 2020 Swift Dev Journal. All rights reserved.
//

import Cocoa
import WebKit
import Ink

class PreviewViewController: NSViewController {

    @IBOutlet var previewView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func updatePreview(text: String) {
        let html = parse(text: text)
        previewView.loadHTMLString(html, baseURL: nil)
    }
    
    func parse(text: String) -> String {
        let parser = MarkdownParser()
        return parser.html(from: text)
    }
}
