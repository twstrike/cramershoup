	.file	"arithmetic.c"
	.section	.text.unlikely.p448_eq,"ax",@progbits
.LCOLDB3:
	.section	.text.p448_eq,"ax",@progbits
.LHOTB3:
	.p2align 4,,15
	.globl	p448_eq
	.hidden	p448_eq
	.type	p448_eq, @function
p448_eq:
.LFB4659:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movq	%rdi, %rax
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
	.cfi_escape 0x10,0xd,0x2,0x76,0x78
	.cfi_escape 0x10,0xc,0x2,0x76,0x70
	pushq	%rbx
	subq	$176, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x60
	movq	24(%rax), %rdx
	movq	(%rax), %r8
	movq	8(%rax), %rbx
	movq	16(%rax), %r12
	movq	(%rsi), %r11
	movq	8(%rsi), %r9
	movq	%rdx, -184(%rbp)
	movq	32(%rax), %rdx
	movq	16(%rsi), %r10
	movq	%fs:40, %rdi
	movq	%rdi, -56(%rbp)
	xorl	%edi, %edi
	movq	%rdx, -176(%rbp)
	movq	40(%rax), %rdx
	leaq	-208(%rbp), %rdi
	movq	%rdx, -168(%rbp)
	movq	48(%rax), %rdx
	movq	%rdx, -160(%rbp)
	movq	56(%rax), %rdx
	movq	24(%rsi), %rax
	movq	%rdx, -152(%rbp)
	shrq	$56, %rdx
	movq	%rax, -120(%rbp)
	movq	32(%rsi), %rax
	movq	%rax, -112(%rbp)
	movq	40(%rsi), %rax
	movq	%rax, -104(%rbp)
	movq	48(%rsi), %rax
	movq	%rax, -96(%rbp)
	addq	%rdx, -176(%rbp)
	movabsq	$72057594037927935, %rax
	movq	56(%rsi), %rcx
	movq	%rax, %r13
	andq	-184(%rbp), %r13
	vmovdqa	.LC0(%rip), %ymm3
	movq	%r12, %rsi
	andq	%rax, %r12
	shrq	$56, %rsi
	movq	%rcx, -88(%rbp)
	shrq	$56, %rcx
	vmovdqu	-184(%rbp), %xmm1
	addq	%r13, %rsi
	vpermq	$27, -176(%rbp), %ymm0
	addq	%rcx, -112(%rbp)
	movq	%rsi, -184(%rbp)
	movq	%rbx, %rsi
	vinserti128	$0x1, -168(%rbp), %ymm1, %ymm1
	shrq	$56, %rsi
	addq	%rsi, %r12
	movq	%r8, %rsi
	andq	%rax, %rbx
	shrq	$56, %rsi
	andq	%rax, %r8
	movq	%r12, -192(%rbp)
	vpand	%ymm3, %ymm0, %ymm2
	addq	%rsi, %rbx
	movq	%rax, %rsi
	andq	-120(%rbp), %rsi
	addq	%rdx, %r8
	vpermq	$27, %ymm1, %ymm1
	movq	%r10, %rdx
	shrq	$56, %rdx
	movq	%rbx, -200(%rbp)
	movq	%r8, -208(%rbp)
	vpsrlq	$56, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm2, %ymm0
	vpermq	$27, %ymm0, %ymm1
	vmovdqu	-120(%rbp), %xmm0
	addq	%rsi, %rdx
	movq	%r10, %rsi
	vpermq	$27, -112(%rbp), %ymm2
	andq	%rax, %rsi
	movq	%rdx, -120(%rbp)
	movq	%r9, %rdx
	vinserti128	$0x1, -104(%rbp), %ymm0, %ymm0
	shrq	$56, %rdx
	addq	%rdx, %rsi
	movq	%r9, %rdx
	movq	%rsi, -128(%rbp)
	movq	%r11, %rsi
	andq	%rax, %rdx
	vpand	%ymm3, %ymm2, %ymm2
	shrq	$56, %rsi
	andq	%r11, %rax
	addq	%rsi, %rdx
	vpermq	$27, %ymm0, %ymm0
	addq	%rcx, %rax
	movq	%rdx, -136(%rbp)
	movq	%rax, -144(%rbp)
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm2, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, -112(%rbp)
	vpsubq	%ymm0, %ymm1, %ymm0
	vpaddq	.LC2(%rip), %ymm0, %ymm0
	vmovdqa	-208(%rbp), %ymm1
	vmovdqa	%ymm0, -176(%rbp)
	vpsubq	-144(%rbp), %ymm1, %ymm1
	vpaddq	.LC1(%rip), %ymm1, %ymm1
	vmovdqa	%ymm1, -208(%rbp)
	vzeroupper
	call	p448_is_zero@PLT
	movq	-56(%rbp), %rdi
	xorq	%fs:40, %rdi
	jne	.L6
	addq	$176, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L6:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4659:
	.size	p448_eq, .-p448_eq
	.section	.text.unlikely.p448_eq
