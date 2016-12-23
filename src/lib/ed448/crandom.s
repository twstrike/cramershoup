	.file	"crandom.c"
	.section	.text.unlikely.crandom_detect_features,"ax",@progbits
.LCOLDB0:
	.section	.text.crandom_detect_features,"ax",@progbits
.LHOTB0:
	.p2align 4,,15
	.globl	crandom_detect_features
	.hidden	crandom_detect_features
	.type	crandom_detect_features, @function
crandom_detect_features:
.LFB4686:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$1, %eax
#APP
# 23 "src/crandom.c" 1
	cpuid
# 0 "" 2
#NO_APP
	movl	%edx, %eax
	andl	$67108864, %eax
	cmpl	$1, %eax
	sbbl	%esi, %esi
	andl	$-2, %esi
	addl	$7, %esi
	cmpl	$1, %eax
	sbbl	%eax, %eax
	andl	$-2, %eax
	addl	$3, %eax
	andb	$2, %dh
	cmove	%eax, %esi
	movl	%esi, %eax
	orl	$8, %eax
	testl	$33554432, %ecx
	cmovne	%eax, %esi
	movl	%esi, %eax
	orl	$32, %eax
	testl	$268435456, %ecx
	cmovne	%eax, %esi
	movl	%esi, %eax
	orl	$64, %eax
	andl	$32, %ebx
	cmovne	%eax, %esi
	movl	%esi, %eax
	orb	$-128, %al
	andl	$1073741824, %ecx
	cmovne	%eax, %esi
	movl	$-2147483647, %eax
#APP
# 32 "src/crandom.c" 1
	cpuid
# 0 "" 2
#NO_APP
	movl	%esi, %eax
	orl	$16, %eax
	andb	$8, %ch
	cmovne	%eax, %esi
	movl	%esi, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4686:
	.size	crandom_detect_features, .-crandom_detect_features
	.section	.text.unlikely.crandom_detect_features
.LCOLDE0:
	.section	.text.crandom_detect_features
.LHOTE0:
	.section	.text.unlikely.crandom_init_from_file,"ax",@progbits
.LCOLDB1:
	.section	.text.crandom_init_from_file,"ax",@progbits
.LHOTB1:
	.p2align 4,,15
	.globl	crandom_init_from_file
	.hidden	crandom_init_from_file
	.type	crandom_init_from_file, @function
crandom_init_from_file:
.LFB4694:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	xorl	%eax, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbp
	movq	%rsi, %rdi
	xorl	%esi, %esi
	movl	%ecx, %r13d
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	$0, 144(%rbp)
	movl	%edx, 148(%rbp)
	movl	%edx, 152(%rbp)
	movq	$0, 128(%rbp)
	call	open@PLT
	cmpl	$-1, %eax
	movl	%eax, 160(%rbp)
	je	.L35
	movl	%eax, %edi
	xorl	%ebx, %ebx
	movl	$32, %r12d
	.p2align 4,,10
	.p2align 3
.L31:
	movq	%r12, %rdx
	leaq	0(%rbp,%rbx), %rsi
	subq	%rbx, %rdx
	call	read@PLT
	testq	%rax, %rax
	jle	.L35
	addq	%rax, %rbx
	cmpq	$31, %rbx
	jg	.L25
	movl	160(%rbp), %edi
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L35:
	call	__errno_location@PLT
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L37
.L32:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L25:
	.cfi_restore_state
	leaq	40(%rbp), %rdi
	movl	%ebp, %eax
	movq	$0, 32(%rbp)
	movq	$0, 120(%rbp)
	andq	$-8, %rdi
	subl	%edi, %eax
	leal	128(%rax), %ecx
	xorl	%eax, %eax
	shrl	$3, %ecx
	rep stosq
	movabsq	$8243122740751376436, %rax
	movl	%r13d, 156(%rbp)
	movq	%rax, 136(%rbp)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L37:
	.cfi_restore_state
	movl	$-1, %eax
	jmp	.L32
	.cfi_endproc
