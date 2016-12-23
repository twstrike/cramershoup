	.file	"sha512.c"
	.section	.text.unlikely.sha512_process_block,"ax",@progbits
.LCOLDB0:
	.section	.text.sha512_process_block,"ax",@progbits
.LHOTB0:
	.p2align 4,,15
	.type	sha512_process_block, @function
sha512_process_block:
.LFB4634:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movq	%rdi, %rax
	xorl	%esi, %esi
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
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	leaq	64(%rdi), %rbx
	movq	%rdi, -72(%rbp)
	movq	(%rdi), %r10
	movq	8(%rdi), %r14
	movq	16(%rdi), %rdi
	movq	24(%rax), %rcx
	movq	32(%rax), %r12
	movq	40(%rax), %r11
	movq	56(%rax), %r13
	movq	%rdi, %rdx
	movq	48(%rax), %rdi
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movq	%rdi, %r15
	leaq	sha512_k(%rip), %rdi
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L4:
	movq	%r11, %r15
	movq	%r14, %rcx
	movq	%r12, %r11
	movq	%r10, %r14
	movq	%r9, %r12
	movq	%rax, %r10
.L2:
	movq	(%rbx,%rsi,8), %rdx
	rorx	$14, %r12, %r9
	rorx	$18, %r12, %rax
	xorq	%r9, %rax
	rorx	$41, %r12, %r9
	xorq	%r9, %rax
	bswap	%rdx
	movq	%rdx, (%rbx,%rsi,8)
	addq	(%rdi,%rsi,8), %rdx
	addq	$1, %rsi
	leaq	(%rax,%rdx), %r9
	movq	%r11, %rax
	rorx	$28, %r10, %rdx
	xorq	%r15, %rax
	andq	%r12, %rax
	xorq	%r15, %rax
	leaq	(%r9,%rax), %rax
	addq	%r13, %rax
	rorx	$34, %r10, %r13
	xorq	%r13, %rdx
	rorx	$39, %r10, %r13
	leaq	(%rax,%r8), %r9
	xorq	%rdx, %r13
	movq	%r10, %rdx
	movq	%r10, %r8
	xorq	%r14, %rdx
	andq	%r14, %r8
	andq	%rcx, %rdx
	xorq	%r8, %rdx
	movq	%rcx, %r8
	addq	%r13, %rdx
	movq	%r15, %r13
	addq	%rdx, %rax
	cmpq	$16, %rsi
	jne	.L4
	movq	%rcx, -56(%rbp)
	movq	%r15, -64(%rbp)
	movq	%rax, %r8
	movq	%rsi, %rcx
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%r12, %r11
	movq	%r10, %r14
	movq	%r9, %r12
	movq	%r8, %r10
	movq	%rax, %r9
	movq	%r15, %r8