.LCOLDE3:
	.section	.text.p448_eq
.LHOTE3:
	.section	.text.unlikely.p448_inverse,"ax",@progbits
.LCOLDB4:
	.section	.text.p448_inverse,"ax",@progbits
.LHOTB4:
	.p2align 4,,15
	.globl	p448_inverse
	.hidden	p448_inverse
	.type	p448_inverse, @function
p448_inverse:
.LFB4660:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x60,0x6
	.cfi_escape 0x10,0xe,0x2,0x76,0x78
	.cfi_escape 0x10,0xd,0x2,0x76,0x70
	.cfi_escape 0x10,0xc,0x2,0x76,0x68
	leaq	-144(%rbp), %r13
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	leaq	-208(%rbp), %rbx
	movq	%rdi, %r14
	movq	%rsi, %r12
	subq	$168, %rsp
	movq	%rbx, %rdi
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_isr@PLT
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	p448_sqr@PLT
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	p448_sqr@PLT
	movq	%rbx, %rdx
	movq	%r12, %rsi
	movq	%r14, %rdi
	call	p448_mul@PLT
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L11
	addq	$168, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L11:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4660:
	.size	p448_inverse, .-p448_inverse
	.section	.text.unlikely.p448_inverse
.LCOLDE4:
	.section	.text.p448_inverse
.LHOTE4:
	.section	.text.unlikely.field_is_square,"ax",@progbits
.LCOLDB6:
	.section	.text.field_is_square,"ax",@progbits
.LHOTB6:
	.p2align 4,,15
	.globl	field_is_square
	.hidden	field_is_square
	.type	field_is_square, @function
field_is_square:
.LFB4661:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movq	%rdi, %rsi
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
	.cfi_escape 0x10,0xd,0x2,0x76,0x78
	.cfi_escape 0x10,0xc,0x2,0x76,0x70
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x60
	leaq	-208(%rbp), %rbx
	leaq	-144(%rbp), %r13
	movq	%rdi, %r12
	subq	$176, %rsp
	movq	%rbx, %rdi
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_isr@PLT
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	p448_sqr@PLT
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	subq	$1, -208(%rbp)
	vmovdqa	.LC5(%rip), %ymm2
	movabsq	$72057594037927935, %rax
	vmovdqa	.LC0(%rip), %ymm3
	movq	%rax, %rdi
	vpaddq	-176(%rbp), %ymm2, %ymm2
	vmovdqa	%ymm2, -176(%rbp)
	movzbl	-145(%rbp), %edx
	addq	%rdx, -176(%rbp)
	vpaddq	-208(%rbp), %ymm3, %ymm0
	vmovdqa	%ymm0, -208(%rbp)
	movq	-192(%rbp), %rsi
	andq	-184(%rbp), %rdi
	movq	%rsi, %rcx
	vmovdqu	-184(%rbp), %xmm0
	shrq	$56, %rcx
	vpermq	$27, -176(%rbp), %ymm1
	addq	%rdi, %rcx
	andq	%rax, %rsi
	vinserti128	$0x1, -168(%rbp), %ymm0, %ymm0
	movq	%rcx, -184(%rbp)
	movq	-200(%rbp), %rcx
	vpand	%ymm3, %ymm1, %ymm1
	movq	%rcx, %rdi
	andq	%rax, %rcx
	shrq	$56, %rdi
	vpermq	$27, %ymm0, %ymm0
	addq	%rdi, %rsi
	movq	-208(%rbp), %rdi
	movq	%rsi, -192(%rbp)
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	movq	%rdi, %rsi
	andq	%rdi, %rax
	movq	%rbx, %rdi
	shrq	$56, %rsi
	addq	%rdx, %rax
	addq	%rsi, %rcx
	vmovdqa	%ymm0, -176(%rbp)
	movq	%rax, -208(%rbp)
	movq	%rcx, -200(%rbp)
	vzeroupper
	call	p448_is_zero@PLT
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	p448_is_zero@PLT
	orq	%rbx, %rax
	movq	-56(%rbp), %rdx
	xorq	%fs:40, %rdx
	jne	.L16
	addq	$176, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L16:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4661:
	.size	field_is_square, .-field_is_square
	.section	.text.unlikely.field_is_square