.LFE4694:
	.size	crandom_init_from_file, .-crandom_init_from_file
	.section	.text.unlikely.crandom_init_from_file
.LCOLDE1:
	.section	.text.crandom_init_from_file
.LHOTE1:
	.section	.text.unlikely.crandom_init_from_buffer,"ax",@progbits
.LCOLDB2:
	.section	.text.crandom_init_from_buffer,"ax",@progbits
.LHOTB2:
	.p2align 4,,15
	.globl	crandom_init_from_buffer
	.hidden	crandom_init_from_buffer
	.type	crandom_init_from_buffer, @function
crandom_init_from_buffer:
.LFB4695:
	.cfi_startproc
	movq	(%rsi), %rax
	movq	%rdi, %rdx
	leaq	40(%rdi), %rdi
	movq	%rax, -40(%rdi)
	movq	8(%rsi), %rax
	movq	%rax, -32(%rdi)
	movq	16(%rsi), %rax
	movq	%rax, -24(%rdi)
	movq	24(%rsi), %rax
	movq	$0, -8(%rdi)
	movq	$0, 80(%rdi)
	movq	%rax, -16(%rdi)
	andq	$-8, %rdi
	movl	%edx, %eax
	subl	%edi, %eax
	leal	128(%rax), %ecx
	xorl	%eax, %eax
	shrl	$3, %ecx
	rep stosq
	movabsq	$8243122740751376436, %rax
	movl	$0, 156(%rdx)
	movq	$0, 128(%rdx)
	movl	$0, 144(%rdx)
	movl	$0, 152(%rdx)
	movl	$0, 148(%rdx)
	movl	$-1, 160(%rdx)
	movq	%rax, 136(%rdx)
	ret
	.cfi_endproc
.LFE4695:
	.size	crandom_init_from_buffer, .-crandom_init_from_buffer
	.section	.text.unlikely.crandom_init_from_buffer
.LCOLDE2:
	.section	.text.crandom_init_from_buffer
.LHOTE2:
	.section	.text.unlikely.crandom_generate,"ax",@progbits
.LCOLDB8:
	.section	.text.crandom_generate,"ax",@progbits
.LHOTB8:
	.p2align 4,,15
	.globl	crandom_generate
	.hidden	crandom_generate
	.type	crandom_generate, @function
crandom_generate:
.LFB4696:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movabsq	$8243122740751376436, %rax
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
	subq	$64, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	cmpq	%rax, 136(%rdi)
	jne	.L57
	movq	%rdx, %r13
	movl	152(%rdi), %edx
	movq	%rdi, %r12
	movq	%rsi, %r15
	testl	%edx, %edx
	jne	.L77
.L41:
	xorl	%ebx, %ebx
	testq	%r13, %r13
	je	.L74
	.p2align 4,,10
	.p2align 3
.L55:
	movl	144(%r12), %eax
	testl	%eax, %eax
	movl	%eax, %r14d
	je	.L78
.L44:
	cmpq	%r14, %r13
	movq	%r15, %rdi
	cmovbe	%r13, %r14
	subl	%r14d, %eax
	movq	%r14, %rdx
	leaq	32(%r12,%rax), %rsi
	movl	%eax, 144(%r12)
	call	memcpy@PLT
	movl	144(%r12), %edx
	addq	$32, %rdx
	leaq	(%r12,%rdx), %rax
	addq	%r14, %rdx
	addq	%r12, %rdx
	.p2align 4,,10
	.p2align 3
.L54:
	movb	$0, (%rax)
	addq	$1, %rax
	cmpq	%rax, %rdx
	jne	.L54
	addq	%r14, %r15
	subq	%r14, %r13
	jne	.L55
.L74:
	addq	$64, %rsp
	movl	%ebx, %eax
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
.L78:
	.cfi_restore_state
	movl	152(%r12), %r8d
	testl	%r8d, %r8d
	je	.L60
	movl	$1000, %edx
	xorl	%esi, %esi
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L79:
	testq	%rax, %rax
	jne	.L62