.L3:
	leaq	1(%rcx), %rdi
	movq	%rcx, %rsi
	andl	$15, %esi
	movq	%rdi, %rax
	leaq	(%rbx,%rsi,8), %r13
	andl	$15, %eax
	movq	(%rbx,%rax,8), %rdx
	leaq	14(%rcx), %rax
	addq	$9, %rcx
	andl	$15, %ecx
	movq	0(%r13), %rsi
	addq	(%rbx,%rcx,8), %rsi
	andl	$15, %eax
	movq	(%rbx,%rax,8), %rax
	rorx	$1, %rdx, %r15
	movq	%rsi, %rcx
	rorx	$8, %rdx, %rsi
	shrq	$7, %rdx
	xorq	%r15, %rsi
	rorx	$19, %rax, %r15
	xorq	%rdx, %rsi
	rorx	$61, %rax, %rdx
	shrq	$6, %rax
	xorq	%r15, %rdx
	addq	%rsi, %rcx
	rorx	$14, %r9, %r15
	xorq	%rax, %rdx
	rorx	$18, %r9, %rax
	movq	%r8, %rsi
	addq	%rdx, %rcx
	xorq	%rax, %r15
	rorx	$41, %r9, %rdx
	xorq	%r15, %rdx
	movq	%r12, %r15
	movq	%rcx, 0(%r13)
	xorq	%r11, %r15
	rorx	$39, %r8, %r13
	andq	%r10, %rsi
	andq	%r9, %r15
	movq	%r15, %rax
	xorq	%r11, %rax
	leaq	(%rdx,%rax), %r15
	leaq	-8+sha512_k(%rip), %rax
	rorx	$34, %r8, %rdx
	addq	(%rax,%rdi,8), %r15
	movq	-56(%rbp), %rax
	movq	%r14, -56(%rbp)
	addq	%r15, %rcx
	rorx	$28, %r8, %r15
	addq	-64(%rbp), %rcx
	xorq	%rdx, %r15
	movq	%r11, -64(%rbp)
	xorq	%r15, %r13
	movq	%r8, %r15
	xorq	%r10, %r15
	andq	%r14, %r15
	addq	%rcx, %rax
	movq	%r15, %rdx
	xorq	%rsi, %rdx
	leaq	0(%r13,%rdx), %r15
	addq	%rcx, %r15
	cmpq	$80, %rdi
	movq	%rdi, %rcx
	jne	.L5
	movq	-72(%rbp), %rdi
	movq	%r12, -56(%rbp)
	vmovq	-56(%rbp), %xmm4
	movq	%rax, -56(%rbp)
	vmovq	-56(%rbp), %xmm5
	vpinsrq	$1, %r11, %xmm4, %xmm0
	vmovdqu	32(%rdi), %xmm1
	movq	%r10, -56(%rbp)
	vinserti128	$0x1, 48(%rdi), %ymm1, %ymm2
	vmovq	-56(%rbp), %xmm6
	movq	%r15, -56(%rbp)
	vpinsrq	$1, %r9, %xmm5, %xmm1
	vmovq	-56(%rbp), %xmm7
	vinserti128	$0x1, %xmm0, %ymm1, %ymm0
	vpaddq	%ymm2, %ymm0, %ymm1
	vmovdqu	(%rdi), %xmm0
	vpinsrq	$1, %r8, %xmm7, %xmm2
	vinserti128	$0x1, 16(%rdi), %ymm0, %ymm3
	vmovups	%xmm1, 32(%rdi)
	vpinsrq	$1, %r14, %xmm6, %xmm0
	vextracti128	$0x1, %ymm1, 48(%rdi)
	vinserti128	$0x1, %xmm0, %ymm2, %ymm0
	vpaddq	%ymm3, %ymm0, %ymm0
	vmovups	%xmm0, (%rdi)
	vextracti128	$0x1, %ymm0, 16(%rdi)
	vzeroupper
	popq	%rbx
	popq	%r10
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4634:
	.size	sha512_process_block, .-sha512_process_block
	.section	.text.unlikely.sha512_process_block
.LCOLDE0:
	.section	.text.sha512_process_block
.LHOTE0:
	.section	.text.unlikely.sha512_init,"ax",@progbits
.LCOLDB1:
	.section	.text.sha512_init,"ax",@progbits
.LHOTB1:
	.p2align 4,,15
	.globl	sha512_init
	.hidden	sha512_init
	.type	sha512_init, @function
sha512_init:
.LFB4635:
	.cfi_startproc
	movq	sha512_init_state(%rip), %rdx
	movq	$0, 192(%rdi)
	movq	%rdi, %rax
	movq	$0, 64(%rdi)
	movq	$0, 184(%rdi)
	leaq	72(%rdi), %rdi
	movq	%rdx, -72(%rdi)
	movq	8+sha512_init_state(%rip), %rdx
	movq	%rdx, -64(%rdi)
	movq	16+sha512_init_state(%rip), %rdx
	movq	%rdx, -56(%rdi)
	movq	24+sha512_init_state(%rip), %rdx
	movq	%rdx, -48(%rdi)
	movq	32+sha512_init_state(%rip), %rdx
	movq	%rdx, -40(%rdi)
	movq	40+sha512_init_state(%rip), %rdx
	movq	%rdx, -32(%rdi)
	movq	48+sha512_init_state(%rip), %rdx
	movq	%rdx, -24(%rdi)
	movq	56+sha512_init_state(%rip), %rdx
	movq	%rdx, -16(%rdi)
	andq	$-8, %rdi
	subl	%edi, %eax
	leal	192(%rax), %ecx
	xorl	%eax, %eax
	shrl	$3, %ecx
	rep stosq
	ret
	.cfi_endproc
.LFE4635:
	.size	sha512_init, .-sha512_init
	.section	.text.unlikely.sha512_init
.LCOLDE1:
	.section	.text.sha512_init
.LHOTE1:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"src/sha512.c"
.LC3:
	.string	"ctx->nbytes < 1ull<<56"
.LC4:
	.string	"bytes < 1ull<<56"
	.section	.text.unlikely.sha512_update,"ax",@progbits
