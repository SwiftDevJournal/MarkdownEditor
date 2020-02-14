//
//  TextViewController.swift
//  MarkdownEditor
//
//  Created by mark on 2/14/20.
//  Copyright © 2020 Swift Dev Journal. All rights reserved.
//

import Cocoa

class TextViewController: NSViewController, NSTextDelegate {

    @IBOutlet var textView: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
    }
    
    override func viewDidAppear() {
        if let document = getDocument() {
            textView.string = document.markdown
        }
    }
    
    func saveTextViewContents() {
        if let document = getDocument() {
            document.markdown = textView.string
        }
    }
    
    func textDidChange(_ notification: Notification) {
        saveTextViewContents()
        updateLivePreview(text: textView.string)
        if let document = getDocument() {
            document.updateChangeCount(NSDocument.ChangeType.changeDone)
        }
    }
    
    func updateLivePreview(text: String) {
        if let splitViewController = parent as? SplitViewController,
            let previewController = splitViewController.getPreviewViewController() {
            
            previewController.updatePreview(text: text)
        }
    }
    
    func getDocument() -> Document? {
        if let splitViewController = parent as? SplitViewController {
            return splitViewController.getDocument()
        }
        return nil
    }
}
