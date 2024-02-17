---
# License: CC-BY-SA-4.0.
title: "A Brief History of C Programming Language 📜"
excerpt: "Since 1972"
axseq: 12
image: /assets/img/23/12.jpg
published: true
tags:
  - en
#canonical_url: 'https://asynx.dev/c-struct-padding-packed'
---

C is a pretty old language. C is a byproduct of the UNIX project. UNIX led to
the development of C and C helped UNIX to gain further success.

## 70s 🕺

The history of the C programming language dates back to 1969. [Ken
Thompson](https://en.wikipedia.org/wiki/Ken_Thompson) started to develop a
language called B (a kind of stripped-down version of BCPL) around 1969. [^1f]
In 1971, [Dennis Ritchie](https://en.wikipedia.org/wiki/Dennis_Ritchie) started
to improve the [B](https://en.wikipedia.org/wiki/B_(programming_language))
language and called this new language New B or NB, in short. After several
modifications to B, he decided to give a distinct name to this modified B
language and created the C language in **1972**.

![PDP-11](/assets/img/23/12-pdp11.jpg){:.centered .lazyload}

{:.text-align-center}
Ken Thompson (sitting) and Dennis Ritchie at PDP-11. [Origin](https://commons.wikimedia.org/wiki/File:Ken_Thompson_(sitting)_and_Dennis_Ritchie_at_PDP-11_(2876612463).jpg)

**But why the name C?** It is believed that Ritchie selected the letter C (the next
letter after B in the English alphabet) because the language was derived from
the B programming language [^2f]. Another less common theory is as follows. We
know that B had derived from BCPL. Ritchie chose the name C because the letter
after B is C in BCPL. If there was a third language after C, that would be P
language, not D. We are not sure about the reason because as far as I know,
Ritchie didn't explain the rationale behind selecting this name. By the way,
there is a D programming language, but it is not considered a successor of C.
The language derived from C is C++.

6 years after the birth of C, in **1978**, [Brian
Kernighan](https://en.wikipedia.org/wiki/Brian_Kernighan) and Ritchie published
[The C Programming
Language](https://en.wikipedia.org/wiki/C_(programming_language)) book. This
book is very well known and still very famous today. It is the "bible" of C. The
version of C explained in that book is known as **K&R C** (notice that **K** and
**R** are the initials of the surnames of the authors). At that time, the C
language was not yet standardized as it is today. This book is considered the
standard for the language that was not standardized formally in **1978.** The C
version described in this book can also be called C78, although it is very
uncommon.

![The C Programming Language, first edition,
1978](/assets/img/23/12-cbook.png){:.centered .lazyload}

{:.text-align-center}
The C Programming Language, first edition, 1978. [Origin](https://commons.wikimedia.org/wiki/File:The_C_Programming_Language,_First_Edition_Cover.svg)

This is one of the first programming books to have the classical "Hello World"
example.

```c
printf("hello, world\n");
```

![Hello World](/assets/img/23/12-helloworld.jpg){:.centered .lazyload}

{:.text-align-center}
The "real" Hello World by Brian Kernighan.
[Origin](https://commons.wikimedia.org/wiki/File:Hello_World_Brian_Kernighan_1978.jpg)

## 80s 🎸

In 1989, ANSI published the first C standard, known as **ANSI C** or **C89**. In
1990, [ISO (International Organization for
Standardization)](https://www.ansi.org/) adopted the ANSI C standard, did
non-technical modifications and published the **ISO C** or **C90** standard.
Indeed, all four of them (ANSI C, C89, ISO C and C90) refer to the same
standard, and today they are used interchangeably. Until the publication of the
first standard in 1989, K&R C (the C explained in the book) was the *de facto*
standard. In 1988, the same authors (K&R) published the second and the last
version of The C Programming Language. [^5f] This edition covers the ANSI C
standard. The following standards have only been published by ISO, and ANSI has
not published any other standard.

The C version used between the birth of C (around 1970) and the first standard
(1989/1990) is also known as **classic C** or **traditional C**.

## 90s 💾

Several modifications were made to the rules of the language after the first
standard. The second major standard known as **C99** was published in **1999**.
Before C99, **C95** was published in **1995**, but there are no significant
differences between C95 and C90. **However, the differences between C90 (ANSI C,
ISO C or C89, whatever you choose) and C99 are significant.**

> ℹ️ Today, most of the programmers talk about C99 when they say C. I observe that
> C99 is the dominant version, especially in the embedded world. Yes, it is
> quite old, but this is the case.

## C++ and C

The first C++ standard was published in 1998 as C++98. Today, the C that exists
in C++ differs from the C language itself. The C++ developers created a modified
C within the C++ language. The C supported in C++ isn't the same as the C
programming language. They fixed some ambiguous rules and added new features to
C90 while preparing C++98. Since they were creating a new language, they had no
concerns (almost) like backward compatibility, and they were free to do whatever
they wanted. Some suitable features and corrections done by C++ developers are
[backported](https://en.wikipedia.org/wiki/Backporting) to the C language with
C99, so to speak.

## 2000s 📱

In **2011**, the third major standard, **C11**, was published. Some new features
like **multi-threading** are added to the language with this version.

In **2018**, **C17** (also known as **C18**) was published. C17 didn't introduce
new features to the language and only did some technical corrections and
clarifications to specifications in C11.

The next version after C17 is C23. The new version is expected to be published
in 2024 as **C23**. [^3f] [^4f] [^7f]

## Standards 📏

The standards can be summarized as follows. Please keep in mind that the C
language was born in 1972.

| Year | Informal Name(s) | Formal Standard Name(s) |
| --- | --- | --- |
| 1970s | classic C, traditional C | \- |
| 1978 | K&R C, C78 | \- |
| 1989/1990 | ANSI C, ISO C, C89, C90 | ISO/IEC 9899:1990, ANSI X3.159-1989(?) |
| 1995 | C95 | ISO/IEC 9899:1990/AMD1:1995 |
| 1999 | C99 | ISO/IEC 9899:1999 |
| 2011 | C11 | ISO/IEC 9899:2011 |
| 2018 | C17, C18 | ISO/IEC 9899:2018 |
| *2024* | *C23* | *ISO/IEC 9899:2024* |

**At that moment, C23 is expected to be finalized in 2024.**

## UNIX and C

At the beginning, I said that C is a byproduct of the UNIX project. Now, let's
look at the history of UNIX briefly.

In 1964, MIT started a new project. The main aim of this project was to create a
time-sharing operating system to allow multiple users to use expensive
computers. This is the famous [Multics ("MULTiplexed Information and Computing
Service")](https://en.wikipedia.org/wiki/Multics) operating system project.
There were 3 big players in the project: MIT, General Electric and Bell Labs.
One of the participants from Bell Labs was Ken Thompson. After some time and for
some (probably economical) reason, Bell Labs withdrew from the project and
decided to design their operating system. The name of this project is
[UNIX](https://en.wikipedia.org/wiki/Unix), well actually "Unics" (UNiplexed
Information and Computing System). [^8f] The word Unix is sort of a word joke, M
in Multics stands for "Multiplexed" and U stands for "Uniplexed" although both
of them target multi-user usage. [^6f]

In 1969 (the same year that Linus Torvalds was born), Thompson and his
colleagues started to work on DEC PDP-7 and they implemented the UNIX. In 1970,
UNIX was rewritten for DEC PDP-11, again in assembly. First, they started to
write UNIX in assembly language and then they thought that getting help from a
higher-level language could be a good idea. In those days, BCPL was a popular
system programming language. BCPL had been derived from CPL and CPL is a
successor of Algol. While working with BCPL, Ken Thompson created a B language
and then Dennis Ritchie continued to work on B and created the C language. So,
we can say that Algol is the ancestor of C. Even though they got help from
higher languages, the team was still writing UNIX in assembly. Notice that the
UNIX project is older than the C language.

After a couple of years, C was mature enough and they decided to rewrite the
whole project in C. This is the first biggest success of the C programming
language. In 1973, UNIX (Version 4) was rewritten in C. Today, most of us would
say that C is a low-level language like assembly because we know higher-level
languages like Python and C#. But back in those days, writing an operating
system in a high-level language like C was revolutionary. Before C the main
language of operating systems was assembly. Can you feel the pain? Porting an
assembly program to another architecture is
[PITA](https://en.wiktionary.org/wiki/pain_in_the_ass). But once you write a
program in C and if you have a compiler for the target architecture, then you
can easily port the program. UNIX is not an exception, it had a little
architecture-dependent assembly code, but most of the code was in portable C.

In 1978, K&R published The C Programming Language book. Besides being the first
book on the C language, it also covered UNIX and UNIX programming.

In programming languages word, it is common that a language is influenced by its
predecessors and this is true for C.

In summary:

![Programming Languages](/assets/img/23/12-timeline.png){:.centered .lazyload}

## Personal Computers and C 💻

The personal computer revolution had begun in the early 1980s. For example, IBM
released their famous Personal Computer (PC) in those years. Nowadays, the C
language is mainly used in the embedded world, operating systems and system
programming. But with the personal computer revolution, C was preferred for
almost all kinds of programs. C became a great choice not only for operating
system programmers but for all programmers.

## Related 🔗

Brian Kernighan (K of K&R) talking about The C Programming Language book and a
bit of history.

Brian Kernighan on Computerphile Channel:

{% include youtubePlayer.html id="de2Hsvxaf8M" %}

You can also check out this interview: [Brian Kernighan and Lex
Fridman](https://www.youtube.com/watch?v=O9upVbGSBFo).

## Resources

- <https://en.wikipedia.org/wiki/The_C_Programming_Language>
- Personal Notes from [Necati Ergin](https://github.com/necatiergin/)'s C Course
- Kaan Aslan's [C notes](https://github.com/necatiergin/) (in Turkish)
- Personal notes from [Kaan Aslan](https://csystem.org/)'s Unix/Linux System
  Programming Course
- Personal notes from [Kaan Aslan](https://csystem.org/)'s in-house C training
- [Bjarne Stroustrup: C++ | Lex Fridman Podcast
  #48](https://www.youtube.com/watch?v=uTxRF5ag27A)
- The Linux Programming Interface, Michael Kerrisk, *A Brief History of UNIX and
  C*

[^1f]: <https://www.youtube.com/watch?v=de2Hsvxaf8M>
[^2f]: <https://qr.ae/pvc7Ln>
[^3f]: <https://www.reddit.com/r/C_Programming/comments/w5hl80/c23_now_finalized/>
[^4f]: <https://en.cppreference.com/w/c/23>
[^5f]: <https://en.wikipedia.org/wiki/The_C_Programming_Language>
[^6f]: <https://en.wikipedia.org/wiki/Uniplex>
[^7f]: <https://en.wikipedia.org/wiki/C23_(C_standard_revision)>
[^8f]: <http://ibgwww.colorado.edu/~lessem/psyc5112/usail/concepts/hx-of-unix/unixhx.html>
