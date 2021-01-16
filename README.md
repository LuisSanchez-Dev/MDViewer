# MDViewer

A fast and lightweight markdown viewer for Windows written in Autohotkey.

## Installation

You can download the compiled app from here, or you can clone the repo.

## Usage

To open a markdown file:

* Drag and drop a markdown file to the executable/ahk file
* Pass a markdown file path as the first argument to the executable or ahk file:

```
MDViewer.exe README.md
MDViewer.ahk README.md
```

To set MDViewer as the default markdown viewer:

1. Right click on a markdown file
2. Go to Open With and click on Choose another app...
3. Click on More apps then on Look for another app in this PC...
4. Find and select the MDViewer.exe or MDViewer.ahk
5. Double click MDViewer in the list

## Customization

To customize the style of the formatted markdown you can add a `style.css` file next to the MDViewer.exe or MDViewer.ahk and it will load it instead of the default one.

## License

Licensed under MIT Copyright (C) 2021 Luis Sanchez (luissanchezdev, LuisSanchez-Dev)