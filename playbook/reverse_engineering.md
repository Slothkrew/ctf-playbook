# Reverse Engineering

 * What type of file is it? Run `$ file crackme` to find out.
 * Is the flag in `$ strings crackme`?
   * Windows specific
     * Check for calls to kernel32.isDebuggerPresent()
     * Check for `int 3` calls. They trap the debugger to a stop.
     