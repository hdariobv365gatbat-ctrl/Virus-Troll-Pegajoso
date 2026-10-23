@echo off
setlocal enabledelayedexpansion

:BUCLE
powershell -NoProfile -Command ^
    "$fotos = Get-ChildItem -Path $env:USERPROFILE -Include *.jpg,*.png,*.jpeg,*.bmp -Recurse -ErrorAction SilentlyContinue;" ^
    "if ($fotos.Count -gt 0) {" ^
        "$foto = Get-Random -InputObject $fotos;" ^
        "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\", CharSet=CharSet.Auto)] public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni); }';" ^
        "[Wallpaper]::SystemParametersInfo(0x0014, 0, $foto.FullName, 0x01 -bor 0x02);" ^
    "}"

timeout /t 2 /nobreak >nul

goto BUCLE