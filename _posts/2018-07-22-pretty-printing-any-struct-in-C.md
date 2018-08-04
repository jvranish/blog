---
layout: post
title: "Pretty Printing any struct in C"
date: 2018-07-22
---

While not a great idea for production, it can by _extremely_ handy for debugging.

<!--more-->

~~~ c
// probably not re-entrant haha
// JUST_PRINT_IT_DAMMIT("struct my_obj", obj);
#define JUST_PRINT_IT_DAMMIT(TYPE, P) do {                         \
    char cmd[256];                                                 \
    snprintf(cmd, sizeof(cmd),                                     \
        "sudo gdb --batch -ex 'set print pretty on'"               \
        " -ex 'p *(" TYPE "*)%p' --pid %i ", (P), getpid());       \
    system(cmd);                                                   \
} while (0)

~~~