.LCOLDE6:
	.section	.text.field_is_square
.LHOTE6:
	.section	.text.unlikely.p448_simultaneous_invert,"ax",@progbits
.LCOLDB7:
	.section	.text.p448_simultaneous_invert,"ax",@progbits
.LHOTB7:
	.p2align 4,,15
	.globl	p448_simultaneous_invert
	.hidden	p448_simultaneous_invert
	.type	p448_simultaneous_invert, @function
p448_simultaneous_invert:
.LFB4662:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$256, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%edx, -276(%rbp)
	movq	%fs:40, %rcx
	movq	%rcx, -56(%rbp)
	xorl	%ecx, %ecx
	testl	%edx, %edx
	je	.L17
	cmpl	$1, %edx
	movq	%rdi, %r14
	movq	%rsi, %r13
	movl	%edx, %eax
	je	.L37
	movq	(%rsi), %rdx
	leaq	64(%rdi), %r15
	subl	$1, %eax
	cmpl	$1, %eax
	movl	%eax, -280(%rbp)
	movq	%rdx, 64(%rdi)
	movq	8(%rsi), %rdx
	movq	%rdx, 8(%r15)
	movq	16(%rsi), %rdx
	movq	%rdx, 16(%r15)
	movq	24(%rsi), %rdx
	movq	%rdx, 24(%r15)
	movq	32(%rsi), %rdx
	movq	%rdx, 32(%r15)
	movq	40(%rsi), %rdx
	movq	%rdx, 40(%r15)
	movq	48(%rsi), %rdx
	movq	%rdx, 48(%r15)
	movq	56(%rsi), %rdx
	movq	%rdx, 56(%r15)
	jle	.L38
	movl	-276(%rbp), %eax
	leaq	64(%rsi), %r12
	leal	-3(%rax), %ebx
	addq	$2, %rbx
	salq	$6, %rbx
	addq	%rdi, %rbx
	.p2align 4,,10
	.p2align 3
.L23:
	movq	%r15, %rsi
	addq	$64, %r15
	movq	%r12, %rdx
	movq	%r15, %rdi
	addq	$64, %r12
	call	p448_mul@PLT
	cmpq	%rbx, %r15
	jne	.L23
	movl	-280(%rbp), %esi
	leaq	-208(%rbp), %r15
	leaq	-144(%rbp), %rbx
	movq	%r14, %rdi
	salq	$6, %rsi
	leaq	0(%r13,%rsi), %rdx
	addq	%r14, %rsi
	call	p448_mul@PLT
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	p448_isr@PLT
	movq	%rbx, %rdi
	movq	%r15, %rsi
	call	p448_sqr@PLT
	movq	%rbx, %rsi
	leaq	-272(%rbp), %rbx
	movq	%r15, %rdi
	call	p448_sqr@PLT
	movq	%r15, %rdx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	movq	-272(%rbp), %rdx
	movq	%rdx, (%r14)
	movq	-264(%rbp), %rdx
	movq	%rdx, 8(%r14)
	movq	-256(%rbp), %rdx
	movq	%rdx, 16(%r14)
	movq	-248(%rbp), %rdx
	movq	%rdx, 24(%r14)
	movq	-240(%rbp), %rdx
	movq	%rdx, 32(%r14)
	movq	-232(%rbp), %rdx
	movq	%rdx, 40(%r14)
	movq	-224(%rbp), %rdx
	movq	%rdx, 48(%r14)
	movq	-216(%rbp), %rdx
	movq	%rdx, 56(%r14)
.L21:
	movslq	-280(%rbp), %rdx
	movl	-276(%rbp), %eax
	movq	%rdx, %rcx
	salq	$6, %rcx
	leaq	(%r14,%rcx), %r12
	addq	%rcx, %r13
	leal	-2(%rax), %ecx
	subq	%rcx, %rdx
	salq	$6, %rdx
	leaq	-64(%r14,%rdx), %r15
	.p2align 4,,10
	.p2align 3
