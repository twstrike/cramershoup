	.file	"f_arithmetic.c"
	.section	.text.unlikely.p448_isr,"ax",@progbits
.LCOLDB0:
	.section	.text.p448_isr,"ax",@progbits
.LHOTB0:
	.p2align 4,,15
	.globl	p448_isr
	.hidden	p448_isr
	.type	p448_isr, @function
p448_isr:
.LFB4659:
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
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	leaq	-272(%rbp), %r15
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	leaq	-208(%rbp), %r14
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rsi, %rbx
	leaq	-144(%rbp), %r12
	movl	$4, %r13d
	subq	$320, %rsp
	movq	%rdi, -352(%rbp)
	movq	%r15, %rdi
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsi, -344(%rbp)
	call	p448_sqr@PLT
	movq	%r15, %rdx
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	p448_mul@PLT
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	p448_sqr@PLT
	movq	%r15, %rdx
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	p448_mul@PLT
	movq	%r14, %rsi
	movq	%r15, %rdi
	leaq	-336(%rbp), %rbx
	call	p448_sqr@PLT
	movq	%r15, %rsi
	movq	%r12, %rdi
	call	p448_sqr@PLT
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	p448_sqr@PLT
	movq	%r15, %rdx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	p448_sqr@PLT
	movq	%r15, %rsi
	movq	%r12, %rdi
	call	p448_sqr@PLT
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	p448_sqr@PLT
	movq	%r15, %rdx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	p448_sqr@PLT
.L2:
	movq	%r14, %rsi
	movq	%r12, %rdi
	call	p448_sqr@PLT
	movq	%r12, %rsi
	movq	%r14, %rdi
	call	p448_sqr@PLT
	subl	$1, %r13d
	jne	.L2
	movq	%r14, %rdx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	p448_mul@PLT
	movq	%r15, %rsi
	movq	%rbx, %rdi
	movl	$8, %r13d
	call	p448_sqr@PLT
	movq	-344(%rbp), %rsi
	movq	%rbx, %rdx
	movq	%r14, %rdi
	call	p448_mul@PLT
	movq	%r14, %rsi
	movq	%r12, %rdi
	call	p448_sqr@PLT
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	p448_sqr@PLT
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	p448_sqr@PLT
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	p448_sqr@PLT
	subl	$1, %r13d
	jne	.L3
	movq	%rbx, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	p448_mul@PLT
	movl	$18, %r13d
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	p448_sqr@PLT
	.p2align 4,,10
	.p2align 3
.L4:
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	p448_sqr@PLT
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	p448_sqr@PLT
	subl	$1, %r13d
	jne	.L4
	movq	%rbx, %rdx
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	p448_mul@PLT
	movl	$18, %r13d
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	p448_sqr@PLT
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	p448_sqr@PLT
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	p448_sqr@PLT
	subl	$1, %r13d
	jne	.L5
	movq	%rbx, %rdx
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	p448_mul@PLT
	movl	$55, %r13d
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	p448_sqr@PLT
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	p448_sqr@PLT
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	p448_sqr@PLT
	subl	$1, %r13d
	jne	.L6
	movq	%rbx, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	p448_mul@PLT
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movl	$111, %r13d
	call	p448_sqr@PLT
	movq	-344(%rbp), %rsi
	movq	%rbx, %rdx
	movq	%r15, %rdi
	call	p448_mul@PLT
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	p448_sqr@PLT
	.p2align 4,,10
	.p2align 3
.L7:
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	p448_sqr@PLT
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	p448_sqr@PLT
	subl	$1, %r13d
	jne	.L7
	movq	-352(%rbp), %rdi
	movq	%rbx, %rdx
	movq	%r14, %rsi
	call	p448_mul@PLT
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L18
	addq	$320, %rsp
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
.L18:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4659:
	.size	p448_isr, .-p448_isr
	.section	.text.unlikely.p448_isr
.LCOLDE0:
	.section	.text.p448_isr
.LHOTE0:
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
