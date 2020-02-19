# MarkdownEditor
A simple Mac Markdown editor with live preview. 

This project accompanies the following tutorial:

Create a Mac Markdown Editor with Live Preview](https://www.swiftdevjournal.com/create-a-mac-markdown-editor-with-live-preview/)

Enter Markdown in the text view on the left and see the HTML output on the right. This project can be the starting point towards creating a full-featured Mac Markdown editor.

## Note on Code Blocks

This editor uses [the Ink parser](https://github.com/JohnSundell/Ink), which currently does not support the common method of using indentation to designate Markdown code blocks.

You must add three backticks above and below the code block, such as the following:

 ```` 
 ```
  // Your code block here
 ``` 
 ````