.L26:
	movq	%r12, %rsi
	movq	%r14, %rdx
	movq	%rbx, %rdi
	call	p448_mul@PLT
	movq	(%rbx), %rdx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	subq	$64, %r12
	movq	%rdx, 64(%r12)
	movq	8(%rbx), %rdx
	movq	%rdx, 72(%r12)
	movq	16(%rbx), %rdx
	movq	%rdx, 80(%r12)
	movq	24(%rbx), %rdx
	movq	%rdx, 88(%r12)
	movq	32(%rbx), %rdx
	movq	%rdx, 96(%r12)
	movq	40(%rbx), %rdx
	movq	%rdx, 104(%r12)
	movq	48(%rbx), %rdx
	movq	%rdx, 112(%r12)
	movq	56(%rbx), %rdx
	movq	%rdx, 120(%r12)
	movq	%r13, %rdx
	subq	$64, %r13
	call	p448_mul@PLT
	movq	(%rbx), %rdx
	cmpq	%r15, %r12
	movq	%rdx, (%r14)
	movq	8(%rbx), %rdx
	movq	%rdx, 8(%r14)
	movq	16(%rbx), %rdx
	movq	%rdx, 16(%r14)
	movq	24(%rbx), %rdx
	movq	%rdx, 24(%r14)
	movq	32(%rbx), %rdx
	movq	%rdx, 32(%r14)
	movq	40(%rbx), %rdx
	movq	%rdx, 40(%r14)
	movq	48(%rbx), %rdx
	movq	%rdx, 48(%r14)
	movq	56(%rbx), %rdx
	movq	%rdx, 56(%r14)
	jne	.L26
.L17:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L39
	addq	$256, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L37:
	.cfi_restore_state
	leaq	-208(%rbp), %rbx
	leaq	-144(%rbp), %r12
	movq	%rbx, %rdi
	call	p448_isr@PLT
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	p448_sqr@PLT
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	p448_sqr@PLT
	movq	%rbx, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	p448_mul@PLT
	jmp	.L17
.L38:
	movl	%eax, %ecx
	leaq	-208(%rbp), %r15
	leaq	-144(%rbp), %rbx
	salq	$6, %rcx
	movl	%eax, %r12d
	leaq	(%rsi,%rcx), %rdx
	leaq	(%rdi,%rcx), %rsi
	call	p448_mul@PLT
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	p448_isr@PLT
	movq	%rbx, %rdi
	movq	%r15, %rsi
	call	p448_sqr@PLT
	movq	%rbx, %rsi
	leaq	-272(%rbp), %rbx
	movq	%r15, %rdi
	call	p448_sqr@PLT
	movq	%r15, %rdx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	movq	-272(%rbp), %rdx
	testl	%r12d, %r12d
	movq	%rdx, (%r14)
	movq	-264(%rbp), %rdx
	movq	%rdx, 8(%r14)
	movq	-256(%rbp), %rdx
	movq	%rdx, 16(%r14)
	movq	-248(%rbp), %rdx
	movq	%rdx, 24(%r14)
	movq	-240(%rbp), %rdx
	movq	%rdx, 32(%r14)
	movq	-232(%rbp), %rdx
	movq	%rdx, 40(%r14)
	movq	-224(%rbp), %rdx
	movq	%rdx, 48(%r14)
	movq	-216(%rbp), %rdx
	movq	%rdx, 56(%r14)
	jle	.L17
	jmp	.L21
.L39:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4662:
	.size	p448_simultaneous_invert, .-p448_simultaneous_invert
	.section	.text.unlikely.p448_simultaneous_invert
.LCOLDE7:
	.section	.text.p448_simultaneous_invert
.LHOTE7:
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.quad	72057594037927935
	.quad	72057594037927935
	.quad	72057594037927935
	.quad	72057594037927935
	.align 32
.LC1:
	.quad	144115188075855870
	.quad	144115188075855870
	.quad	144115188075855870
	.quad	144115188075855870
	.align 32
.LC2:
	.quad	144115188075855868
	.quad	144115188075855870
	.quad	144115188075855870
	.quad	144115188075855870
	.align 32
.LC5:
	.quad	72057594037927934
	.quad	72057594037927935
	.quad	72057594037927935
	.quad	72057594037927935
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
