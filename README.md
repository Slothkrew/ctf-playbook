This readme was automatically generated from the individual sections in `playbook/`.

# Introduction

This set of documents is primarily intended as a set of personal notes, tips, tricks and scripts related to performing well in capture the flag competitions. With any luck, it can also be of use to others, particularly my friends and team mates from https://slothkrew.com / #slothkrew.

Little effort will be made to explain techniques, as there are many better resources to learn from if you want to understand the topic. Also, I don't know what I'm doing. Rather, this is more of a checklist of approaches to take when presented with a challenge in a CTF, based on my limited previous experience in CTFs.

### Contents

 1. [Miscellaneous](#miscellaneous)
 1. [Reverse engineering](#reverse-engineering)
 1. [Web security](#web-security)
 1. [Cryptography](#cryptography)
 1. [Steganography](#steganography)
 1. [Exploitation](#exploitation)

# Miscellaneous

Some things to note:

 * It's extremely common for the title to be a clue. Even if it's not an obvious one, keep it in mind as it may become useful part way through the challenge.
 * Google everything.
 * Look for non obvious avenues of attack. If a challenge gives away any side channel information, you may be expected to use it.
 * Don't dismiss the obvious - even though is misleading from time to time, following the most obvious hints can easily lead to success, especially for the lower-score challenges.

# Reverse Engineering

 * What type of file is it? Run `$ file crackme` to find out.
 * Is the flag in `$ strings crackme`?
 * Search for all referenced text strings in your debugger. Look for things like "access denied", "access granted", etc. and work backwards from there.
 * Has the executable been stripped of debugging information?

### Windows specific

 * Check for calls to `kernel32.isDebuggerPresent()`
 * Check for `int 3` calls. They trap the debugger to a stop.

# Web Security

 1. Check ALL included files. If the site is including any external libraries, check the included version against the current version. If the challenge is including a very old version, it's possible that there is an exploit for it.
 1. Check any and all inputs for SQL injection. This can include things like cookies and HTTP headers.
 1. Try to determine what platform/language the website is built from.

# Cryptography

You will encounter a wide variety of cryptographic techniques in CTFs, but some fruit hangs lower than others, and I am trying to build some reusable modules to aid us.

A few ciphers I've encountered so far:

 * Caesar (`scripts/examples/crypto/caesar.rb`)
 * Vigenère
 * Scytale transposition cipher
 * Substitution cipher

# Steganography

 * Look for extra data hidden in the "unused" areas of the file.

### Images

 1. Anything in the exif metadata?
 1. What file format is it? Different image formats provide different avenues for hiding data.
 1. Does playing about with levels/curves reveal the flag?
 1. Is the flag hidden in only one of the colour channels?

### Text

 1. Are there seemingly superfluous tabs/spaces at the end of lines? It could be a [whitespace](http://en.wikipedia.org/wiki/Whitespace_%28programming_language%29) program.

# Exploitation

 * Any buffers you can overflow? In simple challenges, you may be able to overwrite values on the stack to your advantage.

### Sandbox Escapes

 * If functions are blacklisted by name, look for other ways to invoke them.

### Reading

 * https://isisblogs.poly.edu/2012/10/26/escaping-python-sandboxes/

# Brainstorming

This section is intended as brainstorming playground to note down ideas that might be worthy of implementing

 * Since we now have a teamaddress, sloths@slothkrew.com, it might be not the worst idea to rework the homepage a little bit. Not only to include said address, but maybe start publishing writeups or give generally a bit more information about ourselves
 * The tooldump should be reworked.. dot|not, fix this!
 * Even though we are registered on CTFTime as a team, taking a more planned approach could be nice - some sort of calendar-app? (Also: We should update our mailaddress there)
 * 'I'll totally write that down as a write-up so I can use it later' - famous last words. Writeups would help us not to forget that 'totally obvious thing' we missed. Yet we really lack the patience to actually write some. Maybe we should make them publicly available in order to put us under some peer pressure. (plsnowordpress)