.LCOLDB5:
	.section	.text.sha512_update,"ax",@progbits
.LHOTB5:
	.p2align 4,,15
	.globl	sha512_update
	.hidden	sha512_update
	.type	sha512_update, @function
sha512_update:
.LFB4636:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movabsq	$72057594037927935, %rax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movq	192(%rdi), %rdx
	cmpq	%rax, %rdx
	ja	.L27
	cmpq	%rax, %rbp
	ja	.L11
	testq	%rbp, %rbp
	movq	%rdi, %r13
	movq	%rsi, %r12
	leaq	64(%rdi), %r15
	movl	$128, %r14d
	jne	.L24
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L31:
	testb	$4, %bl
	jne	.L28
	testl	%ebx, %ebx
	je	.L15
	movzbl	(%r12), %edx
	testb	$2, %bl
	movb	%dl, (%rcx)
	jne	.L29
.L15:
	addq	%rbx, %rax
	addq	$-128, %rax
	je	.L30
.L18:
	addq	%rbx, %r12
	subq	%rbx, %rbp
	je	.L19
.L32:
	movq	192(%r13), %rdx
.L24:
	movq	%rdx, %rax
	movq	%r14, %rbx
	andl	$127, %eax
	subq	%rax, %rbx
	leaq	(%r15,%rax), %rcx
	cmpq	%rbp, %rbx
	cmova	%rbp, %rbx
	addq	%rbx, %rdx
	cmpl	$8, %ebx
	movq	%rdx, 192(%r13)
	jb	.L31
	movq	(%r12), %rdx
	leaq	8(%rcx), %rdi
	addq	%rbx, %rax
	andq	$-8, %rdi
	movq	%rdx, (%rcx)
	movl	%ebx, %edx
	movq	-8(%r12,%rdx), %rsi
	movq	%rsi, -8(%rcx,%rdx)
	subq	%rdi, %rcx
	movq	%r12, %rsi
	subq	%rcx, %rsi
	addl	%ebx, %ecx
	shrl	$3, %ecx
	addq	$-128, %rax
	rep movsq
	jne	.L18
.L30:
	movq	%r13, %rdi
	addq	%rbx, %r12
	call	sha512_process_block
	subq	%rbx, %rbp
	jne	.L32
	.p2align 4,,10
	.p2align 3
.L19:
	movabsq	$72057594037927935, %rax
	cmpq	%rax, 192(%r13)
	ja	.L33
.L25:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L28:
	.cfi_restore_state
	movl	(%r12), %edx
	movl	%edx, (%rcx)
	movl	%ebx, %edx
	movl	-4(%r12,%rdx), %esi
	movl	%esi, -4(%rcx,%rdx)
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L29:
	movl	%ebx, %edx
	movzwl	-2(%r12,%rdx), %esi
	movw	%si, -2(%rcx,%rdx)
	jmp	.L15
