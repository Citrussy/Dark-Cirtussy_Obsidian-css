param([string]$Out)
$ErrorActionPreference = "Stop"
Add-Type -AssemblyName System.Drawing
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class P {
  [DllImport("user32.dll")] public static extern bool PrintWindow(IntPtr h, IntPtr hdc, uint f);
  [DllImport("user32.dll")] public static extern bool GetWindowRect(IntPtr h, out RECT r);
  public struct RECT { public int L; public int T; public int R; public int B; }
}
"@
Start-Process "C:\Program Files\Obsidian\Obsidian.exe"
Start-Sleep -Seconds 16
$note = (Get-ChildItem "D:\Obsidian\*.md" | Where-Object { $_.Name -like "Dark Citrussy*" } | Select-Object -First 1).FullName
"note=" + $note
$u = "obsidian://open?path=" + [uri]::EscapeDataString($note)
Start-Process $u
Start-Sleep -Seconds 9
$p = Get-Process Obsidian | Where-Object { $_.MainWindowHandle -ne 0 } | Select-Object -First 1
"title=" + $p.MainWindowTitle
$r = New-Object P+RECT
[P]::GetWindowRect($p.MainWindowHandle, [ref]$r) | Out-Null
$w = $r.R - $r.L; $ht = $r.B - $r.T
"rect=" + $w + "x" + $ht
$bmp = New-Object System.Drawing.Bitmap $w, $ht
$g = [System.Drawing.Graphics]::FromImage($bmp)
$hdc = $g.GetHdc()
$ok = [P]::PrintWindow($p.MainWindowHandle, $hdc, 2)
$g.ReleaseHdc($hdc)
$g.Dispose()
$bmp.Save($Out, [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
"printwindow=" + $ok