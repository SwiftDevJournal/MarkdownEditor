//
//  TagCreation.swift
//  MarkdownEditor
//
//  Created by mark on 2/17/20.
//  Copyright © 2020 Swift Dev Journal. All rights reserved.
//

import Cocoa

extension TextViewController {
    @IBAction func addTag(_ sender: NSMenuItem) {
        // TODO: Find a better way to associate a tag with a menu item that doesn't rely on the menu item text, which would break if I were to translate to other languages. I would also like to find a way that works with toolbar buttons for common tags.
        // Is there a way to associate a menu item with the TagName Swift enum? If I could get that to work, it would also work with toolbar buttons.
        let tagTitle = sender.title
        createTag(name: tagTitle)
        
        NotificationCenter.default.post(name: NSText.didChangeNotification, object: textView)
    }
    
    func createTag(name: String) {
        let selection = textView?.selectedRange
        
        let tag = Tag(title: name)
        let prefix = tag.getMarkupPrefix()
        let suffix = tag.getMarkupSuffix()
        
        let prefixAttributedString = NSAttributedString(string: prefix)
        textView.textStorage?.insert(prefixAttributedString, at: (selection?
            .location)!)
        
        let suffixAttributedString = NSAttributedString(string: suffix)
        let insertionPoint = (selection?.location)! + (selection?.length)! + prefix.count
        textView.textStorage?.insert(suffixAttributedString, at: insertionPoint)
    }
    
}
