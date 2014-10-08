# Reverse Engineering

 * What type of file is it? Run `$ file crackme` to find out.
 * Is the flag in `$ strings crackme`?
 * Search for all referenced text strings in your debugger. Look for things like "access denied", "access granted", etc. and work backwards from there.

## Windows specific

 * Check for calls to `kernel32.isDebuggerPresent()`
 * Check for `int 3` calls. They trap the debugger to a stop.
