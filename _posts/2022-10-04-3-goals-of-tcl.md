---
# License: CC-BY-NC-4.0
title: "3 Goals of Tcl"
excerpt: "simple, yet effective"
tags: en
axseq: 14
published: true
image: /assets/img/22/14.jpg
---

Creator of the Tcl language, [John
Ousterhout](https://en.wikipedia.org/wiki/John_Ousterhout), states that
*embeddability* is crucial for the language. What does *embeddability* mean? In
simple words, Tcl should be easily embedded into other programming languages
and tools.

In this direction, the following 3 characteristics form the basis of the
language. Tcl should be **extensible**, **simple** & **generic** and **open for
integration**.

Tcl should be **extensible** because any application that uses Tcl should be
easily add its own features to the core features of the language and these
additions should look natural.

Tcl should be **simple** and **generic** enough because it should work with
variety of applications aiming different use cases.

Tcl should be **open for integration** because its main purpose is to integrate
different things and act as a *glue* between different components. Therefore
the language must have a good support for integration.

[As stated earlier]({% post_url 2022-10-02-what-is-tcl %}),
[EDA](https://en.wikipedia.org/wiki/Electronic_design_automation) tools like
[Vivado](https://www.xilinx.com/products/design-tools/vivado.html) from
[Xilinx](https://en.wikipedia.org/wiki/Xilinx) heavily uses Tcl as a command
and scripting language. All Tcl commands are supported by the latest version
of the tool are listed [here](https://docs.xilinx.com/r/en-US/ug835-vivado-tcl-commands/Introduction).
Most of the commands like `write_bistream`, `synth_design`, `set_input_delay`
are not native Tcl commands. They were added to the language by the vendor to
make calling and execution of tool related jobs possible. There are lots of
EDA tools having different custom Tcl command sets. Extending the language for
needs of different vendors is possible thanks to the given three properties.

## References

- <https://www.tcl.tk/about/history.html>
