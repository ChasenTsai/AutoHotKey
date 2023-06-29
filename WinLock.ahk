#SingleInstance ignore
Persistent

A_IconTip := "WinLock"

lastx := 123
lasty := 123

SetTimer WatchCursor, 2000

WatchCursor()
{
    global
    MouseGetPos &xpos, &ypos
    if (lastx = 123 and lasty = 123)
    {
        lastx := xpos
        lasty := ypos
    }
    else if (lastx = xpos and lasty = ypos)
    {

    }
    else
    {
        DllCall("LockWorkStation")
        Sleep 3000
        SendMessage 0x0112, 0xF170, 2,, "Program Manager"
        ExitApp
    }
}
