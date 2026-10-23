Set WshShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

scriptPath = fso.GetParentFolderName(WScript.ScriptFullName)
currentScript = WScript.ScriptFullName

startupFolder = WshShell.SpecialFolders("Startup")
targetShortcut = startupFolder & "\Zy.lnk"

If Not fso.FileExists(targetShortcut) Then
    Set shortcut = WshShell.CreateShortcut(targetShortcut)
    shortcut.TargetPath = currentScript
    shortcut.WorkingDirectory = scriptPath
    shortcut.Description = "Lanzador Zy"
    shortcut.Save
End If

WshShell.Run chr(34) & scriptPath & "\Tonoto.bat" & chr(34), 0, False