.L46:
	movq	%rsi, %rax
#APP
# 49 "src/crandom.c" 1
	rdrand %rdi
	setc %al
# 0 "" 2
#NO_APP
	subl	$1, %edx
	jne	.L79
.L62:
#APP
# 45 "src/include/intrinsics.h" 1
	rdtsc
# 0 "" 2
#NO_APP
	movq	%rax, -64(%rbp)
	movl	148(%r12), %eax
	subl	$1, %eax
	testl	%eax, %eax
	movl	%eax, 148(%r12)
	jle	.L48
	vmovq	-64(%rbp), %xmm9
.L45:
	movq	128(%r12), %rdx
	movl	$10, %eax
	vmovdqa	16(%r12), %xmm7
	vpinsrq	$1, %rdx, %xmm9, %xmm3
	addq	$1, %rdx
	vmovdqa	(%r12), %xmm5
	vmovdqa	%xmm7, %xmm0
	vmovdqa	%xmm7, %xmm2
	vmovaps	%xmm7, -80(%rbp)
	vpinsrq	$1, %rdx, %xmm9, %xmm9
	vmovaps	%xmm3, -96(%rbp)
	vmovdqa	%xmm5, %xmm13
	vmovaps	%xmm5, -64(%rbp)
	vmovdqa	%xmm5, %xmm15
	vmovdqa	%xmm3, %xmm11
	vmovdqa	%xmm0, %xmm6
	vmovdqa	.LC3(%rip), %xmm7
	vmovdqa	%xmm7, %xmm5
	.p2align 4,,10
	.p2align 3
