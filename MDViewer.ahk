; Copyright (c) Luis Sanchez (luissanchezdev, LuisSanchez-Dev)
; MDViewer - A fast and lightweight markdown viewer for Windows written in Autohotkey

#Include Neutron.ahk

file = %1%
file_content = # No file specified\nMake sure to open a file with this app.
if (file) {
    FileRead, file_content, %file%
    file_content := StrReplace(file_content, "\", "\\")
    file_content := StrReplace(file_content, "`r`n", "\n")
    file_content := StrReplace(file_content, "`n", "\n")
    file_content := StrReplace(file_content, "`n", "\n")
    file_content := StrReplace(file_content, "'", "\'")
}

css := "res://" A_ScriptFullPath "/10/github-markdown.css"
md_parser := "res://" A_ScriptFullPath "/10/remarkable.min.js"
if (!A_IsCompiled) {
    css = %A_ScriptDir%\github-markdown.css
    md_parser = %A_ScriptDir%\remarkable.min.js
}

if (FileExist(A_ScriptDir "\style.css") <> "") {
    css = %A_ScriptDir%\style.css
}

html =
(
    <link rel="stylesheet" href="%css%">
    <script src="%md_parser%"></script>
    <div id="markdown-body" class="markdown-body"></div>
    <script>
        var md = new Remarkable({
            html: true,
            linkify: true
        });
        var html = md.render('%file_content%');
        document.getElementById("markdown-body").innerHTML = html;
    </script>
)
Clipboard := html
MDViewer := new NeutronWindow(html,,, title:="MDViewer - " file)
MDViewer.Gui("+LabelMDViewerGui")
MDViewer.Show("w" A_ScreenWidth " h" A_ScreenHeight)
MDViewer.Maximize()
return

MDViewerGuiClose:
MDViewerGuiEscape:
    MDViewer.Destroy()
    ExitApp
return

FileInstall, remarkable.min.js, remarkable.min.js
FileInstall, github-markdown.css, github-markdown.css#Include Neutron.ahk