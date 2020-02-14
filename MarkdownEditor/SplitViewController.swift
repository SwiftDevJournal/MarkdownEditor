//
//  SplitViewController.swift
//  MarkdownEditor
//
//  Created by mark on 2/14/20.
//  Copyright © 2020 Swift Dev Journal. All rights reserved.
//

import Cocoa

class SplitViewController: NSSplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func getDocument() -> Document? {
        if let window = view.window,
            let windowController = window.windowController {
            
            return windowController.document as? Document
        }
        return nil
    }
    
    func getTextViewController() -> TextViewController? {
        if let viewController = children.first as? TextViewController {
            return viewController
        }
        return nil
    }
    
    func getPreviewViewController() -> PreviewViewController? {
        if let viewController = children[1] as? PreviewViewController {
            return viewController
        }
        return nil
    }
}
