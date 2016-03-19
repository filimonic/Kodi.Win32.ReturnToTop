; Kodi ReturnOnTop Script
; by Alexey D. Filimonov <alexey@filimonic.net>
;
; Checks if kodi window is active. If kodi goes inavtive, tries to to return it active $KODI_RETURN_TRIES $KODI_RETURN_TRIES times in a row every $KODI_CHECK_INTERVAL msecs.
; After that, it stops returning and waits for kodi to be returned by user;
;
; Useful to keep kodi on top
;
; Usage example:
; Put this to startup. After Kodi starts and $STARTUP_DELAY passes, try to switch window. The script will return kodi back to active.
; Repeat $KODI_RETURN_TRIES times in a row, without letting kodi to be active more than $KODI_CHECK_INTERVAL msecs. Ater $KODI_CHECK_INTERVAL tries, script will not try to return kodi back until it is activated manually


Global $KODI_CLASS_WINDOW = "[CLASS:Kodi]" ; Kodi window class name
Global $KODI_CHECK_INTERVAL = 1500 ; How often to check, ms
Global $KODI_RETURN_TRIES = 2 ; Do N tries to return kodi, then give up
Global $STARTUP_DELAY = 15000 ; Wait ms after startup



Func CheckKodiExists()
	If WinExists($KODI_CLASS_WINDOW) Then
		Return True
	EndIf
	Return False
EndFunc   ;==>CheckKodiExists

Func CheckKodiActive()
	if WinActive($KODI_CLASS_WINDOW) Then
		Return True
	EndIf
	Return False
EndFunc ;==>CheckKodiActive

Func MoveKodiOnTop()
	WinActivate($KODI_CLASS_WINDOW)
EndFunc   ;==>MoveKodiOnTop


Func MainLoop()
	Local $triesLeft = $KODI_RETURN_TRIES
	While True
		If CheckKodiExists() Then
			if CheckKodiActive() Then
				If $triesLeft = 0 Then
					$triesLeft = $KODI_RETURN_TRIES
				EndIf
			Else
				If $triesLeft > 0 Then
					$triesLeft = $triesLeft - 1
					MoveKodiOnTop()
				Else
					; Do nothing
				EndIf
			EndIf
		EndIf
		Sleep($KODI_CHECK_INTERVAL)
	WEnd
EndFunc   ;==>MainLoop


Sleep($STARTUP_DELAY)
MainLoop()
