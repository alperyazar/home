---
# License: CC-BY-SA-4.0.
title: "Overview of the C Compilation Flow"
excerpt: "How is a typical C program compiled? What are the fundamental steps? What is a compiler?"
axseq: 9
image: /assets/img/24/9.jpg
published: false
tags:
  - en
  - talkingc
#canonical_url: 'https://asynx.dev/c-struct-padding-packed'
#modified_date: 2024-02-17
---

In this post, I will attempt to explain the basics of the C compilation process,
including the various phases involved. Understanding these phases is crucial
because it can help us quickly identify problems when a compilation fails or
issues warnings. I will also provide examples to illustrate these concepts.

**C is a compiled language.** If you're unfamiliar with this term or wish to learn
more about the features or paradigms of the C language, I recommend reading the
previous post in the 'Talking C' series first.

{% include ax_single.html reccmode="single" reccyear="23" reccaxseq="13" %}

When we talk about a "C program" we usually imply the source code of a program,
consisting of single or multiple text files with extension `.c` and `.h`. Let's
say that the following code snippet is part of our C code:

```c
int sum(int x, int y)
{
  return x + y;
}
```

The `sum` function calculates the addition of two integers. However, a
computer's CPU cannot understand the source code directly, as humans can. It
doesn't "interpret" code in the way we might think. Instead, we need to give
"instructions" to the CPU in a form it can comprehend. Therefore, we must
convert this text into something the CPU can understand.

The interface (or language) that lets us communicate with a CPU is called the
**Instruction Set Architecture (ISA).** CPUs understand commands (think of them
as words and sentences) that are specific to their ISA. It's important to
understand that there isn't one ISA that fits all CPUs. The ISA a CPU can
interpret depends on its architecture. For example, x86, ARM, and RISC-V
processors each follow their own ISAs. As a result, commands intended for an ARM
ISA won't work on a RISC-V processor, and **no processor can directly execute C
source code!** A **translation** from C source code to the target processor's
ISA is necessary. If we were to describe a C compiler in one sentence, it would
be this:

**A C compiler converts human-readable C source code into commands that the
target processor's ISA understands.**

Now, let's take the `sum` function's source code as an example and *translate*
it using a C compiler for different processor architectures. This will show us
how the same functionality is achieved on various processors through their
unique Instruction Set Architectures (ISAs):

For **x86-64** architecture:

```text
push    rbp
mov     rbp, rsp
mov     DWORD PTR [rbp-4], edi
mov     DWORD PTR [rbp-8], esi
mov     edx, DWORD PTR [rbp-4]
mov     eax, DWORD PTR [rbp-8]
add     eax, edx
pop     rbp
ret
```

For **ARM64** architecture:

```text
sub     sp, sp, #16
str     w0, [sp, 12]
str     w1, [sp, 8]
ldr     w1, [sp, 12]
ldr     w0, [sp, 8]
add     w0, w1, w0
add     sp, sp, 16
ret
```

For **RISC-V**:

```text
addi    sp,sp,-32
sd      s0,24(sp)
addi    s0,sp,32
mv      a5,a0
mv      a4,a1
sw      a5,-20(s0)
mv      a5,a4
sw      a5,-24(s0)
lw      a5,-20(s0)
mv      a4,a5
lw      a5,-24(s0)
addw    a5,a4,a5
sext.w  a5,a5
mv      a0,a5
ld      s0,24(sp)
addi    sp,sp,32
jr      ra
```

Firstly, for this example, you don't need to grasp every detail of the code.
Simply observe that the same C code is translated into entirely different
commands for each processor, due to each one having its unique ISA. Even though
the ISAs differ, you might spot similar patterns, but we'll not delve into that
for now. To generate the necessary commands, I used GCC, a widely recognized C
compiler, to translate the same C code for different processors' ISAs.

C is a programming language designed for humans to read and write easily.
Similarly, an ISA (Instruction Set Architecture) defines a language, but this
one is for processors to understand. ISAs are mostly created by processor
manufacturers, like ARM, who specify which commands their processor can
understand and how it will respond to those commands. So, we have two different
languages: the C programming language for humans, and the ISA, a language
designed by processor manufacturers for their processors.

Imagine a situation where two people are in a room: one only speaks English, and
the other only speaks Turkish. How can they communicate? They would need a
translator who knows both English and Turkish. The same concept applies to C
programming. We need a program that can translate C code into the specific
commands of a target processor's ISA. This computer program, which translates C
code into processor commands, is known as a C compiler.

In general, a program that converts programs written in one language to another
language is called translator. C compilers are translators. In this case, the
target language
