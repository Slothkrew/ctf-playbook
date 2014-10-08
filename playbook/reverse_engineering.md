# Reverse Engineering

 1. What type of file is it? Run `$ file crackme` to find out.
 1. Is the flag in `$ strings crackme`?
   l. Windows specific
     l. Check for calls to kernel32.isDebuggerPresent()
     l. Check for `int 3` calls. They trap the debugger to a stop.