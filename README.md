# Introduction

This set of documents is primarily intended as a set of personal notes, tips, tricks and scripts related to performing well in capture the flag competitions. With any luck, it can also be of use to others, particularly my friends and team mates from https://slothkrew.com / #slothkrew.

Little effort will be made to explain techniques, as there are many better resources to learn from if you want to understand the topic. Also, I don't know what I'm doing. Rather, this is more of a checklist of approaches to take when presented with a challenge in a CTF, based on my limited previous experience in CTFs.

## Contents

 1. [Miscellaneous](#miscellaneous)
 1. [Reverse engineering](#reverse-engineering)
 1. [Web security](#web-security)
 1. [Cryptography](#cryptography)
 1. [Steganography](#steganography)

# Miscellaneous

Some things to note:

 * It's extremely common for the title to be a clue. Even if it's not an obvious one, keep it in mind as it may become useful part way through the challenge.
 * Google everything.

# Reverse Engineering

 1. What type of file is it? Run `$ file crackme` to find out.
 1. Is the flag in `$ strings crackme`?

# Web Security

 1. Check ALL included files. If the site is including any external libraries, check the included version against the current version. If the challenge is including a very old version, it's possible that there is an exploit for it.
 1. Check any and all inputs for SQL injection. This can include things like cookies and HTTP headers.
 1. Try to determine what platform/language the website is built from.

# Cryptography

Here are some of the ciphers I've encountered being used in CTF challenges:

 * Caesar
 * Vigenère

# Steganography

## Images

 1. Anything in the exif metadata?
 1. What file format is it? Different image formats provide different avenues for hiding data.
 1. Does playing about with levels/curves reveal the flag?
 1. Is the flag hidden in only one of the colour channels?

## Text

 1. Are there seemingly superfluous tabs/spaces at the end of lines? It could be a [whitespace](http://en.wikipedia.org/wiki/Whitespace_%28programming_language%29) program.

