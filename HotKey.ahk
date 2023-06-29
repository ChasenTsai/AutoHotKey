#SingleInstance ignore
Persistent

A_IconTip := "HotKey"
TraySetIcon(A_ScriptDir "\HotKeyDark.ico")

Run_AsUser(Program) {
    ComObject("Shell.Application")
    .Windows.FindWindowSW(0, 0, 0x08, 0, 0x01)
    .Document.Application.ShellExecute(Program)
}

#W::Run_AsUser("C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe")
#S::Run_AsUser("C:\Apps\Coding\Sublime\sublime_text.exe")

!,::Send "{Media_Prev}"
!.::Send "{Media_Next}"
!/::Send "{Media_Play_Pause}"

Capslock & T::WinSetAlwaysOnTop -1, "A"

Capslock & W::MouseMove 0, -1, 0, "R"
Capslock & A::MouseMove -1, 0, 0, "R"
Capslock & S::MouseMove 0, 1, 0, "R"
Capslock & D::MouseMove 1, 0, 0, "R"

Capslock & I::Send "{Up}"
Capslock & J::Send "{Left}"
Capslock & K::Send "{Down}"
Capslock & L::Send "{Right}"

Capslock & Del::Send 1
Capslock & End::Send 2
Capslock & PgDn::Send 3
Capslock & Ins::Send 4
Capslock & Home::Send 5
Capslock & PgUp::Send 6
Capslock & PrintScreen::Send 7
Capslock & ScrollLock::Send 8
Capslock & Pause::Send 9
Capslock & Up::Send 0

Count := 0
Ctrl:: {
    global
    (Count < 1 && (A_TimeSincePriorHotkey || 60) < 400 && A_PriorHotkey = A_ThisHotkey) ? Count++ : ( Count := 0 )
    if Count > 0
        Send "{F7}" ; 欧路词典的取词快捷键
}