.L53:
	vpaddd	%xmm13, %xmm6, %xmm12
	vpxor	%xmm12, %xmm7, %xmm0
	subl	$1, %eax
	vpshufb	.LC4(%rip), %xmm0, %xmm0
	vpaddd	%xmm11, %xmm0, %xmm11
	vpxor	%xmm11, %xmm6, %xmm6
	vpslld	$12, %xmm6, %xmm4
	vpsrld	$20, %xmm6, %xmm1
	vpaddd	%xmm2, %xmm15, %xmm6
	vpxor	%xmm1, %xmm4, %xmm1
	vpxor	%xmm6, %xmm5, %xmm5
	vpaddd	%xmm1, %xmm12, %xmm12
	vpxor	%xmm12, %xmm0, %xmm0
	vpshufb	.LC4(%rip), %xmm5, %xmm3
	vpshufb	.LC5(%rip), %xmm0, %xmm0
	vpaddd	%xmm9, %xmm3, %xmm7
	vpxor	%xmm7, %xmm2, %xmm2
	vpaddd	%xmm0, %xmm11, %xmm11
	vpxor	%xmm11, %xmm1, %xmm1
	vpslld	$12, %xmm2, %xmm4
	vpsrld	$20, %xmm2, %xmm2
	vpxor	%xmm2, %xmm4, %xmm2
	vpslld	$7, %xmm1, %xmm8
	vpsrld	$25, %xmm1, %xmm10
	vpxor	%xmm10, %xmm8, %xmm5
	vpaddd	%xmm2, %xmm6, %xmm6
	vpxor	%xmm6, %xmm3, %xmm1
	vpshufd	$78, %xmm11, %xmm3
	vpshufd	$57, %xmm5, %xmm5
	vpshufb	.LC5(%rip), %xmm1, %xmm1
	vpaddd	%xmm12, %xmm5, %xmm12
	vpaddd	%xmm1, %xmm7, %xmm7
	vpxor	%xmm7, %xmm2, %xmm2
	vpshufd	$78, %xmm7, %xmm7
	vpslld	$7, %xmm2, %xmm9
	vpsrld	$25, %xmm2, %xmm4
	vpshufd	$147, %xmm0, %xmm2
	vpxor	%xmm4, %xmm9, %xmm4
	vpshufd	$147, %xmm1, %xmm0
	vpxor	%xmm12, %xmm2, %xmm2
	vpshufd	$57, %xmm4, %xmm4
	vpshufb	.LC4(%rip), %xmm2, %xmm2
	vpaddd	%xmm6, %xmm4, %xmm6
	vpxor	%xmm6, %xmm0, %xmm0
	vpaddd	%xmm2, %xmm3, %xmm3
	vpxor	%xmm3, %xmm5, %xmm1
	vpshufb	.LC4(%rip), %xmm0, %xmm10
	vpslld	$12, %xmm1, %xmm5
	vpsrld	$20, %xmm1, %xmm1
	vpxor	%xmm1, %xmm5, %xmm1
	vpaddd	%xmm10, %xmm7, %xmm7
	vpxor	%xmm7, %xmm4, %xmm0
	vpaddd	%xmm1, %xmm12, %xmm12
	vpxor	%xmm2, %xmm12, %xmm2
	vmovdqa	%xmm12, %xmm13
	vpshufb	.LC5(%rip), %xmm2, %xmm2
	vpaddd	%xmm2, %xmm3, %xmm3
	vpxor	%xmm3, %xmm1, %xmm1
	vpshufd	$78, %xmm3, %xmm3
	vpslld	$7, %xmm1, %xmm5
	vpsrld	$25, %xmm1, %xmm8
	vpslld	$12, %xmm0, %xmm1
	vpsrld	$20, %xmm0, %xmm0
	vpxor	%xmm0, %xmm1, %xmm0
	vpxor	%xmm8, %xmm5, %xmm1
	vmovdqa	%xmm3, %xmm11
	vpshufd	$57, %xmm2, %xmm8
	vpaddd	%xmm0, %xmm6, %xmm14
	vpxor	%xmm10, %xmm14, %xmm4
	vmovdqa	%xmm14, %xmm15
	vpshufd	$147, %xmm1, %xmm1
	vpshufb	.LC5(%rip), %xmm4, %xmm4
	vmovdqa	%xmm1, %xmm6
	vpaddd	%xmm4, %xmm7, %xmm9
	vpxor	%xmm9, %xmm0, %xmm0
	vpshufd	$57, %xmm4, %xmm4
	vmovdqa	%xmm8, %xmm7
	vpslld	$7, %xmm0, %xmm10
	vpsrld	$25, %xmm0, %xmm0
	vpxor	%xmm0, %xmm10, %xmm0
	vpshufd	$78, %xmm9, %xmm10
	vmovdqa	%xmm4, %xmm5
	vpshufd	$147, %xmm0, %xmm0
	vmovdqa	%xmm10, %xmm9
	vmovdqa	%xmm0, %xmm2
	jne	.L53
	vmovdqa	%xmm8, %xmm6
	vpaddd	.LC6(%rip), %xmm4, %xmm4
	movq	%rdx, 128(%r12)
	vmovdqa	-64(%rbp), %xmm2
	movl	$96, %r14d
	vpaddd	.LC6(%rip), %xmm6, %xmm6
	movl	$96, %eax
	vmovdqa	-80(%rbp), %xmm7
	vpaddd	%xmm2, %xmm12, %xmm12
	vpaddd	%xmm2, %xmm14, %xmm14
	vmovdqa	-96(%rbp), %xmm5
	vpaddd	%xmm7, %xmm0, %xmm3
	vpaddd	%xmm7, %xmm1, %xmm1
	vpaddd	%xmm5, %xmm11, %xmm10
	vpaddd	.LC7(%rip), %xmm5, %xmm0
	vmovaps	%xmm12, (%r12)
	vpaddd	%xmm9, %xmm0, %xmm8
	vmovaps	%xmm1, 16(%r12)
	vmovaps	%xmm10, 32(%r12)
	vmovaps	%xmm6, 48(%r12)
	vmovaps	%xmm14, 64(%r12)
	vmovaps	%xmm3, 80(%r12)
	vmovaps	%xmm8, 96(%r12)
	vmovaps	%xmm4, 112(%r12)
	jmp	.L44
