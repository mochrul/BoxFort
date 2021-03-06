/*
 * The MIT License (MIT)
 *
 * Copyright © 2016 Franklin "Snaipe" Mathieu <http://snai.pe/>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
#include "config.h"
#include "mangling.h"

#ifdef ASSEMBLER_SUPPORTS_HIDDEN
.hidden MANGLE(bxfi_trampoline)
#endif
.globl MANGLE(bxfi_trampoline)
MANGLE(bxfi_trampoline):
    call next
next:
    pop %eax
    jmp *(addr_data - next)(%eax)

#ifdef BXF_EXE_FMT_MACH_O
.align 2
#else
.align 4
#endif

#ifdef ASSEMBLER_SUPPORTS_HIDDEN
.hidden MANGLE(bxfi_trampoline_addr)
#endif
.globl MANGLE(bxfi_trampoline_addr)
MANGLE(bxfi_trampoline_addr):
addr_data:
.fill 4, 1, 0

#ifdef ASSEMBLER_SUPPORTS_HIDDEN
.hidden MANGLE(bxfi_trampoline_end)
#endif
.globl MANGLE(bxfi_trampoline_end)
MANGLE(bxfi_trampoline_end):

#include "stackfix.h"
