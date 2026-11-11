$ErrorActionPreference = "Continue"
Add-Type -AssemblyName System.Drawing
$src = @"
using System;
using System.Runtime.InteropServices;
public class P {
  [DllImport("user32.dll")] public static extern bool PrintWindow(IntPtr h, IntPtr hdc, uint f);
  [DllImport("user32.dll")] public static extern bool GetWindowRect(IntPtr h, out RECT r);
  public struct RECT { public int L; public int T; public int R; public int B; }
}
"@
Add-Type -TypeDefinition $src -ErrorAction Stop
"type=ok"
$p = Get-Process Obsidian | Where-Object { $_.MainWindowHandle -ne 0 } | Select-Object -First 1
"pid=" + $p.Id + " hwnd=" + $p.MainWindowHandle
$r = New-Object P+RECT
$g2 = [P]::GetWindowRect($p.MainWindowHandle, [ref]$r)
"rectOK=" + $g2 + " " + $r.L + "," + $r.T + " " + ($r.R - $r.L) + "x" + ($r.B - $r.T)