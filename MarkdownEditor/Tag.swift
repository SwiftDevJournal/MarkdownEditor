//
//  Tag.swift
//  MarkdownEditor
//
//  Created by mark on 2/17/20.
//  Copyright © 2020 Swift Dev Journal. All rights reserved.
//

import Foundation

enum TagName {
    case heading1
    case heading2
    case heading3
    case heading4
    case bold
    case italic
    case code
    case inlineCode
    case paragraph
    case none
    
    func getKey() -> String {
        switch self {
        case .heading1:
            return "Heading 1"
        case .heading2:
            return "Heading 2"
        case .heading3:
            return "Heading 3"
        case .heading4:
            return "Heading 4"
        case .bold:
            return "Bold"
        case .italic:
            return "Italic"
        case .code:
            return "Code"
        case .inlineCode:
            return "Inline Code"
        default:
            return "Paragraph"
        }
    }
}

struct Tag {
    var tagType: TagName
    var text: String = ""
    
    init(type: TagName, contents: String) {
        tagType = type
        text = contents
    }
    
    init(title: String) {
        switch title {
        case "Heading 1":
            tagType = .heading1
        case "Heading 2":
            tagType = .heading2
        case "Heading 3":
            tagType = .heading3
        case "Heading 4":
            tagType = .heading4
        case "Bold":
            tagType = .bold
        case "Italic":
            tagType = .italic
        case "Code Block":
            tagType = .code
        case "Inline Code":
            tagType = .inlineCode
        default:
            tagType = .paragraph
        }
    }
    
    init(prefix: String) {
        switch prefix {
        case "# ":
            tagType = .heading1
        case "## ":
            tagType = .heading2
        case "### ":
            tagType = .heading3
        case "#### ":
            tagType = .heading4
        case "```":
            tagType = .code
        default:
            tagType = .paragraph
        }
    }
    
    func getMarkupPrefix() -> String {
        switch tagType {
        case .heading1:
            return "# "
        case .heading2:
            return "## "
        case .heading3:
            return "### "
        case .heading4:
            return "#### "
        case .bold:
            return "**"
        case .italic:
            return "*"
        case .code:
            return "```\n"
        case .inlineCode:
            return "`"
        default:
            return ""
        }
    }
    
    func getMarkupSuffix() -> String {
        switch tagType {
        case .bold:
            return "**"
        case .italic:
            return "*"
        case .code:
            return "\n```\n"
        case .inlineCode:
            return "`"
        default:
            return ""
        }
    }
}
