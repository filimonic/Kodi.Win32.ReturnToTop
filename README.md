# Kodi.Win32.ReturnToTop
Useful to keep kodi on top

Usage example:
Put this to startup. After Kodi starts and $STARTUP_DELAY passes, try to switch window. The script will return kodi back to active.
Repeat $KODI_RETURN_TRIES times in a row, without letting kodi to be active more than $KODI_CHECK_INTERVAL msecs.
Ater $KODI_CHECK_INTERVAL tries, script will not try to return kodi back until it is activated manually