.L11:
	leaq	__PRETTY_FUNCTION__.27297(%rip), %rcx
	leaq	.LC2(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	movl	$136, %edx
	call	__assert_fail@PLT
.L27:
	leaq	__PRETTY_FUNCTION__.27297(%rip), %rcx
	leaq	.LC2(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	movl	$135, %edx
	call	__assert_fail@PLT
.L33:
	leaq	__PRETTY_FUNCTION__.27297(%rip), %rcx
	leaq	.LC2(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	movl	$151, %edx
	call	__assert_fail@PLT
	.cfi_endproc
.LFE4636:
	.size	sha512_update, .-sha512_update
	.section	.text.unlikely.sha512_update
.LCOLDE5:
	.section	.text.sha512_update
.LHOTE5:
	.section	.text.unlikely.sha512_final,"ax",@progbits
.LCOLDB6:
	.section	.text.sha512_final,"ax",@progbits
.LHOTB6:
	.p2align 4,,15
	.globl	sha512_final
	.hidden	sha512_final
	.type	sha512_final, @function
sha512_final:
.LFB4637:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	192(%rdi), %rdx
	movq	%rdi, %rbx
	leaq	64(%rdi), %rbp
	andl	$127, %edx
	leaq	1(%rdx), %rax
	movb	$-128, 64(%rdi,%rdx)
	cmpq	$112, %rax
	ja	.L35
	movl	$112, %ecx
	subq	%rax, %rcx
.L36:
	addq	%rbp, %rax
	cmpl	$8, %ecx
	movl	%ecx, %edx
	jnb	.L43
	andl	$4, %ecx
	jne	.L58
	testl	%edx, %edx
	je	.L44
	testb	$2, %dl
	movb	$0, (%rax)
	je	.L44
	xorl	%ecx, %ecx
	movw	%cx, -2(%rax,%rdx)
	jmp	.L44
	.p2align 4,,10
	.p2align 3
.L43:
	leaq	8(%rax), %rdi
	movl	%ecx, %edx
	movq	$0, (%rax)
	movq	$0, -8(%rax,%rdx)
	andq	$-8, %rdi
	subq	%rdi, %rax
	leal	(%rcx,%rax), %edx
	movl	%edx, %eax
	shrl	$3, %eax
	movl	%eax, %ecx
	xorl	%eax, %eax
	rep stosq
.L44:
	movq	192(%rbx), %rax
	movq	%rbx, %rdi
	movq	$0, 176(%rbx)
	salq	$3, %rax
	bswap	%rax
	movq	%rax, 184(%rbx)
	call	sha512_process_block
	movq	8(%rbx), %rdx
	movq	(%rbx), %rax
	leaq	8(%rbp), %rdi
	andq	$-8, %rdi
	bswap	%rdx
	bswap	%rax
	movq	%rdx, 8(%rbx)
	movq	16(%rbx), %rdx
	bswap	%rdx
	movq	%rdx, 16(%rbx)
	movq	24(%rbx), %rdx
	bswap	%rdx
	movq	%rdx, 24(%rbx)
	movq	32(%rbx), %rdx
	bswap	%rdx
	movq	%rdx, 32(%rbx)
	movq	40(%rbx), %rdx
	bswap	%rdx
	movq	%rdx, 40(%rbx)
	movq	48(%rbx), %rdx
	bswap	%rdx
	movq	%rdx, 48(%rbx)
	movq	56(%rbx), %rdx
	bswap	%rdx
	movq	%rdx, 56(%rbx)
	movq	%rax, (%r12)
	movq	8(%rbx), %rax
	movq	%rax, 8(%r12)
	movq	16(%rbx), %rax
	movq	%rax, 16(%r12)
	movq	24(%rbx), %rax
	movq	%rax, 24(%r12)
	movq	32(%rbx), %rax
	movq	%rax, 32(%r12)
	movq	40(%rbx), %rax
	movq	%rax, 40(%r12)
	movq	48(%rbx), %rax
	movq	%rax, 48(%r12)
	movq	56(%rbx), %rax
	movq	%rax, 56(%r12)
	movq	sha512_init_state(%rip), %rax
	movq	$0, 192(%rbx)
	movq	%rax, (%rbx)
	movq	8+sha512_init_state(%rip), %rax
	movq	%rax, 8(%rbx)
	movq	16+sha512_init_state(%rip), %rax
	movq	%rax, 16(%rbx)
	movq	24+sha512_init_state(%rip), %rax
	movq	%rax, 24(%rbx)
	movq	32+sha512_init_state(%rip), %rax
	movq	%rax, 32(%rbx)
	movq	40+sha512_init_state(%rip), %rax
	movq	%rax, 40(%rbx)
	movq	48+sha512_init_state(%rip), %rax
	movq	%rax, 48(%rbx)
	movq	56+sha512_init_state(%rip), %rax
	movq	%rax, 56(%rbx)
	movq	$0, 0(%rbp)
	xorl	%eax, %eax
	movq	$0, 120(%rbp)
	subq	%rdi, %rbp
	leal	128(%rbp), %ecx
	shrl	$3, %ecx
	rep stosq
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L35:
	.cfi_restore_state
	movl	$128, %edx
	subq	%rax, %rdx
	addq	%rbp, %rax
	cmpl	$8, %edx
	jnb	.L37
	testb	$4, %dl
	jne	.L59
	testl	%edx, %edx
	je	.L38
	testb	$2, %dl
	movb	$0, (%rax)
	jne	.L60
.L38:
	movq	%rbx, %rdi
	call	sha512_process_block
	movl	$112, %ecx
	xorl	%eax, %eax
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L37:
	movl	%edx, %ecx
	movq	$0, (%rax)
	movq	$0, -8(%rax,%rcx)
	leaq	8(%rax), %rcx
	andq	$-8, %rcx
	subq	%rcx, %rax
	addl	%edx, %eax
	andl	$-8, %eax
	cmpl	$8, %eax
	jb	.L38
	andl	$-8, %eax
	xorl	%edx, %edx
.L41:
	movl	%edx, %esi
	addl	$8, %edx
	cmpl	%eax, %edx
	movq	$0, (%rcx,%rsi)
	jb	.L41
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L58:
	movl	$0, (%rax)
	movl	$0, -4(%rax,%rdx)
	jmp	.L44
	.p2align 4,,10
	.p2align 3
.L59:
	movl	%edx, %edx
	movl	$0, (%rax)
	movl	$0, -4(%rax,%rdx)
	jmp	.L38
.L60:
	movl	%edx, %edx
	xorl	%esi, %esi
	movw	%si, -2(%rax,%rdx)
	jmp	.L38
	.cfi_endproc
.LFE4637:
	.size	sha512_final, .-sha512_final
	.section	.text.unlikely.sha512_final
.LCOLDE6:
	.section	.text.sha512_final
.LHOTE6:
	.section	.rodata.__PRETTY_FUNCTION__.27297,"a",@progbits
	.align 8
	.type	__PRETTY_FUNCTION__.27297, @object
	.size	__PRETTY_FUNCTION__.27297, 14
__PRETTY_FUNCTION__.27297:
	.string	"sha512_update"
	.section	.rodata.sha512_k,"a",@progbits
	.align 32
	.type	sha512_k, @object
	.size	sha512_k, 640
sha512_k:
	.quad	4794697086780616226
	.quad	8158064640168781261
	.quad	-5349999486874862801
	.quad	-1606136188198331460
	.quad	4131703408338449720
	.quad	6480981068601479193
	.quad	-7908458776815382629
	.quad	-6116909921290321640
	.quad	-2880145864133508542
	.quad	1334009975649890238
	.quad	2608012711638119052
	.quad	6128411473006802146
	.quad	8268148722764581231
	.quad	-9160688886553864527
	.quad	-7215885187991268811
	.quad	-4495734319001033068
	.quad	-1973867731355612462
	.quad	-1171420211273849373
	.quad	1135362057144423861
	.quad	2597628984639134821
	.quad	3308224258029322869
	.quad	5365058923640841347
	.quad	6679025012923562964
	.quad	8573033837759648693
	.quad	-7476448914759557205
	.quad	-6327057829258317296
	.quad	-5763719355590565569
	.quad	-4658551843659510044
	.quad	-4116276920077217854
	.quad	-3051310485924567259
	.quad	489312712824947311
	.quad	1452737877330783856
	.quad	2861767655752347644
	.quad	3322285676063803686
	.quad	5560940570517711597
	.quad	5996557281743188959
	.quad	7280758554555802590
	.quad	8532644243296465576
	.quad	-9096487096722542874
	.quad	-7894198246740708037
	.quad	-6719396339535248540
	.quad	-6333637450476146687
	.quad	-4446306890439682159
	.quad	-4076793802049405392
	.quad	-3345356375505022440
	.quad	-2983346525034927856
	.quad	-860691631967231958
	.quad	1182934255886127544
	.quad	1847814050463011016
	.quad	2177327727835720531
	.quad	2830643537854262169
	.quad	3796741975233480872
	.quad	4115178125766777443
	.quad	5681478168544905931
	.quad	6601373596472566643
	.quad	7507060721942968483
	.quad	8399075790359081724
	.quad	8693463985226723168
	.quad	-8878714635349349518
	.quad	-8302665154208450068
	.quad	-8016688836872298968
	.quad	-6606660893046293015
	.quad	-4685533653050689259
	.quad	-4147400797238176981
	.quad	-3880063495543823972
	.quad	-3348786107499101689
	.quad	-1523767162380948706
	.quad	-757361751448694408
	.quad	500013540394364858
	.quad	748580250866718886
	.quad	1242879168328830382
	.quad	1977374033974150939
	.quad	2944078676154940804
	.quad	3659926193048069267
	.quad	4368137639120453308
	.quad	4836135668995329356
	.quad	5532061633213252278
	.quad	6448918945643986474
	.quad	6902733635092675308
	.quad	7801388544844847127
	.section	.rodata.sha512_init_state,"a",@progbits
	.align 32
	.type	sha512_init_state, @object
	.size	sha512_init_state, 64
sha512_init_state:
	.quad	7640891576956012808
	.quad	-4942790177534073029
	.quad	4354685564936845355
	.quad	-6534734903238641935
	.quad	5840696475078001361
	.quad	-7276294671716946913
	.quad	2270897969802886507
	.quad	6620516959819538809
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