.L60:
	vpxor	%xmm9, %xmm9, %xmm9
	jmp	.L45
.L77:
	movl	$0, 144(%rdi)
	jmp	.L41
.L48:
	movl	%r8d, 148(%r12)
	xorl	%r14d, %r14d
.L50:
	movl	160(%r12), %edi
	movl	$32, %edx
	leaq	32(%r12,%r14), %rsi
	subq	%r14, %rdx
	call	read@PLT
	testq	%rax, %rax
	jle	.L49
	addq	%rax, %r14
	cmpq	$31, %r14
	jle	.L50
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L49:
	movl	156(%r12), %eax
	testl	%eax, %eax
	jne	.L57
	call	__errno_location@PLT
	movl	(%rax), %ebx
	movl	$-1, %eax
	movl	$1, 148(%r12)
	testl	%ebx, %ebx
	cmove	%eax, %ebx
.L51:
	vmovdqu	(%r12), %xmm1
	vmovdqu	32(%r12), %xmm0
	vinserti128	$0x1, 16(%r12), %ymm1, %ymm1
	vmovq	-64(%rbp), %xmm9
	vinserti128	$0x1, 48(%r12), %ymm0, %ymm0
	vpxor	%ymm1, %ymm0, %ymm0
	vmovups	%xmm0, (%r12)
	vextracti128	$0x1, %ymm0, 16(%r12)
	vzeroupper
	jmp	.L45
.L57:
	call	abort@PLT
	.cfi_endproc
.LFE4696:
	.size	crandom_generate, .-crandom_generate
	.section	.text.unlikely.crandom_generate
.LCOLDE8:
	.section	.text.crandom_generate
.LHOTE8:
	.section	.text.unlikely.crandom_destroy,"ax",@progbits
.LCOLDB9:
	.section	.text.crandom_destroy,"ax",@progbits
.LHOTB9:
	.p2align 4,,15
	.globl	crandom_destroy
	.hidden	crandom_destroy
	.type	crandom_destroy, @function
crandom_destroy:
.LFB4697:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movabsq	$8243122740751376436, %rax
	cmpq	%rax, 136(%rdi)
	movq	%rdi, %rbx
	je	.L88
.L81:
	leaq	176(%rbx), %rax
	movq	%rbx, %rdi
	.p2align 4,,10
	.p2align 3
.L82:
	movb	$0, (%rdi)
	addq	$1, %rdi
	cmpq	%rax, %rdi
	jne	.L82
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L88:
	.cfi_restore_state
	movl	160(%rdi), %edi
	testl	%edi, %edi
	je	.L81
	call	close@PLT
	jmp	.L81
	.cfi_endproc
.LFE4697:
	.size	crandom_destroy, .-crandom_destroy
	.section	.text.unlikely.crandom_destroy
.LCOLDE9:
	.section	.text.crandom_destroy
.LHOTE9:
	.hidden	crandom_features
	.globl	crandom_features
	.section	.bss.crandom_features,"aw",@nobits
	.align 4
	.type	crandom_features, @object
	.size	crandom_features, 4
crandom_features:
	.zero	4
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC3:
	.quad	3684054920433006693
	.quad	7719281312240119090
	.align 16
.LC4:
	.byte	2
	.byte	3
	.byte	0
	.byte	1
	.byte	6
	.byte	7
	.byte	4
	.byte	5
	.byte	10
	.byte	11
	.byte	8
	.byte	9
	.byte	14
	.byte	15
	.byte	12
	.byte	13
	.align 16
.LC5:
	.byte	3
	.byte	0
	.byte	1
	.byte	2
	.byte	7
	.byte	4
	.byte	5
	.byte	6
	.byte	11
	.byte	8
	.byte	9
	.byte	10
	.byte	15
	.byte	12
	.byte	13
	.byte	14
	.align 16
.LC6:
	.long	1634760805
	.long	857760878
	.long	2036477234
	.long	1797285236
	.align 16
.LC7:
	.long	0
	.long	0
	.long	1
	.long	0
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
