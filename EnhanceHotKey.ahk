switchState := Object() ; Initially Empty
switchState := [1,0,1,1] ; Google, Wheel, Volume, Command

LoadMenu(switchState)
{
    menu, tray, nostandard
    if switchState[1] = 1
	{
	    menu, tray, add, GoogleEnabled, Google
	}
	else
	{
	    menu, tray, add, GoogleDisabled, Google 
	}
	if switchState[2] = 1
	{
	    menu, tray, add, MacWheelEnabled, Wheel
	}
	else
	{
	    menu, tray, add, MacWheelDisabled, Wheel 
	}
	if switchState[3] = 1
	{
	    menu, tray, add, VolumeKeyEnabled, Volume
	}
	else
	{
	    menu, tray, add, VolumeKeyDisabled, Volume 
	}
	if switchState[4] = 1
	{
	    menu, tray, add, AltAsCommand, Command
	}
	else
	{
	    menu, tray, add, WinAsCommand, Command 
	}
    menu, tray, add  ; separator
    menu, tray, add, Help, HELP
	menu, tray, add, About, About
    menu, tray, add, DisableAll, PAUSE
    menu, tray, add, Exit, QuitNow ; added exit script option
}
LoadMenu(switchState)
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

HELP:
    Run https://autohotkey.com/docs/AutoHotkey.htm
Return

PAUSE:
	if NewName <> EnableAll
	{
		OldName = DisableAll
		NewName = EnableAll
	}
	else
	{
		OldName = EnableAll
		NewName = DisableAll
	}
	menu, tray, rename, %OldName%, %NewName%
	Pause Toggle
Return

QuitNow: ; exit script label 
	ExitApp 
Return

Google:
	if switchState[1] = 1
	{
		OldName = GoogleEnabled
		NewName = GoogleDisabled
		switchState[1] := 0
	}
	else
	{
		OldName = GoogleDisabled
		NewName = GoogleEnabled
		switchState[1] := 1
	}
	menu, tray, rename, %OldName%, %NewName%
Return

Wheel:
	if switchState[2] = 1
	{
		OldName = MacWheelEnabled
		NewName = MacWheelDisabled
		switchState[2] := 0
	}
	else
	{
		OldName = MacWheelDisabled
		NewName = MacWheelEnabled
		switchState[2] := 1
	}
	menu, tray, rename, %OldName%, %NewName%
Return

Volume:
	if switchState[3] = 1
	{
		OldName = VolumeKeyEnabled
		NewName = VolumeKeyDisabled
		switchState[3] := 0
	}
	else
	{
		OldName = VolumeKeyDisabled
		NewName = VolumeKeyEnabled
		switchState[3] := 1
	}
	menu, tray, rename, %OldName%, %NewName%
Return

Command:
	if switchState[4] = 1
	{
		OldName = AltAsCommand
		NewName = WinAsCommand
		switchState[4] := 0
	}
	else
	{
		OldName = WinAsCommand
		NewName = AltAsCommand
		switchState[4] := 0
	}
	menu, tray, rename, %OldName%, %NewName%
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Search
#g:: ; Win+g
    if switchState[1] = 1
    {
	    Run https://www.google.com/search?q=%clipboard%
	}
Return

#t:: ; Win+t
    if switchState[1] = 1
    {
        Run https://translate.google.com/#en/zh-CN/%clipboard%
	}
Return

;;;;;;;;;;;;;;;;;; Volume ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Numpad0 & Numpad4::
    if switchState[3] = 1
    {
        Send {Volume_Down}  ; Lower the master volume by 1 interval (typically 5%).
	}
Return

Numpad0 & Numpad5::
    if switchState[3] = 1
    {
        Send {Volume_Mute}  ; Mute/unmute the master volume.
	}
Return

Numpad0 & Numpad6::
    if switchState[3] = 1
    {
        Send {Volume_Up}  ; Raise the master volume by 1 interval (typically 5%).
	}
Return

Numpad0 & Numpad2::
    if switchState[3] = 1
    {
		Send {Volume_Down 5}  ; Lower the master volume by 5 intervals.
	}
Return

Numpad0 & Numpad8::
    if switchState[3] = 1
    {
        Send {Volume_Up 5}  ; Raise the master volume by 5 intervals.
	}
Return

Numpad0 & Numpad7::
    if switchState[3] = 1
    {
        SoundSet, +1, Line, Mute  ; Raise the master volume by 5 intervals.
	}
Return

Numpad0::
    Send {Numpad0}
Return

;;;;;;;;;;;;; Mac Home, End, PageUp, PageDown ;;;;;;;;;;;;;;;;;;;;;;;;;;;

!Left:: ; Alt+left
    if switchState[4] = 1
    {
        Send {Home}
	}
	else
	{
	    Send !Left
	}
Return

!Right:: ; Alt+right
    if switchState[4] = 1
    {
		Send {End}
	}
	else
	{
	    Send !Right
	}
Return

!Up:: ; Alt+up
    if switchState[4] = 1
    {
		Send {PgUp}
	}
	else
	{
	    Send !Up
	}
Return

!Down:: ; Alt+down
    if switchState[4] = 1
    {
        Send {PgDn}
	}
	else
	{
	    Send !Down
	}
Return
;---------------------------------------
#Left:: ; Win+left
    if switchState[4] = 1
    {
        Send {Home}
	}
	else
	{
	    Send #Left
	}
Return

#Right:: ; Win+right
    if switchState[4] = 1
    {
		Send {End}
	}
	else
	{
	    Send #Right
	}
Return

#Up:: ; Win+up
    if switchState[4] = 1
    {
		Send {PgUp}
	}
	else
	{
	    Send #Up
	}
Return

#Down:: ; Win+down
    if switchState[4] = 1
    {
        Send {PgDn}
	}
	else
	{
	    Send #Down
	}
Return

;;;;;;;;;;; Mac Cut, Copy, Past, Find, Save, Undo, Print ;;;;;;;;;;;;;;;;;;

!A::
    if switchState[4] = 1
    {
        Send ^a
	}
	else
	{
	    Send !a
	}
Return

!X::
    if switchState[4] = 1
    {
        Send ^x
	}
	else
	{
	    Send !x
	}
Return

!C::
    if switchState[4] = 1
    {
        Send ^c
	}
	else
	{
	    Send !c
	}
Return

!V::
    if switchState[4] = 1
    {
        Send ^v
	}
	else
	{
	    Send !v
	}
Return

!F::
    if switchState[4] = 1
    {
        Send ^f
	}
	else
	{
	    Send !f
	}
Return

!Z::
    if switchState[4] = 1
    {
        Send ^z
	}
	else
	{
	    Send !z
	}
Return

!S::
    if switchState[4] = 1
    {
        Send ^s
	}
	else
	{
	    Send !s
	}
Return

!P::
    if switchState[4] = 1
    {
        Send ^p
	}
	else
	{
	    Send !p
	}
Return

!Q::
    if switchState[4] = 1
    {
        Send !{F4}
	}
	else
	{
	    Send !q
	}
Return

!w::
    if switchState[4] = 1
    {
        Send ^w
	}
	else
	{
	    Send !w
	}
Return

-------------------------------------------------------------------

#A::
    if switchState[4] = 0
    {
        Send ^a
	}
	else
	{
	    Send #a
	}
Return

#X::
    if switchState[4] = 0
    {
        Send ^x
	}
	else
	{
	    Send #x
	}
Return

#C::
    if switchState[4] = 0
    {
        Send ^c
	}
	else
	{
	    Send #c
	}
Return

#V::
    if switchState[4] = 0
    {
        Send ^v
	}
	else
	{
	    Send #v
	}
Return

#F::
    if switchState[4] = 0
    {
        Send ^f
	}
	else
	{
	    Send #f
	}
Return

#Z::
    if switchState[4] = 0
    {
        Send ^z
	}
	else
	{
	    Send #z
	}
Return

#S::
    if switchState[4] = 0
    {
        Send ^s
	}
	else
	{
	    Send #s
	}
Return

#P::
    if switchState[4] = 0
    {
        Send ^p
	}
	else
	{
	    Send #p
	}
Return

#Q::
    if switchState[4] = 0
    {
        Send !{F4}
	}
	else
	{
	    Send #q
	}
Return

#w::
    if switchState[4] = 0
    {
        Send ^w
	}
	else
	{
	    Send #w
	}
Return
;;;;;;;;;;;;;;;;;;;;;;; Mac Mouse Wheel ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

WheelUp::
    if switchState[2] = 1
    {
        Send {WheelDown}
	}
	else
	{
	    Send {WheelUp}
	}
Return

WheelDown::
    if switchState[2] = 1
    {
        Send {WheelUp}
	}
	else
	{
	    Send {WheelDown}
	}
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Test ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^b::
    Send ^a
    Sleep, 50
    Send ^c
    Sleep, 50
    Send {Right}
    Sleep, 50
    Send ^v
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;; End File ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;