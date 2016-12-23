	.file	"ec_point.c"
	.section	.text.unlikely.add_tw_niels_to_tw_extensible,"ax",@progbits
.LCOLDB3:
	.section	.text.add_tw_niels_to_tw_extensible,"ax",@progbits
.LHOTB3:
	.p2align 4,,15
	.globl	add_tw_niels_to_tw_extensible
	.hidden	add_tw_niels_to_tw_extensible
	.type	add_tw_niels_to_tw_extensible, @function
add_tw_niels_to_tw_extensible:
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
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movq	%rsi, %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	leaq	64(%rdi), %r13
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, %rbx
	leaq	-144(%rbp), %r14
	leaq	-208(%rbp), %r15
	subq	$256, %rsp
	vmovdqa	.LC1(%rip), %ymm3
	vmovdqa	96(%rdi), %ymm0
	vmovdqa	.LC0(%rip), %ymm2
	vpsubq	32(%rdi), %ymm0, %ymm0
	vpaddq	%ymm3, %ymm0, %ymm0
	vmovdqa	%ymm0, -112(%rbp)
	movzbl	-81(%rbp), %esi
	vmovdqa	64(%rdi), %ymm1
	addq	%rsi, -112(%rbp)
	vmovdqa	%ymm2, -304(%rbp)
	vpsubq	(%rdi), %ymm1, %ymm1
	vpaddq	%ymm2, %ymm1, %ymm1
	vmovdqa	%ymm1, -144(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movabsq	$72057594037927935, %rax
	vmovdqa	%ymm3, -272(%rbp)
	movq	-128(%rbp), %rcx
	movq	%rax, %rdi
	andq	-120(%rbp), %rdi
	vmovdqu	-120(%rbp), %xmm0
	movq	%rcx, %rdx
	andq	%rax, %rcx
	vinserti128	$0x1, -104(%rbp), %ymm0, %ymm0
	shrq	$56, %rdx
	addq	%rdi, %rdx
	movq	%rdx, -120(%rbp)
	vpermq	$27, %ymm0, %ymm0
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, -112(%rbp), %ymm0
	vpand	.LC2(%rip), %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, -112(%rbp)
	movq	-136(%rbp), %rdx
	movq	%rdx, %rdi
	andq	%rax, %rdx
	shrq	$56, %rdi
	addq	%rdi, %rcx
	movq	%rcx, -128(%rbp)
	movq	-144(%rbp), %rcx
	movq	%rcx, %rdi
	andq	%rcx, %rax
	shrq	$56, %rdi
	addq	%rsi, %rax
	movq	%r12, %rsi
	addq	%rdi, %rdx
	movq	%r15, %rdi
	movq	%rax, -144(%rbp)
	movq	%rdx, -136(%rbp)
	movq	%r14, %rdx
	vzeroupper
	call	p448_mul@PLT
	vmovdqa	(%rbx), %ymm0
	leaq	64(%r12), %rsi
	movq	%r14, %rdx
	movq	%r13, %rdi
	vpaddq	64(%rbx), %ymm0, %ymm0
	vmovdqa	%ymm0, -144(%rbp)
	vmovdqa	32(%rbx), %ymm0
	vpaddq	96(%rbx), %ymm0, %ymm0
	vmovdqa	%ymm0, -112(%rbp)
	vzeroupper
	call	p448_mul@PLT
	leaq	192(%rbx), %rcx
	leaq	256(%rbx), %rax
	movq	%r14, %rdi
	movq	%rcx, %rdx
	movq	%rax, %rsi
	movq	%rcx, -224(%rbp)
	movq	%rax, -216(%rbp)
	call	p448_mul@PLT
	leaq	128(%r12), %rsi
	movq	%r14, %rdx
	movq	%rbx, %rdi
	call	p448_mul@PLT
	vmovdqa	-208(%rbp), %ymm5
	leaq	128(%rbx), %rdi
	movq	%r13, %rdx
	vmovdqa	64(%rbx), %ymm1
	movq	%r15, %rsi
	vmovdqa	-176(%rbp), %ymm4
	vpaddq	%ymm1, %ymm5, %ymm0
	vmovdqa	-304(%rbp), %ymm2
	vpsubq	%ymm5, %ymm1, %ymm1
	vmovdqa	-272(%rbp), %ymm3
	vmovdqa	%ymm0, 256(%rbx)
	vpaddq	%ymm2, %ymm1, %ymm1
	vmovdqa	96(%rbx), %ymm0
	vmovdqa	32(%rbx), %ymm5
	vpaddq	%ymm0, %ymm4, %ymm6
	vmovdqa	%ymm1, 192(%rbx)
	vpsubq	%ymm4, %ymm0, %ymm0
	vmovdqa	128(%rbx), %ymm1
	vpaddq	%ymm3, %ymm0, %ymm0
	vmovdqa	%ymm6, 288(%rbx)
	vmovdqa	%ymm0, 224(%rbx)
	vmovdqa	(%rbx), %ymm6
	vmovdqa	160(%rbx), %ymm0
	vpsubq	%ymm6, %ymm1, %ymm4
	vpaddq	%ymm6, %ymm1, %ymm1
	vpaddq	%ymm2, %ymm4, %ymm2
	vmovdqa	%ymm1, -208(%rbp)
	vmovdqa	%ymm2, 64(%rbx)
	vpsubq	%ymm5, %ymm0, %ymm2
	vpaddq	%ymm5, %ymm0, %ymm0
	vpaddq	%ymm3, %ymm2, %ymm3
	vmovdqa	%ymm0, -176(%rbp)
	vmovdqa	%ymm3, 96(%rbx)
	vzeroupper
	call	p448_mul@PLT
	movq	-224(%rbp), %rcx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	%rcx, %rdx
	call	p448_mul@PLT
	movq	-216(%rbp), %rax
	movq	%r15, %rsi
	movq	%r13, %rdi
	movq	%rax, %rdx
	call	p448_mul@PLT
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L6
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
.L6:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4659:
	.size	add_tw_niels_to_tw_extensible, .-add_tw_niels_to_tw_extensible
	.section	.text.unlikely.add_tw_niels_to_tw_extensible
.LCOLDE3:
	.section	.text.add_tw_niels_to_tw_extensible
.LHOTE3:
	.section	.text.unlikely.sub_tw_niels_from_tw_extensible,"ax",@progbits
.LCOLDB4:
	.section	.text.sub_tw_niels_from_tw_extensible,"ax",@progbits
.LHOTB4:
	.p2align 4,,15
	.globl	sub_tw_niels_from_tw_extensible
	.hidden	sub_tw_niels_from_tw_extensible
	.type	sub_tw_niels_from_tw_extensible, @function
sub_tw_niels_from_tw_extensible:
.LFB4660:
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
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	-144(%rbp), %r14
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	leaq	-208(%rbp), %r15
	leaq	64(%rdi), %r13
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, %rbx
	movq	%rsi, %r12
	subq	$256, %rsp
	addq	$64, %rsi
	movq	%r14, %rdx
	vmovdqa	96(%rdi), %ymm2
	vmovdqa	64(%rdi), %ymm0
	vmovdqa	.LC0(%rip), %ymm5
	vpsubq	32(%rdi), %ymm2, %ymm2
	vmovdqa	.LC1(%rip), %ymm4
	vpsubq	(%rdi), %ymm0, %ymm0
	movq	%r15, %rdi
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	vpaddq	%ymm5, %ymm0, %ymm0
	vpaddq	%ymm4, %ymm2, %ymm2
	vmovdqa	%ymm5, -304(%rbp)
	vmovdqa	%ymm0, -144(%rbp)
	vmovdqa	%ymm4, -272(%rbp)
	vmovdqa	%ymm2, -112(%rbp)
	vzeroupper
	call	p448_mul@PLT
	vmovdqa	(%rbx), %ymm0
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	vpaddq	64(%rbx), %ymm0, %ymm0
	vmovdqa	%ymm0, -144(%rbp)
	vmovdqa	32(%rbx), %ymm0
	vpaddq	96(%rbx), %ymm0, %ymm0
	vmovdqa	%ymm0, -112(%rbp)
	vzeroupper
	call	p448_mul@PLT
	leaq	192(%rbx), %rcx
	leaq	256(%rbx), %rax
	movq	%r14, %rdi
	movq	%rcx, %rdx
	movq	%rax, %rsi
	movq	%rcx, -224(%rbp)
	movq	%rax, -216(%rbp)
	call	p448_mul@PLT
	leaq	128(%r12), %rsi
	movq	%r14, %rdx
	movq	%rbx, %rdi
	call	p448_mul@PLT
	vmovdqa	-208(%rbp), %ymm1
	leaq	128(%rbx), %rdi
	movq	%r13, %rdx
	vmovdqa	64(%rbx), %ymm3
	movq	%r15, %rsi
	vmovdqa	-304(%rbp), %ymm5
	vpaddq	%ymm3, %ymm1, %ymm0
	vmovdqa	96(%rbx), %ymm2
	vpsubq	%ymm1, %ymm3, %ymm3
	vmovdqa	-272(%rbp), %ymm4
	vpaddq	%ymm5, %ymm3, %ymm3
	vmovdqa	128(%rbx), %ymm1
	vmovdqa	%ymm0, 256(%rbx)
	vmovdqa	%ymm3, 192(%rbx)
	vmovdqa	-176(%rbp), %ymm0
	vmovdqa	(%rbx), %ymm3
	vpaddq	%ymm2, %ymm0, %ymm6
	vpsubq	%ymm0, %ymm2, %ymm2
	vpaddq	%ymm4, %ymm2, %ymm2
	vpaddq	%ymm1, %ymm3, %ymm0
	vmovdqa	%ymm2, 224(%rbx)
	vpsubq	%ymm3, %ymm1, %ymm1
	vmovdqa	32(%rbx), %ymm2
	vpaddq	%ymm5, %ymm1, %ymm1
	vmovdqa	%ymm0, 64(%rbx)
	vmovdqa	160(%rbx), %ymm0
	vmovdqa	%ymm6, 288(%rbx)
	vmovdqa	%ymm1, -208(%rbp)
	vpaddq	%ymm0, %ymm2, %ymm6
	vpsubq	%ymm2, %ymm0, %ymm0
	vmovdqa	%ymm6, 96(%rbx)
	vpaddq	%ymm4, %ymm0, %ymm0
	vmovdqa	%ymm0, -176(%rbp)
	vzeroupper
	call	p448_mul@PLT
	movq	-224(%rbp), %rcx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	%rcx, %rdx
	call	p448_mul@PLT
	movq	-216(%rbp), %rax
	movq	%r15, %rsi
	movq	%r13, %rdi
	movq	%rax, %rdx
	call	p448_mul@PLT
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L11
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
.L11:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4660:
	.size	sub_tw_niels_from_tw_extensible, .-sub_tw_niels_from_tw_extensible
	.section	.text.unlikely.sub_tw_niels_from_tw_extensible
.LCOLDE4:
	.section	.text.sub_tw_niels_from_tw_extensible
.LHOTE4:
	.section	.text.unlikely.add_tw_pniels_to_tw_extensible,"ax",@progbits
.LCOLDB5:
	.section	.text.add_tw_pniels_to_tw_extensible,"ax",@progbits
.LHOTB5:
	.p2align 4,,15
	.globl	add_tw_pniels_to_tw_extensible
	.hidden	add_tw_pniels_to_tw_extensible
	.type	add_tw_pniels_to_tw_extensible, @function
add_tw_pniels_to_tw_extensible:
.LFB4661:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	leaq	192(%rsi), %rdx
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
	leaq	128(%rdi), %rbx
	movq	%rdi, %r12
	leaq	-144(%rbp), %rdi
	movq	%rsi, %r13
	subq	$112, %rsp
	movq	%rbx, %rsi
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_mul@PLT
	movq	-144(%rbp), %rax
	movq	%r13, %rsi
	movq	%r12, %rdi
	movq	%rax, 128(%r12)
	movq	-136(%rbp), %rax
	movq	%rax, 136(%r12)
	movq	-128(%rbp), %rax
	movq	%rax, 144(%r12)
	movq	-120(%rbp), %rax
	movq	%rax, 152(%r12)
	movq	-112(%rbp), %rax
	movq	%rax, 160(%r12)
	movq	-104(%rbp), %rax
	movq	%rax, 168(%r12)
	movq	-96(%rbp), %rax
	movq	%rax, 176(%r12)
	movq	-88(%rbp), %rax
	movq	%rax, 184(%r12)
	call	add_tw_niels_to_tw_extensible
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L16
	addq	$112, %rsp
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
	.size	add_tw_pniels_to_tw_extensible, .-add_tw_pniels_to_tw_extensible
	.section	.text.unlikely.add_tw_pniels_to_tw_extensible
.LCOLDE5:
	.section	.text.add_tw_pniels_to_tw_extensible
.LHOTE5:
	.section	.text.unlikely.sub_tw_pniels_from_tw_extensible,"ax",@progbits
.LCOLDB6:
	.section	.text.sub_tw_pniels_from_tw_extensible,"ax",@progbits
.LHOTB6:
	.p2align 4,,15
	.globl	sub_tw_pniels_from_tw_extensible
	.hidden	sub_tw_pniels_from_tw_extensible
	.type	sub_tw_pniels_from_tw_extensible, @function
sub_tw_pniels_from_tw_extensible:
.LFB4662:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	leaq	192(%rsi), %rdx
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
	leaq	128(%rdi), %rbx
	movq	%rdi, %r12
	leaq	-144(%rbp), %rdi
	movq	%rsi, %r13
	subq	$112, %rsp
	movq	%rbx, %rsi
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_mul@PLT
	movq	-144(%rbp), %rax
	movq	%r13, %rsi
	movq	%r12, %rdi
	movq	%rax, 128(%r12)
	movq	-136(%rbp), %rax
	movq	%rax, 136(%r12)
	movq	-128(%rbp), %rax
	movq	%rax, 144(%r12)
	movq	-120(%rbp), %rax
	movq	%rax, 152(%r12)
	movq	-112(%rbp), %rax
	movq	%rax, 160(%r12)
	movq	-104(%rbp), %rax
	movq	%rax, 168(%r12)
	movq	-96(%rbp), %rax
	movq	%rax, 176(%r12)
	movq	-88(%rbp), %rax
	movq	%rax, 184(%r12)
	call	sub_tw_niels_from_tw_extensible
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L21
	addq	$112, %rsp
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
.L21:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4662:
	.size	sub_tw_pniels_from_tw_extensible, .-sub_tw_pniels_from_tw_extensible
	.section	.text.unlikely.sub_tw_pniels_from_tw_extensible
.LCOLDE6:
	.section	.text.sub_tw_pniels_from_tw_extensible
.LHOTE6:
	.section	.text.unlikely.double_tw_extensible,"ax",@progbits
.LCOLDB9:
	.section	.text.double_tw_extensible,"ax",@progbits
.LHOTB9:
	.p2align 4,,15
	.globl	double_tw_extensible
	.hidden	double_tw_extensible
	.type	double_tw_extensible, @function
double_tw_extensible:
.LFB4663:
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
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	-272(%rbp), %r13
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, %rbx
	leaq	64(%rbx), %r14
	leaq	-144(%rbp), %rdi
	movq	%rbx, %rsi
	subq	$320, %rsp
	leaq	192(%rbx), %r15
	leaq	-208(%rbp), %r12
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_sqr@PLT
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	p448_sqr@PLT
	vmovdqa	-144(%rbp), %ymm0
	movq	%r15, %rsi
	movq	%r12, %rdi
	vpaddq	-272(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, 256(%rbx)
	vmovdqa	-112(%rbp), %ymm0
	vpaddq	-240(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, 288(%rbx)
	vmovdqa	64(%rbx), %ymm0
	vpaddq	(%rbx), %ymm0, %ymm0
	vmovdqa	%ymm0, 192(%rbx)
	vmovdqa	96(%rbx), %ymm0
	vpaddq	32(%rbx), %ymm0, %ymm0
	vmovdqa	%ymm0, 224(%rbx)
	vzeroupper
	call	p448_sqr@PLT
	vmovdqa	-176(%rbp), %ymm0
	leaq	128(%rbx), %rax
	movq	%rbx, %rdi
	vmovdqa	-208(%rbp), %ymm1
	vpsubq	288(%rbx), %ymm0, %ymm0
	vpaddq	.LC8(%rip), %ymm0, %ymm0
	vmovdqa	%ymm0, 224(%rbx)
	vpsubq	256(%rbx), %ymm1, %ymm1
	vmovdqa	-272(%rbp), %ymm0
	vpaddq	.LC7(%rip), %ymm1, %ymm1
	vmovdqa	%ymm1, 192(%rbx)
	movq	%rax, %rsi
	movq	%rax, -280(%rbp)
	vmovdqa	.LC0(%rip), %ymm1
	vpsubq	-144(%rbp), %ymm0, %ymm0
	vmovdqa	-240(%rbp), %ymm2
	vpaddq	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, -208(%rbp)
	vmovdqa	.LC1(%rip), %ymm0
	vpsubq	-112(%rbp), %ymm2, %ymm2
	vmovdqa	%ymm1, -368(%rbp)
	vpaddq	%ymm0, %ymm2, %ymm2
	vmovdqa	%ymm0, -336(%rbp)
	vmovdqa	%ymm2, -176(%rbp)
	vzeroupper
	call	p448_sqr@PLT
	movq	-280(%rbp), %rax
	movq	%r13, %rdx
	movq	%r12, %rsi
	vmovdqa	-368(%rbp), %ymm1
	vmovdqa	-336(%rbp), %ymm0
	movq	%rax, %rdi
	vpaddq	(%rbx), %ymm1, %ymm1
	vmovdqa	%ymm1, (%rbx)
	vpaddq	32(%rbx), %ymm0, %ymm0
	vpaddq	%ymm1, %ymm1, %ymm1
	vmovdqa	%ymm0, 32(%rbx)
	vmovdqa	%ymm1, 128(%rbx)
	vpaddq	%ymm0, %ymm0, %ymm0
	vpsubq	-208(%rbp), %ymm1, %ymm1
	vmovdqa	%ymm0, 160(%rbx)
	vpsubq	-176(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm1, -272(%rbp)
	vmovdqa	%ymm0, -240(%rbp)
	vzeroupper
	call	p448_mul@PLT
	movq	%r15, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	leaq	256(%rbx), %rdx
	movq	%r12, %rsi
	movq	%r14, %rdi
	call	p448_mul@PLT
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L26
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
.L26:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4663:
	.size	double_tw_extensible, .-double_tw_extensible
	.section	.text.unlikely.double_tw_extensible
.LCOLDE9:
	.section	.text.double_tw_extensible
.LHOTE9:
	.section	.text.unlikely.double_extensible,"ax",@progbits
.LCOLDB10:
	.section	.text.double_extensible,"ax",@progbits
.LHOTB10:
	.p2align 4,,15
	.globl	double_extensible
	.hidden	double_extensible
	.type	double_extensible, @function
double_extensible:
.LFB4664:
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
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	-272(%rbp), %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, %rbx
	leaq	64(%rbx), %r13
	leaq	-144(%rbp), %rdi
	movq	%rbx, %rsi
	subq	$320, %rsp
	leaq	256(%rbx), %r15
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_sqr@PLT
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	p448_sqr@PLT
	vmovdqa	-144(%rbp), %ymm0
	leaq	192(%rbx), %rax
	movq	%r15, %rdi
	vpaddq	-272(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -208(%rbp)
	movq	%rax, %rsi
	vmovdqa	-112(%rbp), %ymm0
	movq	%rax, -288(%rbp)
	vpaddq	-240(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -176(%rbp)
	vmovdqa	64(%rbx), %ymm0
	vpaddq	(%rbx), %ymm0, %ymm0
	vmovdqa	%ymm0, 192(%rbx)
	vmovdqa	96(%rbx), %ymm0
	vpaddq	32(%rbx), %ymm0, %ymm0
	vmovdqa	%ymm0, 224(%rbx)
	vzeroupper
	call	p448_sqr@PLT
	vmovdqa	288(%rbx), %ymm0
	leaq	128(%rbx), %rcx
	movq	%rbx, %rdi
	vmovdqa	256(%rbx), %ymm1
	vpsubq	-176(%rbp), %ymm0, %ymm0
	vpaddq	.LC8(%rip), %ymm0, %ymm0
	vmovdqa	%ymm0, 224(%rbx)
	vpsubq	-208(%rbp), %ymm1, %ymm1
	vmovdqa	-272(%rbp), %ymm0
	vpaddq	.LC7(%rip), %ymm1, %ymm1
	vmovdqa	%ymm1, 192(%rbx)
	movq	%rcx, %rsi
	movq	%rcx, -280(%rbp)
	vmovdqa	.LC0(%rip), %ymm1
	vpsubq	-144(%rbp), %ymm0, %ymm0
	vmovdqa	-240(%rbp), %ymm2
	vpaddq	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, 256(%rbx)
	vmovdqa	.LC1(%rip), %ymm0
	vpsubq	-112(%rbp), %ymm2, %ymm2
	vmovdqa	%ymm1, -368(%rbp)
	vpaddq	%ymm0, %ymm2, %ymm2
	vmovdqa	%ymm0, -336(%rbp)
	vmovdqa	%ymm2, 288(%rbx)
	vzeroupper
	leaq	-208(%rbp), %r14
	call	p448_sqr@PLT
	movq	-280(%rbp), %rcx
	movq	%r12, %rdx
	movq	%r14, %rsi
	vmovdqa	-368(%rbp), %ymm1
	vmovdqa	-336(%rbp), %ymm0
	movq	%rcx, %rdi
	vpaddq	(%rbx), %ymm1, %ymm1
	vmovdqa	%ymm1, (%rbx)
	vpaddq	32(%rbx), %ymm0, %ymm0
	vpaddq	%ymm1, %ymm1, %ymm1
	vmovdqa	%ymm0, 32(%rbx)
	vmovdqa	%ymm1, 128(%rbx)
	vpaddq	%ymm0, %ymm0, %ymm0
	vpsubq	-208(%rbp), %ymm1, %ymm1
	vmovdqa	%ymm0, 160(%rbx)
	vpsubq	-176(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm1, -272(%rbp)
	vmovdqa	%ymm0, -240(%rbp)
	vzeroupper
	call	p448_mul@PLT
	movq	-288(%rbp), %rax
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movq	%rax, %rdx
	call	p448_mul@PLT
	movq	%r15, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L31
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
.L31:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4664:
	.size	double_extensible, .-double_extensible
	.section	.text.unlikely.double_extensible
.LCOLDE10:
	.section	.text.double_extensible
.LHOTE10:
	.section	.text.unlikely.twist_and_double,"ax",@progbits
.LCOLDB11:
	.section	.text.twist_and_double,"ax",@progbits
.LHOTB11:
	.p2align 4,,15
	.globl	twist_and_double
	.hidden	twist_and_double
	.type	twist_and_double, @function
twist_and_double:
.LFB4665:
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
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movq	%rsi, %r13
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, %rbx
	movabsq	$72057594037927935, %r12
	leaq	192(%rbx), %r15
	leaq	-144(%rbp), %r14
	subq	$224, %rsp
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_sqr@PLT
	leaq	128(%rbx), %rcx
	leaq	64(%r13), %rsi
	movq	%rcx, %rdi
	movq	%rcx, -248(%rbp)
	call	p448_sqr@PLT
	vmovdqa	(%rbx), %ymm0
	movq	%r12, %rdi
	vmovdqa	.LC2(%rip), %ymm4
	vpaddq	128(%rbx), %ymm0, %ymm0
	vmovdqa	%ymm0, 256(%rbx)
	movq	272(%rbx), %rsi
	vmovdqa	32(%rbx), %ymm0
	andq	280(%rbx), %rdi
	vpaddq	160(%rbx), %ymm0, %ymm0
	vmovdqa	%ymm0, 288(%rbx)
	movzbl	319(%rbx), %edx
	addq	%rdx, 288(%rbx)
	movq	%rsi, %rax
	andq	%r12, %rsi
	shrq	$56, %rax
	addq	%rdi, %rax
	vmovdqu	280(%rbx), %xmm0
	movq	%rax, 280(%rbx)
	movq	264(%rbx), %rax
	vinserti128	$0x1, 296(%rbx), %ymm0, %ymm2
	movq	%rax, %rdi
	vpermq	$27, 288(%rbx), %ymm0
	shrq	$56, %rdi
	andq	%r12, %rax
	addq	%rdi, %rsi
	movq	%r12, %rdi
	movq	%rsi, 272(%rbx)
	movzbl	263(%rbx), %esi
	vpand	%ymm4, %ymm0, %ymm1
	vpermq	$27, %ymm2, %ymm0
	addq	%rsi, %rax
	movq	%rax, 264(%rbx)
	movq	%r12, %rax
	andq	256(%rbx), %rax
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	addq	%rax, %rdx
	vmovdqa	%ymm0, 288(%rbx)
	movq	%rdx, 256(%rbx)
	vmovdqa	64(%r13), %ymm0
	vpaddq	0(%r13), %ymm0, %ymm0
	vmovdqa	%ymm0, 192(%rbx)
	vmovdqa	96(%r13), %ymm0
	vpaddq	32(%r13), %ymm0, %ymm0
	vmovdqa	%ymm0, 224(%rbx)
	movzbl	255(%rbx), %edx
	addq	%rdx, 224(%rbx)
	vmovdqu	216(%rbx), %xmm0
	movq	208(%rbx), %rsi
	andq	216(%rbx), %rdi
	vinserti128	$0x1, 232(%rbx), %ymm0, %ymm2
	vmovdqa	%ymm4, -176(%rbp)
	movq	%rsi, %rax
	andq	%r12, %rsi
	shrq	$56, %rax
	vpermq	$27, 224(%rbx), %ymm0
	addq	%rdi, %rax
	movq	%rax, 216(%rbx)
	movq	200(%rbx), %rax
	movq	%rax, %rdi
	andq	%r12, %rax
	shrq	$56, %rdi
	vpand	%ymm4, %ymm0, %ymm1
	addq	%rdi, %rsi
	vpermq	$27, %ymm2, %ymm0
	movq	%rsi, 208(%rbx)
	movzbl	199(%rbx), %esi
	movq	%r14, %rdi
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	addq	%rsi, %rax
	movq	%r15, %rsi
	movq	%rax, 200(%rbx)
	movq	%r12, %rax
	andq	192(%rbx), %rax
	vmovdqa	%ymm0, 224(%rbx)
	addq	%rax, %rdx
	movq	%rdx, 192(%rbx)
	vzeroupper
	call	p448_sqr@PLT
	vmovdqa	.LC0(%rip), %ymm3
	movq	%r12, %rdi
	vmovdqa	-144(%rbp), %ymm1
	vmovdqa	.LC1(%rip), %ymm6
	vmovdqa	-112(%rbp), %ymm0
	vpsubq	256(%rbx), %ymm1, %ymm1
	vpaddq	%ymm3, %ymm1, %ymm1
	vmovdqa	%ymm1, 192(%rbx)
	movq	208(%rbx), %rsi
	andq	216(%rbx), %rdi
	vpsubq	288(%rbx), %ymm0, %ymm0
	vpaddq	%ymm6, %ymm0, %ymm0
	vmovdqa	%ymm0, 224(%rbx)
	movzbl	255(%rbx), %edx
	vmovdqa	%ymm3, -240(%rbp)
	addq	%rdx, 224(%rbx)
	movq	%rsi, %rax
	andq	%r12, %rsi
	shrq	$56, %rax
	vmovdqa	-176(%rbp), %ymm4
	addq	%rdi, %rax
	vmovdqa	%ymm6, -208(%rbp)
	vmovdqu	216(%rbx), %xmm0
	movq	%rax, 216(%rbx)
	movq	200(%rbx), %rax
	vinserti128	$0x1, 232(%rbx), %ymm0, %ymm2
	movq	%rax, %rdi
	vpermq	$27, 224(%rbx), %ymm0
	shrq	$56, %rdi
	andq	%r12, %rax
	addq	%rdi, %rsi
	movq	%r12, %rdi
	movq	%rsi, 208(%rbx)
	movzbl	199(%rbx), %esi
	vpand	%ymm4, %ymm0, %ymm1
	vpermq	$27, %ymm2, %ymm0
	addq	%rsi, %rax
	movq	%rax, 200(%rbx)
	movq	%r12, %rax
	andq	192(%rbx), %rax
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vpsubq	(%rbx), %ymm3, %ymm1
	vpaddq	128(%rbx), %ymm1, %ymm1
	vmovdqa	%ymm1, -144(%rbp)
	vmovdqa	%ymm0, 224(%rbx)
	addq	%rax, %rdx
	vmovdqa	160(%rbx), %ymm0
	movq	%rdx, 192(%rbx)
	vpsubq	32(%rbx), %ymm0, %ymm0
	vpaddq	%ymm6, %ymm0, %ymm0
	vmovdqa	%ymm0, -112(%rbp)
	movq	-128(%rbp), %rax
	movzbl	-81(%rbp), %edx
	andq	-120(%rbp), %rdi
	addq	%rdx, -112(%rbp)
	movq	%rax, %rsi
	andq	%r12, %rax
	shrq	$56, %rsi
	addq	%rdi, %rsi
	vmovdqu	-120(%rbp), %xmm1
	movq	%rsi, -120(%rbp)
	movq	-136(%rbp), %rsi
	vinserti128	$0x1, -104(%rbp), %ymm1, %ymm2
	movq	%rsi, %rdi
	vpermq	$27, -112(%rbp), %ymm1
	shrq	$56, %rdi
	andq	%r12, %rsi
	addq	%rdi, %rax
	movq	%rax, -128(%rbp)
	movq	-144(%rbp), %rax
	vpand	%ymm4, %ymm1, %ymm0
	vpermq	$27, %ymm2, %ymm1
	movq	%rax, %rdi
	andq	%r12, %rax
	shrq	$56, %rdi
	addq	%rax, %rdx
	addq	%rdi, %rsi
	movq	%rbx, %rdi
	movq	%rdx, -144(%rbp)
	vpsrlq	$56, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm0, %ymm1
	vpermq	$27, %ymm1, %ymm1
	movq	%rsi, -136(%rbp)
	leaq	128(%r13), %rsi
	vmovdqa	%ymm1, -112(%rbp)
	vzeroupper
	leaq	64(%rbx), %r13
	call	p448_sqr@PLT
	vmovdqa	(%rbx), %ymm0
	movq	%r12, %rdi
	vmovdqa	-176(%rbp), %ymm4
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, 128(%rbx)
	movq	144(%rbx), %rdx
	vmovdqa	32(%rbx), %ymm0
	andq	152(%rbx), %rdi
	vmovdqa	-208(%rbp), %ymm6
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, 160(%rbx)
	movzbl	191(%rbx), %esi
	addq	%rsi, 160(%rbx)
	movq	%rdx, %rax
	andq	%r12, %rdx
	shrq	$56, %rax
	vmovdqa	-240(%rbp), %ymm3
	addq	%rdi, %rax
	vpsubq	256(%rbx), %ymm3, %ymm3
	vmovdqu	152(%rbx), %xmm1
	movq	%rax, 152(%rbx)
	movq	136(%rbx), %rax
	vinserti128	$0x1, 168(%rbx), %ymm1, %ymm5
	movq	%rax, %rdi
	vpermq	$27, 160(%rbx), %ymm1
	shrq	$56, %rdi
	andq	%r12, %rax
	addq	%rdi, %rdx
	movq	%r12, %rdi
	movq	%rdx, 144(%rbx)
	movzbl	135(%rbx), %edx
	vpand	%ymm4, %ymm1, %ymm2
	vpermq	$27, %ymm5, %ymm1
	addq	%rdx, %rax
	movq	%rax, 136(%rbx)
	movq	%r12, %rax
	andq	128(%rbx), %rax
	vpsrlq	$56, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm2, %ymm1
	vpermq	$27, %ymm1, %ymm0
	vmovdqa	%ymm0, 160(%rbx)
	vpsubq	288(%rbx), %ymm0, %ymm0
	vpaddq	%ymm6, %ymm0, %ymm0
	vmovdqa	%ymm0, 96(%rbx)
	movzbl	127(%rbx), %edx
	addq	%rax, %rsi
	addq	%rdx, 96(%rbx)
	movq	%rsi, 128(%rbx)
	vpaddq	128(%rbx), %ymm3, %ymm3
	vmovdqa	%ymm3, 64(%rbx)
	vmovdqu	88(%rbx), %xmm1
	vinserti128	$0x1, 104(%rbx), %ymm1, %ymm1
	movq	80(%rbx), %rsi
	andq	88(%rbx), %rdi
	movq	-248(%rbp), %rcx
	movq	%rsi, %rax
	andq	%r12, %rsi
	vpermq	$27, %ymm1, %ymm0
	shrq	$56, %rax
	addq	%rdi, %rax
	movq	%rax, 88(%rbx)
	movq	72(%rbx), %rax
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, 96(%rbx), %ymm0
	movq	%rax, %rdi
	andq	%r12, %rax
	andq	64(%rbx), %r12
	shrq	$56, %rdi
	addq	%rdi, %rsi
	movq	%rcx, %rdi
	vpand	%ymm4, %ymm0, %ymm0
	movq	%rsi, 80(%rbx)
	movzbl	71(%rbx), %esi
	addq	%rdx, %r12
	movq	%r13, %rdx
	movq	%r12, 64(%rbx)
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	addq	%rsi, %rax
	movq	%r14, %rsi
	movq	%rax, 72(%rbx)
	vmovdqa	%ymm0, 96(%rbx)
	vzeroupper
	call	p448_mul@PLT
	movq	%r15, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	leaq	256(%rbx), %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L36
	addq	$224, %rsp
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
.L36:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4665:
	.size	twist_and_double, .-twist_and_double
	.section	.text.unlikely.twist_and_double
.LCOLDE11:
	.section	.text.twist_and_double
.LHOTE11:
	.section	.text.unlikely.untwist_and_double,"ax",@progbits
.LCOLDB12:
	.section	.text.untwist_and_double,"ax",@progbits
.LHOTB12:
	.p2align 4,,15
	.globl	untwist_and_double
	.hidden	untwist_and_double
	.type	untwist_and_double, @function
untwist_and_double:
.LFB4666:
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
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movq	%rsi, %r13
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, %rbx
	movabsq	$72057594037927935, %r12
	leaq	192(%rbx), %r15
	leaq	256(%rbx), %r14
	subq	$224, %rsp
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_sqr@PLT
	leaq	128(%rbx), %rcx
	leaq	64(%r13), %rsi
	movq	%rcx, %rdi
	movq	%rcx, -248(%rbp)
	call	p448_sqr@PLT
	vmovdqa	(%rbx), %ymm0
	movq	%r12, %rdi
	vmovdqa	.LC2(%rip), %ymm4
	vpaddq	128(%rbx), %ymm0, %ymm0
	vmovdqa	%ymm0, -144(%rbp)
	movq	-128(%rbp), %rdx
	vmovdqa	32(%rbx), %ymm0
	andq	-120(%rbp), %rdi
	vpaddq	160(%rbx), %ymm0, %ymm0
	vmovdqa	%ymm0, -112(%rbp)
	movzbl	-81(%rbp), %eax
	addq	%rax, -112(%rbp)
	movq	%rdx, %rsi
	andq	%r12, %rdx
	shrq	$56, %rsi
	addq	%rdi, %rsi
	vmovdqu	-120(%rbp), %xmm0
	movq	%rsi, -120(%rbp)
	movq	-136(%rbp), %rsi
	vinserti128	$0x1, -104(%rbp), %ymm0, %ymm2
	vpermq	$27, -112(%rbp), %ymm0
	movq	%rsi, %rdi
	shrq	$56, %rdi
	andq	%r12, %rsi
	addq	%rdi, %rdx
	movq	%rdx, -128(%rbp)
	movq	-144(%rbp), %rdx
	vpand	%ymm4, %ymm0, %ymm1
	vpermq	$27, %ymm2, %ymm0
	movq	%rdx, %rdi
	andq	%r12, %rdx
	addq	%rdx, %rax
	shrq	$56, %rdi
	addq	%rdi, %rsi
	movq	%rax, -144(%rbp)
	movq	%r12, %rdi
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	movq	%rsi, -136(%rbp)
	vmovdqa	%ymm0, -112(%rbp)
	vmovdqa	64(%r13), %ymm0
	vpaddq	0(%r13), %ymm0, %ymm0
	vmovdqa	%ymm0, 192(%rbx)
	vmovdqa	96(%r13), %ymm0
	vpaddq	32(%r13), %ymm0, %ymm0
	vmovdqa	%ymm0, 224(%rbx)
	movzbl	255(%rbx), %edx
	addq	%rdx, 224(%rbx)
	vmovdqu	216(%rbx), %xmm0
	vinserti128	$0x1, 232(%rbx), %ymm0, %ymm2
	vmovdqa	%ymm4, -176(%rbp)
	movq	208(%rbx), %rsi
	andq	216(%rbx), %rdi
	vpermq	$27, 224(%rbx), %ymm0
	movq	%rsi, %rax
	andq	%r12, %rsi
	shrq	$56, %rax
	addq	%rdi, %rax
	movq	%rax, 216(%rbx)
	movq	200(%rbx), %rax
	vpand	%ymm4, %ymm0, %ymm1
	vpermq	$27, %ymm2, %ymm0
	movq	%rax, %rdi
	andq	%r12, %rax
	shrq	$56, %rdi
	addq	%rdi, %rsi
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	movq	%rsi, 208(%rbx)
	movzbl	199(%rbx), %esi
	movq	%r14, %rdi
	vpermq	$27, %ymm0, %ymm0
	addq	%rsi, %rax
	movq	%r15, %rsi
	vmovdqa	%ymm0, 224(%rbx)
	movq	%rax, 200(%rbx)
	movq	%r12, %rax
	andq	192(%rbx), %rax
	addq	%rax, %rdx
	movq	%rdx, 192(%rbx)
	vzeroupper
	call	p448_sqr@PLT
	vmovdqa	.LC0(%rip), %ymm3
	movq	%r12, %rdi
	vmovdqa	256(%rbx), %ymm1
	vmovdqa	.LC1(%rip), %ymm5
	vmovdqa	288(%rbx), %ymm0
	vpsubq	-144(%rbp), %ymm1, %ymm1
	vpaddq	%ymm3, %ymm1, %ymm1
	vmovdqa	%ymm1, 192(%rbx)
	movq	208(%rbx), %rsi
	andq	216(%rbx), %rdi
	vpsubq	-112(%rbp), %ymm0, %ymm0
	vpaddq	%ymm5, %ymm0, %ymm0
	vmovdqa	%ymm0, 224(%rbx)
	movzbl	255(%rbx), %edx
	vmovdqa	%ymm3, -240(%rbp)
	addq	%rdx, 224(%rbx)
	movq	%rsi, %rax
	andq	%r12, %rsi
	shrq	$56, %rax
	vmovdqa	-176(%rbp), %ymm4
	addq	%rdi, %rax
	vmovdqa	%ymm5, -208(%rbp)
	vmovdqu	216(%rbx), %xmm0
	movq	%rax, 216(%rbx)
	movq	200(%rbx), %rax
	vinserti128	$0x1, 232(%rbx), %ymm0, %ymm2
	movq	%rax, %rdi
	vpermq	$27, 224(%rbx), %ymm0
	shrq	$56, %rdi
	andq	%r12, %rax
	addq	%rdi, %rsi
	movq	%r12, %rdi
	movq	%rsi, 208(%rbx)
	movzbl	199(%rbx), %esi
	vpand	%ymm4, %ymm0, %ymm1
	vpermq	$27, %ymm2, %ymm0
	addq	%rsi, %rax
	movq	%rax, 200(%rbx)
	movq	%r12, %rax
	andq	192(%rbx), %rax
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vpsubq	(%rbx), %ymm3, %ymm1
	vpaddq	128(%rbx), %ymm1, %ymm1
	vmovdqa	%ymm1, 256(%rbx)
	vmovdqa	%ymm0, 224(%rbx)
	addq	%rax, %rdx
	vmovdqa	160(%rbx), %ymm0
	movq	%rdx, 192(%rbx)
	vpsubq	32(%rbx), %ymm0, %ymm0
	vpaddq	%ymm5, %ymm0, %ymm0
	vmovdqa	%ymm0, 288(%rbx)
	movq	272(%rbx), %rdx
	movzbl	319(%rbx), %esi
	andq	280(%rbx), %rdi
	addq	%rsi, 288(%rbx)
	movq	%rdx, %rax
	andq	%r12, %rdx
	shrq	$56, %rax
	addq	%rdi, %rax
	vmovdqu	280(%rbx), %xmm1
	movq	%rax, 280(%rbx)
	movq	264(%rbx), %rax
	vinserti128	$0x1, 296(%rbx), %ymm1, %ymm0
	movq	%rax, %rdi
	vpermq	$27, 288(%rbx), %ymm1
	shrq	$56, %rdi
	andq	%r12, %rax
	addq	%rdi, %rdx
	movq	%rbx, %rdi
	movq	%rdx, 272(%rbx)
	movzbl	263(%rbx), %edx
	vpand	%ymm4, %ymm1, %ymm2
	vpermq	$27, %ymm0, %ymm1
	addq	%rdx, %rax
	movq	%rax, 264(%rbx)
	movq	%r12, %rax
	andq	256(%rbx), %rax
	vpsrlq	$56, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm2, %ymm1
	vpermq	$27, %ymm1, %ymm1
	addq	%rax, %rsi
	vmovdqa	%ymm1, 288(%rbx)
	movq	%rsi, 256(%rbx)
	leaq	128(%r13), %rsi
	vzeroupper
	call	p448_sqr@PLT
	vmovdqa	(%rbx), %ymm0
	movq	%r12, %rdi
	leaq	64(%rbx), %r13
	vmovdqa	-176(%rbp), %ymm4
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, 128(%rbx)
	movq	144(%rbx), %rdx
	vmovdqa	32(%rbx), %ymm0
	andq	152(%rbx), %rdi
	vmovdqa	-208(%rbp), %ymm5
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, 160(%rbx)
	movzbl	191(%rbx), %esi
	addq	%rsi, 160(%rbx)
	movq	%rdx, %rax
	andq	%r12, %rdx
	shrq	$56, %rax
	vmovdqa	-240(%rbp), %ymm3
	addq	%rdi, %rax
	vpsubq	256(%rbx), %ymm3, %ymm3
	vmovdqu	152(%rbx), %xmm1
	movq	%rax, 152(%rbx)
	movq	136(%rbx), %rax
	vinserti128	$0x1, 168(%rbx), %ymm1, %ymm1
	vpermq	$27, 160(%rbx), %ymm0
	movq	%rax, %rdi
	shrq	$56, %rdi
	andq	%r12, %rax
	addq	%rdi, %rdx
	movq	%r12, %rdi
	movq	%rdx, 144(%rbx)
	movzbl	135(%rbx), %edx
	vpermq	$27, %ymm1, %ymm1
	vpand	%ymm4, %ymm0, %ymm0
	addq	%rdx, %rax
	vpsrlq	$56, %ymm1, %ymm2
	movq	%rax, 136(%rbx)
	vpaddq	%ymm0, %ymm2, %ymm1
	movq	%r12, %rax
	vpermq	$27, %ymm1, %ymm0
	andq	128(%rbx), %rax
	vmovdqa	%ymm0, 160(%rbx)
	vpsubq	288(%rbx), %ymm0, %ymm0
	vpaddq	%ymm5, %ymm0, %ymm0
	vmovdqa	%ymm0, 96(%rbx)
	movzbl	127(%rbx), %edx
	addq	%rax, %rsi
	addq	%rdx, 96(%rbx)
	movq	%rsi, 128(%rbx)
	vpaddq	128(%rbx), %ymm3, %ymm3
	vmovdqa	%ymm3, 64(%rbx)
	vmovdqu	88(%rbx), %xmm1
	vinserti128	$0x1, 104(%rbx), %ymm1, %ymm1
	movq	80(%rbx), %rsi
	andq	88(%rbx), %rdi
	movq	-248(%rbp), %rcx
	movq	%rsi, %rax
	andq	%r12, %rsi
	vpermq	$27, %ymm1, %ymm0
	shrq	$56, %rax
	addq	%rdi, %rax
	movq	%rax, 88(%rbx)
	movq	72(%rbx), %rax
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, 96(%rbx), %ymm0
	movq	%rax, %rdi
	andq	%r12, %rax
	andq	64(%rbx), %r12
	shrq	$56, %rdi
	addq	%rdi, %rsi
	movq	%rcx, %rdi
	vpand	%ymm4, %ymm0, %ymm0
	movq	%rsi, 80(%rbx)
	movzbl	71(%rbx), %esi
	addq	%rdx, %r12
	movq	%r13, %rdx
	movq	%r12, 64(%rbx)
	leaq	-144(%rbp), %r12
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	addq	%rsi, %rax
	movq	%r12, %rsi
	movq	%rax, 72(%rbx)
	vmovdqa	%ymm0, 96(%rbx)
	vzeroupper
	call	p448_mul@PLT
	movq	%r15, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L41
	addq	$224, %rsp
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
.L41:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4666:
	.size	untwist_and_double, .-untwist_and_double
	.section	.text.unlikely.untwist_and_double
.LCOLDE12:
	.section	.text.untwist_and_double
.LHOTE12:
	.section	.text.unlikely.convert_tw_affine_to_tw_pniels,"ax",@progbits
.LCOLDB13:
	.section	.text.convert_tw_affine_to_tw_pniels,"ax",@progbits
.LHOTB13:
	.p2align 4,,15
	.globl	convert_tw_affine_to_tw_pniels
	.hidden	convert_tw_affine_to_tw_pniels
	.type	convert_tw_affine_to_tw_pniels, @function
convert_tw_affine_to_tw_pniels:
.LFB4667:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movq	%rsi, %rdx
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
	movabsq	$72057594037927935, %r12
	.cfi_escape 0x10,0x3,0x2,0x76,0x60
	movq	%rdi, %rbx
	subq	$112, %rsp
	leaq	192(%rbx), %r13
	vmovdqa	64(%rsi), %ymm0
	vmovdqa	.LC0(%rip), %ymm6
	vpsubq	(%rsi), %ymm0, %ymm0
	vmovdqa	%ymm0, (%rdi)
	vmovdqa	.LC1(%rip), %ymm5
	vpaddq	%ymm6, %ymm0, %ymm0
	vmovdqa	96(%rsi), %ymm1
	vmovdqa	.LC2(%rip), %ymm4
	vpsubq	32(%rsi), %ymm1, %ymm1
	vmovdqa	%ymm0, (%rdi)
	vpaddq	%ymm5, %ymm1, %ymm0
	vmovdqa	%ymm0, 32(%rdi)
	movzbl	63(%rdi), %ecx
	movq	16(%rdi), %rsi
	addq	%rcx, 32(%rdi)
	vmovdqa	%ymm6, -144(%rbp)
	vmovdqa	%ymm5, -112(%rbp)
	movq	%rsi, %rax
	andq	%r12, %rsi
	shrq	$56, %rax
	vmovdqu	24(%rdi), %xmm2
	vinserti128	$0x1, 40(%rdi), %ymm2, %ymm0
	vpermq	$27, 32(%rdi), %ymm2
	vpand	%ymm4, %ymm2, %ymm3
	vpermq	$27, %ymm0, %ymm2
	vpsrlq	$56, %ymm2, %ymm2
	vpaddq	%ymm2, %ymm3, %ymm2
	vpermq	$27, %ymm2, %ymm2
	vmovdqa	%ymm2, 32(%rdi)
	movq	%r12, %rdi
	andq	24(%rbx), %rdi
	addq	%rdi, %rax
	movq	%rax, 24(%rbx)
	movq	8(%rbx), %rax
	movq	%rax, %rdi
	andq	%r12, %rax
	shrq	$56, %rdi
	addq	%rdi, %rsi
	movl	$56, %edi
	movq	%rsi, 16(%rbx)
	shrx	%rdi, (%rbx), %rsi
	movq	%r12, %rdi
	vmovdqa	%ymm4, -80(%rbp)
	addq	%rsi, %rax
	movq	%rax, 8(%rbx)
	movq	%r12, %rax
	andq	(%rbx), %rax
	addq	%rax, %rcx
	movq	%rcx, (%rbx)
	vmovdqa	(%rdx), %ymm0
	vpaddq	64(%rdx), %ymm0, %ymm0
	vmovdqa	%ymm0, 64(%rbx)
	movq	80(%rbx), %rsi
	andq	88(%rbx), %rdi
	vmovdqa	32(%rdx), %ymm0
	movq	%rsi, %rax
	andq	%r12, %rsi
	vpaddq	96(%rdx), %ymm0, %ymm0
	vmovdqa	%ymm0, 96(%rbx)
	movzbl	127(%rbx), %ecx
	addq	%rcx, 96(%rbx)
	shrq	$56, %rax
	addq	%rdi, %rax
	vmovdqu	88(%rbx), %xmm0
	movq	%rax, 88(%rbx)
	movq	72(%rbx), %rax
	vinserti128	$0x1, 104(%rbx), %ymm0, %ymm0
	movq	%rax, %rdi
	andq	%r12, %rax
	shrq	$56, %rdi
	addq	%rdi, %rsi
	movq	%r13, %rdi
	vpermq	$27, %ymm0, %ymm0
	movq	%rsi, 80(%rbx)
	movzbl	71(%rbx), %esi
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, 96(%rbx), %ymm0
	addq	%rsi, %rax
	leaq	64(%rdx), %rsi
	movq	%rax, 72(%rbx)
	movq	%r12, %rax
	andq	64(%rbx), %rax
	vpand	%ymm4, %ymm0, %ymm0
	addq	%rax, %rcx
	movq	%rcx, 64(%rbx)
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, 96(%rbx)
	vzeroupper
	call	p448_mul@PLT
	leaq	128(%rbx), %rdi
	movq	%r13, %rsi
	movl	$78164, %edx
	call	p448_mulw@PLT
	vmovdqa	160(%rbx), %ymm0
	movq	%r12, %rsi
	leaq	208(%rbx), %rdi
	vmovdqa	-112(%rbp), %ymm5
	movq	$2, 192(%rbx)
	vmovdqa	-144(%rbp), %ymm6
	andq	$-8, %rdi
	vpsubq	%ymm0, %ymm5, %ymm5
	vmovdqa	%ymm5, 160(%rbx)
	movzbl	191(%rbx), %edx
	vpsubq	128(%rbx), %ymm6, %ymm6
	addq	%rdx, 160(%rbx)
	vmovdqa	%ymm6, 128(%rbx)
	movq	144(%rbx), %rcx
	andq	152(%rbx), %rsi
	vmovdqa	-80(%rbp), %ymm4
	movq	%rcx, %rax
	andq	%r12, %rcx
	movq	$0, 200(%rbx)
	vmovdqu	152(%rbx), %xmm0
	shrq	$56, %rax
	addq	%rsi, %rax
	vpermq	$27, 160(%rbx), %ymm1
	movq	%rax, 152(%rbx)
	movq	136(%rbx), %rax
	vinserti128	$0x1, 168(%rbx), %ymm0, %ymm0
	movq	$0, 248(%rbx)
	movq	%rax, %rsi
	andq	%r12, %rax
	andq	128(%rbx), %r12
	shrq	$56, %rsi
	vpand	%ymm4, %ymm1, %ymm1
	addq	%rsi, %rcx
	vpermq	$27, %ymm0, %ymm0
	movq	%rcx, 144(%rbx)
	movzbl	135(%rbx), %ecx
	addq	%rdx, %r12
	movq	%r12, 128(%rbx)
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	addq	%rcx, %rax
	movq	%rax, 136(%rbx)
	xorl	%eax, %eax
	vmovdqa	%ymm0, 160(%rbx)
	subl	%edi, %ebx
	leal	256(%rbx), %ecx
	shrl	$3, %ecx
	rep stosq
	vzeroupper
	addq	$112, %rsp
	popq	%rbx
	popq	%r10
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4667:
	.size	convert_tw_affine_to_tw_pniels, .-convert_tw_affine_to_tw_pniels
	.section	.text.unlikely.convert_tw_affine_to_tw_pniels
.LCOLDE13:
	.section	.text.convert_tw_affine_to_tw_pniels
.LHOTE13:
	.section	.text.unlikely.convert_tw_affine_to_tw_extensible,"ax",@progbits
.LCOLDB14:
	.section	.text.convert_tw_affine_to_tw_extensible,"ax",@progbits
.LHOTB14:
	.p2align 4,,15
	.globl	convert_tw_affine_to_tw_extensible
	.hidden	convert_tw_affine_to_tw_extensible
	.type	convert_tw_affine_to_tw_extensible, @function
convert_tw_affine_to_tw_extensible:
.LFB4668:
	.cfi_startproc
	movq	(%rsi), %rax
	movq	%rdi, %rdx
	leaq	144(%rdi), %rdi
	movq	%rax, -144(%rdi)
	movq	8(%rsi), %rax
	movq	%rax, -136(%rdi)
	movq	16(%rsi), %rax
	movq	%rax, -128(%rdi)
	movq	24(%rsi), %rax
	movq	%rax, -120(%rdi)
	movq	32(%rsi), %rax
	movq	%rax, -112(%rdi)
	movq	40(%rsi), %rax
	movq	%rax, -104(%rdi)
	movq	48(%rsi), %rax
	movq	%rax, -96(%rdi)
	movq	56(%rsi), %rax
	movq	%rax, -88(%rdi)
	movq	64(%rsi), %rcx
	movl	%edx, %eax
	movq	%rcx, -80(%rdi)
	movq	72(%rsi), %rcx
	movq	%rcx, -72(%rdi)
	movq	80(%rsi), %rcx
	movq	%rcx, -64(%rdi)
	movq	88(%rsi), %rcx
	movq	%rcx, -56(%rdi)
	movq	96(%rsi), %rcx
	movq	%rcx, -48(%rdi)
	movq	104(%rsi), %rcx
	movq	%rcx, -40(%rdi)
	movq	112(%rsi), %rcx
	movq	%rcx, -32(%rdi)
	movq	120(%rsi), %rcx
	movq	%rcx, -24(%rdi)
	movq	$1, -16(%rdi)
	movq	$0, -8(%rdi)
	movq	$0, 40(%rdi)
	andq	$-8, %rdi
	subl	%edi, %eax
	leal	192(%rax), %ecx
	xorl	%eax, %eax
	shrl	$3, %ecx
	rep stosq
	movq	(%rsi), %rax
	movq	%rax, 192(%rdx)
	movq	8(%rsi), %rax
	movq	%rax, 200(%rdx)
	movq	16(%rsi), %rax
	movq	%rax, 208(%rdx)
	movq	24(%rsi), %rax
	movq	%rax, 216(%rdx)
	movq	32(%rsi), %rax
	movq	%rax, 224(%rdx)
	movq	40(%rsi), %rax
	movq	%rax, 232(%rdx)
	movq	48(%rsi), %rax
	movq	%rax, 240(%rdx)
	movq	56(%rsi), %rax
	movq	%rax, 248(%rdx)
	movq	64(%rsi), %rcx
	leaq	256(%rdx), %rax
	movq	%rcx, 256(%rdx)
	movq	72(%rsi), %rdx
	movq	%rdx, 8(%rax)
	movq	80(%rsi), %rdx
	movq	%rdx, 16(%rax)
	movq	88(%rsi), %rdx
	movq	%rdx, 24(%rax)
	movq	96(%rsi), %rdx
	movq	%rdx, 32(%rax)
	movq	104(%rsi), %rdx
	movq	%rdx, 40(%rax)
	movq	112(%rsi), %rdx
	movq	%rdx, 48(%rax)
	movq	120(%rsi), %rdx
	movq	%rdx, 56(%rax)
	ret
	.cfi_endproc
.LFE4668:
	.size	convert_tw_affine_to_tw_extensible, .-convert_tw_affine_to_tw_extensible
	.section	.text.unlikely.convert_tw_affine_to_tw_extensible
.LCOLDE14:
	.section	.text.convert_tw_affine_to_tw_extensible
.LHOTE14:
	.section	.text.unlikely.convert_affine_to_extensible,"ax",@progbits
.LCOLDB15:
	.section	.text.convert_affine_to_extensible,"ax",@progbits
.LHOTB15:
	.p2align 4,,15
	.globl	convert_affine_to_extensible
	.hidden	convert_affine_to_extensible
	.type	convert_affine_to_extensible, @function
convert_affine_to_extensible:
.LFB4669:
	.cfi_startproc
	movq	(%rsi), %rax
	movq	%rdi, %rdx
	leaq	144(%rdi), %rdi
	movq	%rax, -144(%rdi)
	movq	8(%rsi), %rax
	movq	%rax, -136(%rdi)
	movq	16(%rsi), %rax
	movq	%rax, -128(%rdi)
	movq	24(%rsi), %rax
	movq	%rax, -120(%rdi)
	movq	32(%rsi), %rax
	movq	%rax, -112(%rdi)
	movq	40(%rsi), %rax
	movq	%rax, -104(%rdi)
	movq	48(%rsi), %rax
	movq	%rax, -96(%rdi)
	movq	56(%rsi), %rax
	movq	%rax, -88(%rdi)
	movq	64(%rsi), %rcx
	movl	%edx, %eax
	movq	%rcx, -80(%rdi)
	movq	72(%rsi), %rcx
	movq	%rcx, -72(%rdi)
	movq	80(%rsi), %rcx
	movq	%rcx, -64(%rdi)
	movq	88(%rsi), %rcx
	movq	%rcx, -56(%rdi)
	movq	96(%rsi), %rcx
	movq	%rcx, -48(%rdi)
	movq	104(%rsi), %rcx
	movq	%rcx, -40(%rdi)
	movq	112(%rsi), %rcx
	movq	%rcx, -32(%rdi)
	movq	120(%rsi), %rcx
	movq	%rcx, -24(%rdi)
	movq	$1, -16(%rdi)
	movq	$0, -8(%rdi)
	movq	$0, 40(%rdi)
	andq	$-8, %rdi
	subl	%edi, %eax
	leal	192(%rax), %ecx
	xorl	%eax, %eax
	shrl	$3, %ecx
	rep stosq
	movq	(%rsi), %rax
	movq	%rax, 192(%rdx)
	movq	8(%rsi), %rax
	movq	%rax, 200(%rdx)
	movq	16(%rsi), %rax
	movq	%rax, 208(%rdx)
	movq	24(%rsi), %rax
	movq	%rax, 216(%rdx)
	movq	32(%rsi), %rax
	movq	%rax, 224(%rdx)
	movq	40(%rsi), %rax
	movq	%rax, 232(%rdx)
	movq	48(%rsi), %rax
	movq	%rax, 240(%rdx)
	movq	56(%rsi), %rax
	movq	%rax, 248(%rdx)
	movq	64(%rsi), %rcx
	leaq	256(%rdx), %rax
	movq	%rcx, 256(%rdx)
	movq	72(%rsi), %rdx
	movq	%rdx, 8(%rax)
	movq	80(%rsi), %rdx
	movq	%rdx, 16(%rax)
	movq	88(%rsi), %rdx
	movq	%rdx, 24(%rax)
	movq	96(%rsi), %rdx
	movq	%rdx, 32(%rax)
	movq	104(%rsi), %rdx
	movq	%rdx, 40(%rax)
	movq	112(%rsi), %rdx
	movq	%rdx, 48(%rax)
	movq	120(%rsi), %rdx
	movq	%rdx, 56(%rax)
	ret
	.cfi_endproc
.LFE4669:
	.size	convert_affine_to_extensible, .-convert_affine_to_extensible
	.section	.text.unlikely.convert_affine_to_extensible
.LCOLDE15:
	.section	.text.convert_affine_to_extensible
.LHOTE15:
	.section	.text.unlikely.convert_tw_extensible_to_tw_pniels,"ax",@progbits
.LCOLDB16:
	.section	.text.convert_tw_extensible_to_tw_pniels,"ax",@progbits
.LHOTB16:
	.p2align 4,,15
	.globl	convert_tw_extensible_to_tw_pniels
	.hidden	convert_tw_extensible_to_tw_pniels
	.type	convert_tw_extensible_to_tw_pniels, @function
convert_tw_extensible_to_tw_pniels:
.LFB4670:
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
	movabsq	$72057594037927935, %r12
	pushq	%rbx
	movq	%rsi, %r13
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	movq	%rdi, %rbx
	leaq	192(%rbx), %r14
	subq	$104, %rsp
	vmovdqa	64(%rsi), %ymm0
	vmovdqa	.LC0(%rip), %ymm5
	vpsubq	(%rsi), %ymm0, %ymm0
	vmovdqa	%ymm0, (%rdi)
	vmovdqa	.LC1(%rip), %ymm3
	vpaddq	%ymm5, %ymm0, %ymm0
	vmovdqa	96(%rsi), %ymm1
	vmovdqa	.LC2(%rip), %ymm4
	vpsubq	32(%rsi), %ymm1, %ymm1
	vmovdqa	%ymm0, (%rdi)
	vpaddq	%ymm3, %ymm1, %ymm0
	vmovdqa	%ymm0, 32(%rdi)
	movzbl	63(%rdi), %edx
	movq	16(%rdi), %rcx
	addq	%rdx, 32(%rdi)
	movq	%r12, %rsi
	vmovdqa	%ymm5, -144(%rbp)
	andq	24(%rdi), %rsi
	vmovdqa	%ymm3, -112(%rbp)
	movq	%rcx, %rax
	andq	%r12, %rcx
	shrq	$56, %rax
	vmovdqu	24(%rdi), %xmm0
	addq	%rsi, %rax
	movq	%rax, 24(%rdi)
	movq	8(%rdi), %rax
	vinserti128	$0x1, 40(%rdi), %ymm0, %ymm2
	vpermq	$27, 32(%rdi), %ymm0
	movq	%rax, %rsi
	shrq	$56, %rsi
	andq	%r12, %rax
	addq	%rsi, %rcx
	movq	%r12, %rsi
	vpand	%ymm4, %ymm0, %ymm1
	vpermq	$27, %ymm2, %ymm0
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, 32(%rdi)
	movq	%rcx, 16(%rdi)
	movl	$56, %edi
	shrx	%rdi, (%rbx), %rcx
	movq	%r14, %rdi
	vmovdqa	%ymm4, -80(%rbp)
	addq	%rcx, %rax
	movq	%rax, 8(%rbx)
	movq	%r12, %rax
	andq	(%rbx), %rax
	addq	%rax, %rdx
	movq	%rdx, (%rbx)
	vmovdqa	0(%r13), %ymm0
	vpaddq	64(%r13), %ymm0, %ymm0
	vmovdqa	%ymm0, 64(%rbx)
	movq	80(%rbx), %rcx
	andq	88(%rbx), %rsi
	vmovdqa	32(%r13), %ymm0
	movq	%rcx, %rax
	andq	%r12, %rcx
	vpaddq	96(%r13), %ymm0, %ymm0
	vmovdqa	%ymm0, 96(%rbx)
	movzbl	127(%rbx), %edx
	addq	%rdx, 96(%rbx)
	shrq	$56, %rax
	addq	%rsi, %rax
	vmovdqu	88(%rbx), %xmm1
	movq	%rax, 88(%rbx)
	movq	72(%rbx), %rax
	vinserti128	$0x1, 104(%rbx), %ymm1, %ymm0
	movq	%rax, %rsi
	vpermq	$27, 96(%rbx), %ymm1
	shrq	$56, %rsi
	andq	%r12, %rax
	addq	%rsi, %rcx
	leaq	256(%r13), %rsi
	movq	%rcx, 80(%rbx)
	movzbl	71(%rbx), %ecx
	vpand	%ymm4, %ymm1, %ymm2
	vpermq	$27, %ymm0, %ymm1
	addq	%rcx, %rax
	movq	%rax, 72(%rbx)
	movq	%r12, %rax
	andq	64(%rbx), %rax
	vpsrlq	$56, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm2, %ymm1
	vpermq	$27, %ymm1, %ymm1
	addq	%rax, %rdx
	vmovdqa	%ymm1, 96(%rbx)
	movq	%rdx, 64(%rbx)
	leaq	192(%r13), %rdx
	vzeroupper
	call	p448_mul@PLT
	leaq	128(%rbx), %rdi
	movq	%r14, %rsi
	movl	$78164, %edx
	call	p448_mulw@PLT
	vmovdqa	-144(%rbp), %ymm5
	movq	%r12, %rsi
	vmovdqa	160(%rbx), %ymm0
	vmovdqa	-112(%rbp), %ymm3
	vpsubq	128(%rbx), %ymm5, %ymm5
	vmovdqa	%ymm5, 128(%rbx)
	movq	144(%rbx), %rdx
	andq	152(%rbx), %rsi
	vpsubq	%ymm0, %ymm3, %ymm3
	vmovdqa	%ymm3, 160(%rbx)
	movzbl	191(%rbx), %ecx
	addq	%rcx, 160(%rbx)
	movq	%rdx, %rax
	andq	%r12, %rdx
	vmovdqa	-80(%rbp), %ymm4
	shrq	$56, %rax
	addq	%rsi, %rax
	vmovdqu	152(%rbx), %xmm1
	movq	%rax, 152(%rbx)
	movq	136(%rbx), %rax
	vinserti128	$0x1, 168(%rbx), %ymm1, %ymm3
	movq	%rax, %rsi
	vpermq	$27, 160(%rbx), %ymm1
	shrq	$56, %rsi
	andq	%r12, %rax
	addq	%rsi, %rdx
	movq	%r12, %rsi
	movq	%rdx, 144(%rbx)
	movzbl	135(%rbx), %edx
	vpand	%ymm4, %ymm1, %ymm2
	vpermq	$27, %ymm3, %ymm1
	addq	%rdx, %rax
	movq	%rax, 136(%rbx)
	movq	%r12, %rax
	andq	128(%rbx), %rax
	vpsrlq	$56, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm2, %ymm1
	vpermq	$27, %ymm1, %ymm1
	addq	%rax, %rcx
	vmovdqa	%ymm1, 160(%rbx)
	movq	%rcx, 128(%rbx)
	vmovdqa	128(%r13), %ymm0
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, 192(%rbx)
	vmovdqa	160(%r13), %ymm0
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, 224(%rbx)
	movzbl	255(%rbx), %ecx
	addq	%rcx, 224(%rbx)
	vmovdqu	216(%rbx), %xmm1
	vinserti128	$0x1, 232(%rbx), %ymm1, %ymm1
	vpermq	$27, %ymm1, %ymm0
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, 224(%rbx), %ymm0
	movq	208(%rbx), %rdx
	andq	216(%rbx), %rsi
	movq	%rdx, %rax
	andq	%r12, %rdx
	shrq	$56, %rax
	vpand	%ymm4, %ymm0, %ymm0
	addq	%rsi, %rax
	movq	%rax, 216(%rbx)
	movq	200(%rbx), %rax
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	movq	%rax, %rsi
	andq	%r12, %rax
	andq	192(%rbx), %r12
	shrq	$56, %rsi
	vmovdqa	%ymm0, 224(%rbx)
	addq	%rsi, %rdx
	movq	%rdx, 208(%rbx)
	movzbl	199(%rbx), %edx
	addq	%rcx, %r12
	movq	%r12, 192(%rbx)
	addq	%rdx, %rax
	movq	%rax, 200(%rbx)
	vzeroupper
	addq	$104, %rsp
	popq	%rbx
	popq	%r10
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4670:
	.size	convert_tw_extensible_to_tw_pniels, .-convert_tw_extensible_to_tw_pniels
	.section	.text.unlikely.convert_tw_extensible_to_tw_pniels
.LCOLDE16:
	.section	.text.convert_tw_extensible_to_tw_pniels
.LHOTE16:
	.section	.text.unlikely.convert_tw_pniels_to_tw_extensible,"ax",@progbits
.LCOLDB17:
	.section	.text.convert_tw_pniels_to_tw_extensible,"ax",@progbits
.LHOTB17:
	.p2align 4,,15
	.globl	convert_tw_pniels_to_tw_extensible
	.hidden	convert_tw_pniels_to_tw_extensible
	.type	convert_tw_pniels_to_tw_extensible, @function
convert_tw_pniels_to_tw_extensible:
.LFB4671:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movabsq	$72057594037927935, %rax
	movq	%rax, %r8
	leaq	16(%rsp), %r13
	.cfi_def_cfa 13, 0
	andq	$-32, %rsp
	pushq	-8(%r13)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r13
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	pushq	%r12
	pushq	%rbx
	.cfi_escape 0x10,0xc,0x2,0x76,0x70
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	movq	%rdi, %rbx
	leaq	192(%rsi), %r12
	subq	$24, %rsp
	vmovdqa	64(%rsi), %ymm0
	vmovdqa	.LC2(%rip), %ymm4
	vpaddq	(%rsi), %ymm0, %ymm0
	vmovdqa	%ymm0, 256(%rdi)
	vmovdqa	96(%rsi), %ymm0
	vpaddq	32(%rsi), %ymm0, %ymm0
	vmovdqa	%ymm0, 288(%rdi)
	movzbl	319(%rdi), %ecx
	addq	%rcx, 288(%rdi)
	vmovdqu	280(%rdi), %xmm1
	vinserti128	$0x1, 296(%rdi), %ymm1, %ymm3
	vpermq	$27, 288(%rdi), %ymm1
	vpand	%ymm4, %ymm1, %ymm2
	vpermq	$27, %ymm3, %ymm1
	vpsrlq	$56, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm2, %ymm1
	vpermq	$27, %ymm1, %ymm1
	vmovdqa	%ymm1, 288(%rdi)
	movq	272(%rdi), %rdi
	andq	280(%rbx), %r8
	movq	%rdi, %rdx
	andq	%rax, %rdi
	shrq	$56, %rdx
	addq	%r8, %rdx
	movq	%rdx, 280(%rbx)
	movq	264(%rbx), %rdx
	movq	%rdx, %r8
	andq	%rax, %rdx
	shrq	$56, %r8
	addq	%r8, %rdi
	movq	%rax, %r8
	movq	%rdi, 272(%rbx)
	movzbl	263(%rbx), %edi
	addq	%rdi, %rdx
	movq	%rdx, 264(%rbx)
	movq	%rax, %rdx
	andq	256(%rbx), %rdx
	addq	%rdx, %rcx
	movq	%rcx, 256(%rbx)
	vmovdqa	64(%rsi), %ymm1
	vpsubq	(%rsi), %ymm1, %ymm1
	vmovdqa	%ymm1, 192(%rbx)
	vpaddq	.LC0(%rip), %ymm1, %ymm1
	vmovdqa	96(%rsi), %ymm0
	vpsubq	32(%rsi), %ymm0, %ymm0
	vmovdqa	%ymm1, 192(%rbx)
	vpaddq	.LC1(%rip), %ymm0, %ymm1
	vmovdqa	%ymm1, 224(%rbx)
	movzbl	255(%rbx), %ecx
	movq	208(%rbx), %rdi
	addq	%rcx, 224(%rbx)
	movq	%r12, %rsi
	andq	216(%rbx), %r8
	movq	%rdi, %rdx
	andq	%rax, %rdi
	shrq	$56, %rdx
	vmovdqu	216(%rbx), %xmm1
	addq	%r8, %rdx
	movq	%rdx, 216(%rbx)
	movq	200(%rbx), %rdx
	vinserti128	$0x1, 232(%rbx), %ymm1, %ymm1
	movq	%rdx, %r8
	andq	%rax, %rdx
	andq	192(%rbx), %rax
	shrq	$56, %r8
	addq	%r8, %rdi
	vpermq	$27, %ymm1, %ymm0
	movq	%rdi, 208(%rbx)
	movzbl	199(%rbx), %edi
	addq	%rcx, %rax
	movq	%rax, 192(%rbx)
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, 224(%rbx), %ymm0
	addq	%rdi, %rdx
	movq	%rbx, %rdi
	movq	%rdx, 200(%rbx)
	leaq	192(%rbx), %rdx
	vpand	%ymm4, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, 224(%rbx)
	vzeroupper
	call	p448_mul@PLT
	leaq	64(%rbx), %rdi
	leaq	256(%rbx), %rdx
	movq	%r12, %rsi
	call	p448_mul@PLT
	addq	$24, %rsp
	leaq	128(%rbx), %rdi
	movq	%r12, %rsi
	popq	%rbx
	popq	%r12
	popq	%r13
	.cfi_def_cfa 13, 0
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	p448_sqr@PLT
	.cfi_endproc
.LFE4671:
	.size	convert_tw_pniels_to_tw_extensible, .-convert_tw_pniels_to_tw_extensible
	.section	.text.unlikely.convert_tw_pniels_to_tw_extensible
.LCOLDE17:
	.section	.text.convert_tw_pniels_to_tw_extensible
.LHOTE17:
	.section	.text.unlikely.convert_tw_niels_to_tw_extensible,"ax",@progbits
.LCOLDB18:
	.section	.text.convert_tw_niels_to_tw_extensible,"ax",@progbits
.LHOTB18:
	.p2align 4,,15
	.globl	convert_tw_niels_to_tw_extensible
	.hidden	convert_tw_niels_to_tw_extensible
	.type	convert_tw_niels_to_tw_extensible, @function
convert_tw_niels_to_tw_extensible:
.LFB4672:
	.cfi_startproc
	vmovdqa	64(%rsi), %ymm0
	movq	%rdi, %rdx
	movabsq	$72057594037927935, %rax
	movq	%rax, %r9
	vmovdqa	.LC2(%rip), %ymm4
	vpaddq	(%rsi), %ymm0, %ymm0
	vmovdqa	%ymm0, 64(%rdi)
	vmovdqa	96(%rsi), %ymm0
	vpaddq	32(%rsi), %ymm0, %ymm0
	vmovdqa	%ymm0, 96(%rdi)
	movq	80(%rdx), %r8
	movzbl	127(%rdi), %edi
	andq	88(%rdx), %r9
	addq	%rdi, 96(%rdx)
	movq	%r8, %rcx
	andq	%rax, %r8
	shrq	$56, %rcx
	addq	%r9, %rcx
	vmovdqu	88(%rdx), %xmm1
	movq	%rcx, 88(%rdx)
	movq	72(%rdx), %rcx
	vinserti128	$0x1, 104(%rdx), %ymm1, %ymm3
	movq	%rcx, %r9
	vpermq	$27, 96(%rdx), %ymm1
	shrq	$56, %r9
	andq	%rax, %rcx
	addq	%r9, %r8
	movq	%r8, 80(%rdx)
	movzbl	71(%rdx), %r8d
	vpand	%ymm4, %ymm1, %ymm2
	vpermq	$27, %ymm3, %ymm1
	addq	%r8, %rcx
	movq	%rax, %r8
	movq	%rcx, 72(%rdx)
	movq	%rax, %rcx
	andq	64(%rdx), %rcx
	vpsrlq	$56, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm2, %ymm1
	vpermq	$27, %ymm1, %ymm1
	addq	%rcx, %rdi
	vmovdqa	%ymm1, 96(%rdx)
	movq	%rdi, 64(%rdx)
	vmovdqa	64(%rsi), %ymm1
	vpsubq	(%rsi), %ymm1, %ymm1
	vmovdqa	%ymm1, (%rdx)
	vpaddq	.LC0(%rip), %ymm1, %ymm1
	vmovdqa	96(%rsi), %ymm0
	vpsubq	32(%rsi), %ymm0, %ymm0
	vmovdqa	%ymm1, (%rdx)
	vpaddq	.LC1(%rip), %ymm0, %ymm1
	vmovdqa	%ymm1, 32(%rdx)
	movzbl	63(%rdx), %esi
	movq	16(%rdx), %rdi
	addq	%rsi, 32(%rdx)
	andq	24(%rdx), %r8
	movq	%rdi, %rcx
	andq	%rax, %rdi
	movq	$1, 128(%rdx)
	shrq	$56, %rcx
	movq	$0, 136(%rdx)
	movq	$0, 184(%rdx)
	vmovdqu	24(%rdx), %xmm1
	addq	%r8, %rcx
	movq	%rcx, 24(%rdx)
	movq	8(%rdx), %rcx
	vinserti128	$0x1, 40(%rdx), %ymm1, %ymm1
	movq	%rcx, %r8
	andq	%rax, %rcx
	andq	(%rdx), %rax
	shrq	$56, %r8
	addq	%r8, %rdi
	vpermq	$27, %ymm1, %ymm0
	movq	%rdi, 16(%rdx)
	movl	$56, %edi
	shrx	%rdi, (%rdx), %rdi
	addq	%rsi, %rax
	movq	%rax, (%rdx)
	movl	%edx, %eax
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, 32(%rdx), %ymm0
	addq	%rdi, %rcx
	leaq	144(%rdx), %rdi
	movq	%rcx, 8(%rdx)
	andq	$-8, %rdi
	vpand	%ymm4, %ymm0, %ymm0
	subl	%edi, %eax
	leal	192(%rax), %ecx
	xorl	%eax, %eax
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	shrl	$3, %ecx
	vmovdqa	%ymm0, 32(%rdx)
	rep stosq
	leaq	64(%rdx), %rcx
	movq	(%rdx), %rax
	movq	%rax, 192(%rdx)
	movq	8(%rdx), %rax
	movq	%rax, 200(%rdx)
	movq	16(%rdx), %rax
	movq	%rax, 208(%rdx)
	movq	24(%rdx), %rax
	movq	%rax, 216(%rdx)
	movq	32(%rdx), %rax
	movq	%rax, 224(%rdx)
	movq	40(%rdx), %rax
	movq	%rax, 232(%rdx)
	movq	48(%rdx), %rax
	movq	64(%rdx), %rsi
	movq	%rax, 240(%rdx)
	movq	56(%rdx), %rax
	movq	%rsi, 256(%rdx)
	movq	%rax, 248(%rdx)
	leaq	256(%rdx), %rax
	movq	72(%rdx), %rdx
	movq	%rdx, 8(%rax)
	movq	16(%rcx), %rdx
	movq	%rdx, 16(%rax)
	movq	24(%rcx), %rdx
	movq	%rdx, 24(%rax)
	movq	32(%rcx), %rdx
	movq	%rdx, 32(%rax)
	movq	40(%rcx), %rdx
	movq	%rdx, 40(%rax)
	movq	48(%rcx), %rdx
	movq	%rdx, 48(%rax)
	movq	56(%rcx), %rdx
	movq	%rdx, 56(%rax)
	vzeroupper
	ret
	.cfi_endproc
.LFE4672:
	.size	convert_tw_niels_to_tw_extensible, .-convert_tw_niels_to_tw_extensible
	.section	.text.unlikely.convert_tw_niels_to_tw_extensible
.LCOLDE18:
	.section	.text.convert_tw_niels_to_tw_extensible
.LHOTE18:
	.section	.text.unlikely.montgomery_step,"ax",@progbits
.LCOLDB21:
	.section	.text.montgomery_step,"ax",@progbits
.LHOTB21:
	.p2align 4,,15
	.globl	montgomery_step
	.hidden	montgomery_step
	.type	montgomery_step, @function
montgomery_step:
.LFB4673:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	leaq	192(%rdi), %rcx
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	64(%rdi), %r13
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	leaq	-208(%rbp), %r12
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	leaq	128(%rdi), %rbx
	movq	%rdi, %r15
	subq	$288, %rsp
	movq	%r12, %rsi
	movq	%rcx, -272(%rbp)
	vmovdqa	128(%rdi), %ymm2
	movq	%rbx, %rdx
	vmovdqa	64(%rdi), %ymm0
	vmovdqa	160(%rdi), %ymm3
	vpaddq	%ymm0, %ymm2, %ymm1
	vpsubq	%ymm2, %ymm0, %ymm2
	vmovdqa	.LC0(%rip), %ymm0
	vmovdqa	%ymm1, -208(%rbp)
	vpaddq	%ymm0, %ymm2, %ymm2
	vmovdqa	96(%rdi), %ymm1
	vmovdqa	%ymm2, -144(%rbp)
	vmovdqa	.LC1(%rip), %ymm2
	vpaddq	%ymm1, %ymm3, %ymm4
	vpsubq	%ymm3, %ymm1, %ymm1
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	vpsubq	256(%rdi), %ymm0, %ymm3
	vpaddq	192(%rdi), %ymm3, %ymm3
	vpaddq	%ymm2, %ymm1, %ymm1
	vmovdqa	%ymm1, -112(%rbp)
	leaq	256(%rdi), %rax
	vmovdqa	224(%rdi), %ymm1
	vmovdqa	%ymm3, 128(%rdi)
	movq	%rax, -216(%rbp)
	vpsubq	288(%rdi), %ymm1, %ymm1
	vpaddq	%ymm2, %ymm1, %ymm1
	vmovdqa	%ymm1, 160(%rdi)
	movq	%r13, %rdi
	vmovdqa	%ymm4, -176(%rbp)
	vmovdqa	%ymm0, -304(%rbp)
	vmovdqa	%ymm2, -336(%rbp)
	vzeroupper
	leaq	-144(%rbp), %r14
	call	p448_mul@PLT
	vmovdqa	256(%r15), %ymm1
	movq	%rbx, %rdx
	movq	%r14, %rsi
	movq	-216(%rbp), %rdi
	vpaddq	192(%r15), %ymm1, %ymm1
	vmovdqa	%ymm1, 128(%r15)
	vmovdqa	288(%r15), %ymm1
	vpaddq	224(%r15), %ymm1, %ymm1
	vmovdqa	%ymm1, 160(%r15)
	vzeroupper
	call	p448_mul@PLT
	vmovdqa	256(%r15), %ymm1
	movq	%rbx, %rdi
	movq	-272(%rbp), %rsi
	vpaddq	64(%r15), %ymm1, %ymm1
	vmovdqa	%ymm1, 192(%r15)
	vmovdqa	288(%r15), %ymm1
	vpaddq	96(%r15), %ymm1, %ymm1
	vmovdqa	%ymm1, 224(%r15)
	vzeroupper
	call	p448_sqr@PLT
	movq	-272(%rbp), %rdi
	movq	%r15, %rsi
	movq	%rbx, %rdx
	call	p448_mul@PLT
	movq	-216(%rbp), %rdi
	vmovdqa	-336(%rbp), %ymm2
	movq	%rbx, %rsi
	vmovdqa	96(%r15), %ymm1
	vmovdqa	-304(%rbp), %ymm0
	vpsubq	288(%r15), %ymm1, %ymm1
	vmovdqa	%ymm2, -272(%rbp)
	vpaddq	%ymm2, %ymm1, %ymm1
	vpsubq	256(%r15), %ymm0, %ymm3
	vmovdqa	%ymm1, 160(%r15)
	vpaddq	64(%r15), %ymm3, %ymm3
	vmovdqa	%ymm3, 128(%r15)
	vzeroupper
	call	p448_sqr@PLT
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	p448_sqr@PLT
	movq	%r14, %rsi
	movq	%r12, %rdi
	call	p448_sqr@PLT
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movl	$39082, %edx
	call	p448_mulw@PLT
	vmovdqa	96(%r15), %ymm1
	movq	%rbx, %rdx
	movq	%r12, %rsi
	vmovdqa	-304(%rbp), %ymm0
	movq	%r13, %rdi
	vmovdqa	-272(%rbp), %ymm2
	vpsubq	-176(%rbp), %ymm1, %ymm1
	vpsubq	-208(%rbp), %ymm0, %ymm0
	vpaddq	64(%r15), %ymm0, %ymm0
	vmovdqa	%ymm0, -144(%rbp)
	vpaddq	%ymm2, %ymm1, %ymm0
	vmovdqa	%ymm0, -112(%rbp)
	vzeroupper
	call	p448_mul@PLT
	vmovdqa	160(%r15), %ymm0
	movq	%r14, %rdx
	movq	%r12, %rsi
	vmovdqa	128(%r15), %ymm1
	movq	%rbx, %rdi
	vpsubq	-112(%rbp), %ymm0, %ymm0
	vpaddq	.LC20(%rip), %ymm0, %ymm0
	vmovdqa	%ymm0, -176(%rbp)
	vpsubq	-144(%rbp), %ymm1, %ymm1
	vpaddq	.LC19(%rip), %ymm1, %ymm1
	vmovdqa	%ymm1, -208(%rbp)
	vzeroupper
	call	p448_mul@PLT
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L55
	addq	$288, %rsp
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
.L55:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4673:
	.size	montgomery_step, .-montgomery_step
	.section	.text.unlikely.montgomery_step
.LCOLDE21:
	.section	.text.montgomery_step
.LHOTE21:
	.section	.text.unlikely.deserialize_montgomery,"ax",@progbits
.LCOLDB22:
	.section	.text.deserialize_montgomery,"ax",@progbits
.LHOTB22:
	.p2align 4,,15
	.globl	deserialize_montgomery
	.hidden	deserialize_montgomery
	.type	deserialize_montgomery, @function
deserialize_montgomery:
.LFB4674:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	p448_sqr@PLT
	leaq	80(%rbx), %rdi
	movl	%ebx, %edx
	xorl	%eax, %eax
	movq	$1, 64(%rbx)
	movq	$0, 72(%rbx)
	leaq	136(%rbx), %rsi
	andq	$-8, %rdi
	movq	$0, 120(%rbx)
	subl	%edi, %edx
	leal	128(%rdx), %ecx
	leaq	200(%rbx), %rdx
	shrl	$3, %ecx
	rep stosq
	leaq	144(%rbx), %rdi
	movq	$0, 128(%rbx)
	movq	$0, 136(%rbx)
	movq	$0, 184(%rbx)
	andq	$-8, %rdi
	subq	%rdi, %rsi
	leal	56(%rsi), %ecx
	shrl	$3, %ecx
	rep stosq
	leaq	208(%rbx), %rdi
	movq	$1, 192(%rbx)
	movq	$0, 200(%rbx)
	movq	$0, 248(%rbx)
	andq	$-8, %rdi
	subq	%rdi, %rdx
	leal	56(%rdx), %ecx
	shrl	$3, %ecx
	rep stosq
	movq	(%rbx), %rax
	movq	%rax, 256(%rbx)
	movq	8(%rbx), %rax
	movq	%rax, 264(%rbx)
	movq	16(%rbx), %rax
	movq	%rax, 272(%rbx)
	movq	24(%rbx), %rax
	movq	%rax, 280(%rbx)
	movq	32(%rbx), %rax
	movq	%rax, 288(%rbx)
	movq	40(%rbx), %rax
	movq	%rax, 296(%rbx)
	movq	48(%rbx), %rax
	movq	%rax, 304(%rbx)
	movq	56(%rbx), %rax
	movq	%rax, 312(%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4674:
	.size	deserialize_montgomery, .-deserialize_montgomery
	.section	.text.unlikely.deserialize_montgomery
.LCOLDE22:
	.section	.text.deserialize_montgomery
.LHOTE22:
	.section	.text.unlikely.serialize_montgomery,"ax",@progbits
.LCOLDB24:
	.section	.text.serialize_montgomery,"ax",@progbits
.LHOTB24:
	.p2align 4,,15
	.globl	serialize_montgomery
	.hidden	serialize_montgomery
	.type	serialize_montgomery, @function
serialize_montgomery:
.LFB4675:
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
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	-144(%rbp), %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	leaq	128(%rsi), %r10
	pushq	%rbx
	movq	%rsi, %r13
	movabsq	$72057594037927935, %r15
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	leaq	-272(%rbp), %rbx
	subq	$416, %rsp
	movq	%rdi, -432(%rbp)
	movq	%rdx, -408(%rbp)
	movq	%r12, %rdi
	movq	%r10, %rdx
	movq	%r10, -424(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_mul@PLT
	vmovdqa	-144(%rbp), %ymm1
	leaq	64(%r13), %rax
	movq	%r15, %rdi
	vmovdqa	-112(%rbp), %ymm0
	vpsubq	64(%r13), %ymm1, %ymm1
	vpaddq	.LC0(%rip), %ymm1, %ymm1
	vmovdqa	%ymm1, -272(%rbp)
	movq	-256(%rbp), %rdx
	andq	-248(%rbp), %rdi
	vpsubq	96(%r13), %ymm0, %ymm0
	movq	%rax, -416(%rbp)
	vpaddq	.LC1(%rip), %ymm0, %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	movzbl	-209(%rbp), %eax
	vmovdqa	.LC2(%rip), %ymm2
	addq	%rax, -240(%rbp)
	movq	%rdx, %rsi
	andq	%r15, %rdx
	shrq	$56, %rsi
	vmovdqa	%ymm2, -368(%rbp)
	addq	%rdi, %rsi
	vmovdqu	-248(%rbp), %xmm0
	movq	%rsi, -248(%rbp)
	movq	-264(%rbp), %rsi
	vinserti128	$0x1, -232(%rbp), %ymm0, %ymm3
	movq	%rsi, %rdi
	vpermq	$27, -240(%rbp), %ymm0
	shrq	$56, %rdi
	andq	%r15, %rsi
	addq	%rdi, %rdx
	movq	%rdx, -256(%rbp)
	movq	-272(%rbp), %rdx
	vpand	%ymm2, %ymm0, %ymm1
	vpermq	$27, %ymm3, %ymm0
	movq	%rdx, %rdi
	andq	%r15, %rdx
	shrq	$56, %rdi
	addq	%rdx, %rax
	movq	%rbx, %rdx
	addq	%rdi, %rsi
	movq	%r12, %rdi
	movq	%rax, -272(%rbp)
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	movq	%rsi, -264(%rbp)
	leaq	256(%r13), %rsi
	vmovdqa	%ymm0, -240(%rbp)
	vzeroupper
	leaq	-208(%rbp), %r14
	call	p448_mul@PLT
	leaq	64(%r13), %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	p448_mul@PLT
	vmovdqa	.LC0(%rip), %ymm6
	movq	%r15, %rdi
	vmovdqa	-176(%rbp), %ymm0
	vpsubq	128(%r13), %ymm6, %ymm1
	vpaddq	-208(%rbp), %ymm1, %ymm1
	vmovdqa	%ymm1, -272(%rbp)
	movq	-256(%rbp), %rdx
	andq	-248(%rbp), %rdi
	vpsubq	160(%r13), %ymm0, %ymm0
	vpaddq	.LC1(%rip), %ymm0, %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	movzbl	-209(%rbp), %eax
	addq	%rax, -240(%rbp)
	vmovdqa	-368(%rbp), %ymm2
	movq	%rdx, %rsi
	andq	%r15, %rdx
	shrq	$56, %rsi
	vmovdqa	%ymm2, -400(%rbp)
	addq	%rdi, %rsi
	vmovdqu	-248(%rbp), %xmm0
	movq	%rsi, -248(%rbp)
	movq	-264(%rbp), %rsi
	vinserti128	$0x1, -232(%rbp), %ymm0, %ymm3
	movq	%rsi, %rdi
	vpermq	$27, -240(%rbp), %ymm0
	shrq	$56, %rdi
	andq	%r15, %rsi
	addq	%rdi, %rdx
	movq	%rdx, -256(%rbp)
	movq	-272(%rbp), %rdx
	vpand	%ymm2, %ymm0, %ymm1
	vpermq	$27, %ymm3, %ymm0
	movq	%rdx, %rdi
	andq	%r15, %rdx
	addq	%rdx, %rax
	shrq	$56, %rdi
	movq	%rbx, %rdx
	addq	%rdi, %rsi
	movq	%rax, -272(%rbp)
	leaq	-336(%rbp), %rax
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	movq	%rsi, -264(%rbp)
	leaq	192(%r13), %rsi
	movq	%rax, %rdi
	movq	%rax, -368(%rbp)
	vmovdqa	%ymm0, -240(%rbp)
	vzeroupper
	call	p448_mul@PLT
	vmovdqa	-336(%rbp), %ymm7
	movq	%r15, %rdi
	vmovdqa	-144(%rbp), %ymm5
	vmovdqa	-304(%rbp), %ymm6
	vmovdqa	-112(%rbp), %ymm4
	vpaddq	%ymm5, %ymm7, %ymm0
	vpsubq	%ymm7, %ymm5, %ymm5
	vmovdqa	%ymm0, -208(%rbp)
	movq	-192(%rbp), %rdx
	andq	-184(%rbp), %rdi
	vpaddq	%ymm4, %ymm6, %ymm0
	vmovdqa	%ymm0, -176(%rbp)
	movzbl	-145(%rbp), %eax
	addq	%rax, -176(%rbp)
	vpsubq	%ymm6, %ymm4, %ymm4
	vpaddq	.LC1(%rip), %ymm4, %ymm4
	movq	%rdx, %rsi
	andq	%r15, %rdx
	vmovdqa	-400(%rbp), %ymm2
	shrq	$56, %rsi
	vmovdqa	%ymm4, -240(%rbp)
	vpaddq	.LC0(%rip), %ymm5, %ymm5
	addq	%rdi, %rsi
	vmovdqa	%ymm5, -272(%rbp)
	vmovdqu	-184(%rbp), %xmm0
	movq	%rsi, -184(%rbp)
	movq	-200(%rbp), %rsi
	vinserti128	$0x1, -168(%rbp), %ymm0, %ymm3
	movq	%rsi, %rdi
	vpermq	$27, -176(%rbp), %ymm0
	shrq	$56, %rdi
	andq	%r15, %rsi
	addq	%rdi, %rdx
	movq	%rdx, -192(%rbp)
	movq	-208(%rbp), %rdx
	vpand	%ymm2, %ymm0, %ymm1
	movq	%rdx, %rdi
	andq	%r15, %rdx
	addq	%rdx, %rax
	vpermq	$27, %ymm3, %ymm0
	movq	%rax, -208(%rbp)
	movzbl	-209(%rbp), %eax
	shrq	$56, %rdi
	addq	%rax, -240(%rbp)
	addq	%rdi, %rsi
	movq	%r15, %rdi
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	movq	%rsi, -200(%rbp)
	vmovdqa	%ymm0, -176(%rbp)
	vmovdqu	-248(%rbp), %xmm0
	vinserti128	$0x1, -232(%rbp), %ymm0, %ymm3
	vpermq	$27, -240(%rbp), %ymm0
	vpand	%ymm2, %ymm0, %ymm1
	vpermq	$27, %ymm3, %ymm0
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	movq	-256(%rbp), %rdx
	andq	-248(%rbp), %rdi
	movq	%rdx, %rsi
	andq	%r15, %rdx
	shrq	$56, %rsi
	addq	%rdi, %rsi
	movq	%rsi, -248(%rbp)
	movq	-264(%rbp), %rsi
	movq	%rsi, %rdi
	andq	%r15, %rsi
	shrq	$56, %rdi
	addq	%rdi, %rdx
	movq	%rdx, -256(%rbp)
	movq	-272(%rbp), %rdx
	movq	%rdx, %rdi
	andq	%r15, %rdx
	shrq	$56, %rdi
	addq	%rdx, %rax
	movq	%r14, %rdx
	addq	%rdi, %rsi
	movq	%r12, %rdi
	movq	%rax, -272(%rbp)
	movq	%rsi, -264(%rbp)
	movq	%rbx, %rsi
	vzeroupper
	call	p448_mul@PLT
	movq	0(%r13), %rax
	movq	-368(%rbp), %rdi
	movq	%r14, %rsi
	movq	%rax, -208(%rbp)
	movq	8(%r13), %rax
	addq	$1, -208(%rbp)
	movq	%rax, -200(%rbp)
	movq	16(%r13), %rax
	movq	%rax, -192(%rbp)
	movq	24(%r13), %rax
	movq	%rax, -184(%rbp)
	movq	32(%r13), %rax
	movq	%rax, -176(%rbp)
	movq	40(%r13), %rax
	movq	%rax, -168(%rbp)
	movq	48(%r13), %rax
	movq	%rax, -160(%rbp)
	movq	56(%r13), %rax
	movq	%rax, -152(%rbp)
	call	p448_sqr@PLT
	movq	-368(%rbp), %rsi
	movq	%rbx, %rdi
	movl	$39082, %edx
	call	p448_mulw@PLT
	vmovdqa	.LC0(%rip), %ymm7
	movq	%r15, %rdi
	vmovdqa	.LC1(%rip), %ymm6
	vpsubq	-272(%rbp), %ymm7, %ymm0
	vmovdqa	%ymm0, -272(%rbp)
	movq	-256(%rbp), %rdx
	vpsubq	-240(%rbp), %ymm6, %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	movzbl	-209(%rbp), %eax
	addq	%rax, -240(%rbp)
	andq	-248(%rbp), %rdi
	movq	%rdx, %rsi
	andq	%r15, %rdx
	shrq	$56, %rsi
	vmovdqa	-400(%rbp), %ymm2
	vmovdqu	-248(%rbp), %xmm0
	addq	%rdi, %rsi
	vpermq	$27, -240(%rbp), %ymm4
	movq	%rsi, -248(%rbp)
	movq	-264(%rbp), %rsi
	vinserti128	$0x1, -232(%rbp), %ymm0, %ymm0
	movq	%rsi, %rdi
	andq	%r15, %rsi
	vpand	%ymm2, %ymm4, %ymm4
	shrq	$56, %rdi
	addq	%rdi, %rdx
	vpermq	$27, %ymm0, %ymm0
	movq	%rdx, -256(%rbp)
	movq	-272(%rbp), %rdx
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm4, %ymm0
	vpermq	$27, %ymm0, %ymm4
	vmovdqa	0(%r13), %ymm0
	movq	%rdx, %rdi
	andq	%r15, %rdx
	addq	%rdx, %rax
	shrq	$56, %rdi
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, -208(%rbp)
	addq	%rdi, %rsi
	vmovdqa	32(%r13), %ymm0
	movq	%rsi, -264(%rbp)
	movq	%r15, %rdi
	vmovdqa	%ymm4, -240(%rbp)
	movq	%rax, -272(%rbp)
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, -176(%rbp)
	movzbl	-145(%rbp), %edx
	addq	%rdx, -176(%rbp)
	vmovdqu	-184(%rbp), %xmm0
	vinserti128	$0x1, -168(%rbp), %ymm0, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, -176(%rbp), %ymm0
	movq	-192(%rbp), %rax
	andq	-184(%rbp), %rdi
	movq	%rax, %rsi
	andq	%r15, %rax
	shrq	$56, %rsi
	vpand	%ymm2, %ymm0, %ymm0
	addq	%rdi, %rsi
	movq	%rsi, -184(%rbp)
	movq	-200(%rbp), %rsi
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	movq	%rsi, %rdi
	andq	%r15, %rsi
	shrq	$56, %rdi
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, -304(%rbp)
	addq	%rdi, %rax
	movq	%rax, -192(%rbp)
	movq	-208(%rbp), %rax
	movq	%rax, %rdi
	andq	%r15, %rax
	shrq	$56, %rdi
	addq	%rax, %rdx
	movzbl	-273(%rbp), %eax
	addq	%rdi, %rsi
	movq	%rdx, -208(%rbp)
	movq	%r15, %rdi
	movq	%rsi, -200(%rbp)
	addq	%rax, -304(%rbp)
	vmovdqa	-208(%rbp), %ymm1
	vpaddq	%ymm1, %ymm1, %ymm1
	vmovdqa	%ymm1, -336(%rbp)
	movq	-320(%rbp), %rdx
	andq	-312(%rbp), %rdi
	movq	%rdx, %rsi
	vmovdqu	-312(%rbp), %xmm0
	shrq	$56, %rsi
	vpermq	$27, -304(%rbp), %ymm1
	addq	%rdi, %rsi
	andq	%r15, %rdx
	movq	%rsi, -312(%rbp)
	movq	-328(%rbp), %rsi
	vinserti128	$0x1, -296(%rbp), %ymm0, %ymm0
	movq	%rsi, %rdi
	vpand	%ymm2, %ymm1, %ymm3
	shrq	$56, %rdi
	andq	%r15, %rsi
	addq	%rdi, %rdx
	movq	%rdx, -320(%rbp)
	movq	-336(%rbp), %rdx
	vpermq	$27, %ymm0, %ymm0
	movq	%rdx, %rdi
	andq	%r15, %rdx
	shrq	$56, %rdi
	addq	%rdx, %rax
	vpsrlq	$56, %ymm0, %ymm0
	addq	%rdi, %rsi
	vpaddq	%ymm0, %ymm3, %ymm1
	vpermq	$27, %ymm1, %ymm0
	movq	%rsi, -328(%rbp)
	movq	%rax, -336(%rbp)
	movq	%r15, %rdi
	vmovdqa	-336(%rbp), %ymm1
	vmovdqa	%ymm0, -304(%rbp)
	vpaddq	%ymm4, %ymm0, %ymm0
	vmovdqa	%ymm0, -176(%rbp)
	movzbl	-145(%rbp), %esi
	vpaddq	-272(%rbp), %ymm1, %ymm1
	vmovdqa	%ymm1, -208(%rbp)
	addq	%rsi, -176(%rbp)
	movq	-192(%rbp), %rdx
	vmovdqa	%ymm2, -464(%rbp)
	andq	-184(%rbp), %rdi
	movq	%rdx, %rax
	andq	%r15, %rdx
	vmovdqu	-184(%rbp), %xmm0
	shrq	$56, %rax
	addq	%rdi, %rax
	vinserti128	$0x1, -168(%rbp), %ymm0, %ymm0
	movq	%rax, -184(%rbp)
	movq	-200(%rbp), %rax
	movq	%rax, %rdi
	andq	%r15, %rax
	vpermq	$27, %ymm0, %ymm0
	shrq	$56, %rdi
	addq	%rdi, %rdx
	movq	%rdx, -192(%rbp)
	movq	-208(%rbp), %rdx
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, -176(%rbp), %ymm0
	movq	%rdx, %rdi
	andq	%r15, %rdx
	shrq	$56, %rdi
	addq	%rdx, %rsi
	movq	%r14, %rdx
	addq	%rdi, %rax
	movq	-368(%rbp), %rdi
	movq	%rsi, -208(%rbp)
	vpand	%ymm2, %ymm0, %ymm0
	leaq	64(%r13), %rsi
	movq	%rax, -200(%rbp)
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, -176(%rbp)
	vzeroupper
	call	p448_mul@PLT
	movq	-424(%rbp), %r10
	movq	%r10, %rdi
	call	p448_is_zero@PLT
	movq	%rax, -400(%rbp)
	movq	%r15, %rdi
	vmovdqa	-464(%rbp), %ymm2
	vpbroadcastd	-400(%rbp), %ymm0
	vpand	-336(%rbp), %ymm0, %ymm1
	vpand	-304(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm1, -272(%rbp)
	vpaddq	128(%r13), %ymm1, %ymm1
	vmovdqa	%ymm1, -208(%rbp)
	movq	-192(%rbp), %rsi
	andq	-184(%rbp), %rdi
	vmovdqa	%ymm0, -240(%rbp)
	vpaddq	160(%r13), %ymm0, %ymm0
	vmovdqa	%ymm0, -176(%rbp)
	movzbl	-145(%rbp), %edx
	addq	%rdx, -176(%rbp)
	movq	%rsi, %r8
	andq	%r15, %rsi
	shrq	$56, %r8
	movq	%r8, %rax
	addq	%rdi, %rax
	vmovdqu	-184(%rbp), %xmm0
	movq	%rax, -184(%rbp)
	movq	-200(%rbp), %rax
	vinserti128	$0x1, -168(%rbp), %ymm0, %ymm0
	movq	%rax, %rdi
	andq	%r15, %rax
	shrq	$56, %rdi
	addq	%rdi, %rsi
	vpermq	$27, %ymm0, %ymm0
	movq	%rsi, -192(%rbp)
	movq	-208(%rbp), %rsi
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, -176(%rbp), %ymm0
	movq	%rsi, %rdi
	andq	%r15, %rsi
	shrq	$56, %rdi
	addq	%rsi, %rdx
	movq	-408(%rbp), %rsi
	addq	%rdi, %rax
	movq	%rdx, -208(%rbp)
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movq	%rax, -200(%rbp)
	vpand	%ymm2, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, -176(%rbp)
	vzeroupper
	call	p448_mul@PLT
	movq	%rbx, %rdx
	movq	%r14, %rsi
	movq	%r12, %rdi
	movq	-400(%rbp), %rcx
	subq	%rcx, -272(%rbp)
	call	p448_mul@PLT
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	movq	-416(%rbp), %rdx
	movq	%r12, %rsi
	movq	%r14, %rdi
	call	p448_mul@PLT
	movq	%r14, %rdx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	p448_mul@PLT
	movq	-368(%rbp), %r13
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	p448_isr@PLT
	movq	%r13, %rdx
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	p448_mul@PLT
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	p448_sqr@PLT
	movq	%rbx, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
	movl	-400(%rbp), %eax
	subq	$1, -336(%rbp)
	movq	-432(%rbp), %r9
	vmovdqa	-464(%rbp), %ymm2
	notl	%eax
	movl	%eax, -368(%rbp)
	movq	%r15, %rax
	vpbroadcastd	-368(%rbp), %ymm0
	vpand	-208(%rbp), %ymm0, %ymm1
	vpand	-176(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm1, (%r9)
	vmovdqa	%ymm0, 32(%r9)
	vpaddq	-336(%rbp), %ymm2, %ymm0
	vmovdqa	%ymm0, -336(%rbp)
	andq	-312(%rbp), %rax
	movq	-320(%rbp), %rdx
	vmovdqa	.LC23(%rip), %ymm0
	vpaddq	-304(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -304(%rbp)
	movzbl	-273(%rbp), %esi
	addq	%rsi, -304(%rbp)
	movq	%rax, %rdi
	movq	%rdx, %rax
	shrq	$56, %rax
	andq	%r15, %rdx
	addq	%rdi, %rax
	movq	%r13, %rdi
	vmovdqu	-312(%rbp), %xmm1
	movq	%rax, -312(%rbp)
	movq	-328(%rbp), %rax
	vinserti128	$0x1, -296(%rbp), %ymm1, %ymm1
	movq	%rax, %rcx
	andq	%r15, %rax
	shrq	$56, %rcx
	addq	%rcx, %rdx
	vpermq	$27, %ymm1, %ymm0
	movq	%rdx, -320(%rbp)
	movq	-336(%rbp), %rdx
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, -304(%rbp), %ymm0
	movq	%rdx, %rcx
	shrq	$56, %rcx
	addq	%rcx, %rax
	movq	%rdx, %rcx
	andq	%r15, %rcx
	movq	%rax, -328(%rbp)
	addq	%rsi, %rcx
	vpand	%ymm2, %ymm0, %ymm0
	movq	%rcx, -336(%rbp)
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, -304(%rbp)
	vzeroupper
	call	p448_is_zero@PLT
	movq	-408(%rbp), %rdi
	movq	%rax, %rbx
	call	p448_is_zero@PLT
	orq	%rbx, %rax
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L62
	addq	$416, %rsp
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
.L62:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4675:
	.size	serialize_montgomery, .-serialize_montgomery
	.section	.text.unlikely.serialize_montgomery
.LCOLDE24:
	.section	.text.serialize_montgomery
.LHOTE24:
	.section	.text.unlikely.serialize_extensible,"ax",@progbits
.LCOLDB25:
	.section	.text.serialize_extensible,"ax",@progbits
.LHOTB25:
	.p2align 4,,15
	.globl	serialize_extensible
	.hidden	serialize_extensible
	.type	serialize_extensible, @function
serialize_extensible:
.LFB4676:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movq	%rsi, %rdx
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
	leaq	-208(%rbp), %r13
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	movq	%rdi, %rbx
	subq	$232, %rsp
	vmovdqa	128(%rsi), %ymm6
	vmovdqa	64(%rsi), %ymm4
	vmovdqa	96(%rsi), %ymm0
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	vpsubq	%ymm6, %ymm4, %ymm1
	vpaddq	.LC0(%rip), %ymm1, %ymm1
	movabsq	$72057594037927935, %rax
	vmovdqa	%ymm1, -272(%rbp)
	vpsubq	160(%rsi), %ymm0, %ymm0
	movq	-256(%rbp), %rdi
	vpaddq	.LC1(%rip), %ymm0, %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	movzbl	-209(%rbp), %esi
	movq	%rax, %r8
	vpaddq	%ymm6, %ymm4, %ymm4
	addq	%rsi, -240(%rbp)
	andq	-248(%rbp), %r8
	movq	%rdi, %rcx
	vmovdqa	.LC2(%rip), %ymm5
	shrq	$56, %rcx
	andq	%rax, %rdi
	vmovdqu	-248(%rbp), %xmm1
	addq	%r8, %rcx
	movq	%rcx, -248(%rbp)
	movq	-264(%rbp), %rcx
	vinserti128	$0x1, -232(%rbp), %ymm1, %ymm3
	vpermq	$27, -240(%rbp), %ymm1
	movq	%rcx, %r8
	shrq	$56, %r8
	andq	%rax, %rcx
	addq	%r8, %rdi
	movq	%rdi, -256(%rbp)
	movq	-272(%rbp), %rdi
	vpand	%ymm5, %ymm1, %ymm2
	vpermq	$27, %ymm3, %ymm1
	movq	%rdi, %r8
	andq	%rax, %rdi
	shrq	$56, %r8
	addq	%rdi, %rsi
	addq	%r8, %rcx
	movq	%rax, %r8
	vpsrlq	$56, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm2, %ymm1
	vpermq	$27, %ymm1, %ymm1
	vmovdqa	%ymm1, -240(%rbp)
	movq	%rcx, -264(%rbp)
	movq	%rsi, -272(%rbp)
	vmovdqa	%ymm4, (%rbx)
	movq	16(%rbx), %rdi
	andq	24(%rbx), %r8
	vmovdqa	160(%rdx), %ymm1
	movq	%rdi, %rcx
	andq	%rax, %rdi
	vpaddq	96(%rdx), %ymm1, %ymm1
	vmovdqa	%ymm1, 32(%rbx)
	movzbl	63(%rbx), %esi
	addq	%rsi, 32(%rbx)
	shrq	$56, %rcx
	addq	%r8, %rcx
	vmovdqu	24(%rbx), %xmm1
	movq	%rcx, 24(%rbx)
	movq	8(%rbx), %rcx
	vinserti128	$0x1, 40(%rbx), %ymm1, %ymm1
	movq	%rcx, %r8
	andq	%rax, %rcx
	andq	(%rbx), %rax
	shrq	$56, %r8
	addq	%r8, %rdi
	vpermq	$27, %ymm1, %ymm0
	movq	%rdi, 16(%rbx)
	movl	$56, %edi
	shrx	%rdi, (%rbx), %rdi
	addq	%rsi, %rax
	leaq	128(%rdx), %rsi
	movq	%rax, (%rbx)
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, 32(%rbx), %ymm0
	addq	%rdi, %rcx
	movq	%r13, %rdi
	movq	%rcx, 8(%rbx)
	vpand	%ymm5, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, 32(%rbx)
	vzeroupper
	leaq	-272(%rbp), %r12
	leaq	-144(%rbp), %r14
	call	p448_mul@PLT
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%r14, %rdi
	call	p448_mul@PLT
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
	movq	%rbx, %rdx
	movq	%r14, %rsi
	movq	%r12, %rdi
	call	p448_mul@PLT
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	p448_mul@PLT
	movq	%r14, %rsi
	movq	%r12, %rdi
	call	p448_isr@PLT
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	p448_sqr@PLT
	movq	%r13, %rdx
	movq	%r14, %rsi
	movq	%r12, %rdi
	call	p448_mul@PLT
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L67
	addq	$232, %rsp
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
.L67:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4676:
	.size	serialize_extensible, .-serialize_extensible
	.section	.text.unlikely.serialize_extensible
.LCOLDE25:
	.section	.text.serialize_extensible
.LHOTE25:
	.section	.text.unlikely.untwist_and_double_and_serialize,"ax",@progbits
.LCOLDB26:
	.section	.text.untwist_and_double_and_serialize,"ax",@progbits
.LHOTB26:
	.p2align 4,,15
	.globl	untwist_and_double_and_serialize
	.hidden	untwist_and_double_and_serialize
	.type	untwist_and_double_and_serialize, @function
untwist_and_double_and_serialize:
.LFB4677:
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
	leaq	-144(%rbp), %rcx
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	movq	%rsi, %r13
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, %rbx
	addq	$64, %rsi
	movq	%r13, %rdx
	subq	$352, %rsp
	movq	%rcx, %rdi
	movq	%rcx, -376(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_mul@PLT
	vmovdqa	64(%r13), %ymm0
	movabsq	$72057594037927935, %r12
	movl	$56, %ecx
	movq	%r12, %rdi
	vmovdqa	.LC2(%rip), %ymm4
	leaq	-272(%rbp), %r14
	vpaddq	0(%r13), %ymm0, %ymm0
	vmovdqa	%ymm0, (%rbx)
	movq	16(%rbx), %rsi
	andq	24(%rbx), %rdi
	vmovdqa	%ymm4, -368(%rbp)
	vmovdqa	96(%r13), %ymm0
	movq	%rsi, %rax
	andq	%r12, %rsi
	vpaddq	32(%r13), %ymm0, %ymm0
	vmovdqa	%ymm0, 32(%rbx)
	movzbl	63(%rbx), %edx
	addq	%rdx, 32(%rbx)
	shrq	$56, %rax
	addq	%rdi, %rax
	vmovdqu	24(%rbx), %xmm0
	movq	%rax, 24(%rbx)
	movq	8(%rbx), %rax
	vinserti128	$0x1, 40(%rbx), %ymm0, %ymm0
	movq	%rax, %rdi
	andq	%r12, %rax
	shrq	$56, %rdi
	addq	%rdi, %rsi
	movq	%r14, %rdi
	vpermq	$27, %ymm0, %ymm0
	movq	%rsi, 16(%rbx)
	shrx	%rcx, (%rbx), %rsi
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, 32(%rbx), %ymm0
	addq	%rsi, %rax
	movq	%rbx, %rsi
	movq	%rax, 8(%rbx)
	movq	%r12, %rax
	andq	(%rbx), %rax
	vpand	%ymm4, %ymm0, %ymm0
	addq	%rax, %rdx
	movq	%rdx, (%rbx)
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, 32(%rbx)
	vzeroupper
	leaq	-208(%rbp), %r15
	call	p448_sqr@PLT
	vmovdqa	-144(%rbp), %ymm0
	movq	%r12, %rdi
	movl	$56, %ecx
	vmovdqa	-368(%rbp), %ymm4
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, -208(%rbp)
	movq	-192(%rbp), %rdx
	vmovdqa	-112(%rbp), %ymm0
	andq	-184(%rbp), %rdi
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, -176(%rbp)
	movzbl	-145(%rbp), %eax
	addq	%rax, -176(%rbp)
	movq	%rdx, %rsi
	andq	%r12, %rdx
	shrq	$56, %rsi
	addq	%rdi, %rsi
	vmovdqu	-184(%rbp), %xmm0
	movq	%rsi, -184(%rbp)
	movq	-200(%rbp), %rsi
	vinserti128	$0x1, -168(%rbp), %ymm0, %ymm2
	vpermq	$27, -176(%rbp), %ymm0
	movq	%rsi, %rdi
	shrq	$56, %rdi
	andq	%r12, %rsi
	addq	%rdi, %rdx
	movq	%rdx, -192(%rbp)
	movq	-208(%rbp), %rdx
	vpand	%ymm4, %ymm0, %ymm1
	vpermq	$27, %ymm2, %ymm0
	movq	%rdx, %rdi
	andq	%r12, %rdx
	shrq	$56, %rdi
	addq	%rdx, %rax
	addq	%rdi, %rsi
	movq	%rax, -208(%rbp)
	movq	%r12, %rdi
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	-240(%rbp), %ymm1
	movq	%rsi, -200(%rbp)
	vmovdqa	%ymm0, -176(%rbp)
	vpsubq	%ymm0, %ymm1, %ymm0
	vpaddq	.LC1(%rip), %ymm0, %ymm0
	vmovdqa	%ymm0, 32(%rbx)
	movzbl	63(%rbx), %esi
	addq	%rsi, 32(%rbx)
	vmovdqa	-272(%rbp), %ymm1
	vpsubq	-208(%rbp), %ymm1, %ymm1
	vpaddq	.LC0(%rip), %ymm1, %ymm1
	vmovdqa	%ymm1, (%rbx)
	vmovdqu	24(%rbx), %xmm2
	vinserti128	$0x1, 40(%rbx), %ymm2, %ymm0
	vpermq	$27, 32(%rbx), %ymm2
	movq	16(%rbx), %rdx
	andq	24(%rbx), %rdi
	movq	%rdx, %rax
	andq	%r12, %rdx
	shrq	$56, %rax
	vpand	%ymm4, %ymm2, %ymm3
	addq	%rdi, %rax
	vpermq	$27, %ymm0, %ymm2
	movq	%rax, 24(%rbx)
	movq	8(%rbx), %rax
	vpsrlq	$56, %ymm2, %ymm2
	vpaddq	%ymm2, %ymm3, %ymm2
	vpermq	$27, %ymm2, %ymm2
	movq	%rax, %rdi
	andq	%r12, %rax
	shrq	$56, %rdi
	addq	%rdi, %rdx
	movq	%r15, %rdi
	vmovdqa	%ymm2, 32(%rbx)
	movq	%rdx, 16(%rbx)
	shrx	%rcx, (%rbx), %rdx
	addq	%rdx, %rax
	movq	%rax, 8(%rbx)
	movq	%r12, %rax
	andq	(%rbx), %rax
	addq	%rax, %rsi
	movq	%rsi, (%rbx)
	leaq	128(%r13), %rsi
	vzeroupper
	call	p448_sqr@PLT
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	p448_sqr@PLT
	vmovdqa	(%rbx), %ymm0
	movq	%r12, %rdi
	movl	$56, %ecx
	vmovdqa	-368(%rbp), %ymm4
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, (%rbx)
	movq	16(%rbx), %rdx
	vmovdqa	32(%rbx), %ymm0
	andq	24(%rbx), %rdi
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, 32(%rbx)
	movzbl	63(%rbx), %esi
	addq	%rsi, 32(%rbx)
	movq	%rdx, %rax
	andq	%r12, %rdx
	shrq	$56, %rax
	addq	%rdi, %rax
	vmovdqu	24(%rbx), %xmm0
	vpermq	$27, 32(%rbx), %ymm1
	movq	%rax, 24(%rbx)
	movq	8(%rbx), %rax
	vinserti128	$0x1, 40(%rbx), %ymm0, %ymm0
	movq	%rax, %rdi
	andq	%r12, %rax
	andq	(%rbx), %r12
	shrq	$56, %rdi
	vpand	%ymm4, %ymm1, %ymm1
	addq	%rdi, %rdx
	movq	%r15, %rdi
	vpermq	$27, %ymm0, %ymm0
	movq	%rdx, 16(%rbx)
	shrx	%rcx, (%rbx), %rdx
	addq	%rsi, %r12
	movq	%rbx, %rsi
	movq	%r12, (%rbx)
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	addq	%rdx, %rax
	movl	$39082, %edx
	movq	%rax, 8(%rbx)
	vmovdqa	%ymm0, 32(%rbx)
	vzeroupper
	call	p448_mulw@PLT
	vmovdqa	.LC0(%rip), %ymm5
	movl	$39082, %edx
	movq	%r15, %rsi
	vmovdqa	.LC1(%rip), %ymm6
	movq	%rbx, %rdi
	vpsubq	-208(%rbp), %ymm5, %ymm0
	vmovdqa	%ymm0, -208(%rbp)
	vpsubq	-176(%rbp), %ymm6, %ymm0
	vmovdqa	%ymm0, -176(%rbp)
	vzeroupper
	leaq	-336(%rbp), %r12
	call	p448_mulw@PLT
	vmovdqa	32(%rbx), %ymm0
	movq	%r14, %rdx
	movq	%r15, %rsi
	vmovdqa	.LC0(%rip), %ymm7
	movq	%r12, %rdi
	vmovdqa	.LC1(%rip), %ymm3
	vpsubq	(%rbx), %ymm7, %ymm1
	vmovdqa	%ymm1, (%rbx)
	vpsubq	%ymm0, %ymm3, %ymm0
	vmovdqa	%ymm0, 32(%rbx)
	vzeroupper
	call	p448_mul@PLT
	movq	%r12, %rdx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	p448_mul@PLT
	movq	%r15, %rsi
	movq	%r12, %rdi
	call	p448_isr@PLT
	movq	%r12, %rdx
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	p448_mul@PLT
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	p448_sqr@PLT
	movq	%rbx, %rdx
	movq	%r15, %rsi
	movq	%r12, %rdi
	call	p448_mul@PLT
	movq	-376(%rbp), %rcx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movq	%rcx, %rdx
	call	p448_mul@PLT
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L72
	addq	$352, %rsp
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
.L72:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4677:
	.size	untwist_and_double_and_serialize, .-untwist_and_double_and_serialize
	.section	.text.unlikely.untwist_and_double_and_serialize
.LCOLDE26:
	.section	.text.untwist_and_double_and_serialize
.LHOTE26:
	.section	.text.unlikely.twist_even,"ax",@progbits
.LCOLDB27:
	.section	.text.twist_even,"ax",@progbits
.LHOTB27:
	.p2align 4,,15
	.globl	twist_even
	.hidden	twist_even
	.type	twist_even, @function
twist_even:
.LFB4678:
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
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	64(%rdi), %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	movq	%rsi, %r15
	leaq	128(%rsi), %rsi
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, %rbx
	movq	%r12, %rdi
	addq	$-128, %rsp
	movabsq	$72057594037927935, %r13
	leaq	256(%rbx), %r14
	call	p448_sqr@PLT
	leaq	128(%rbx), %rax
	movq	%r15, %rsi
	movq	%rax, %rdi
	movq	%rax, -56(%rbp)
	call	p448_sqr@PLT
	vmovdqa	.LC0(%rip), %ymm5
	movq	%r13, %rsi
	vmovdqa	64(%rbx), %ymm0
	vmovdqa	96(%rbx), %ymm1
	vpsubq	128(%rbx), %ymm0, %ymm0
	vpaddq	%ymm5, %ymm0, %ymm0
	vmovdqa	%ymm0, 256(%rbx)
	vmovdqa	.LC1(%rip), %ymm0
	vpsubq	160(%rbx), %ymm1, %ymm1
	movq	272(%rbx), %rcx
	andq	280(%rbx), %rsi
	vmovdqa	%ymm5, -176(%rbp)
	vpaddq	%ymm0, %ymm1, %ymm1
	vmovdqa	%ymm1, 288(%rbx)
	movzbl	319(%rbx), %edx
	addq	%rdx, 288(%rbx)
	movq	%rcx, %rdi
	andq	%r13, %rcx
	shrq	$56, %rdi
	vmovdqa	.LC2(%rip), %ymm4
	movq	%rdi, %rax
	movq	%r13, %rdi
	andq	256(%rbx), %rdi
	addq	%rsi, %rax
	vmovdqu	280(%rbx), %xmm1
	movq	%rax, 280(%rbx)
	movq	264(%rbx), %rax
	addq	%rdi, %rdx
	vinserti128	$0x1, 296(%rbx), %ymm1, %ymm3
	vpermq	$27, 288(%rbx), %ymm1
	movq	%rax, %rsi
	shrq	$56, %rsi
	andq	%r13, %rax
	addq	%rsi, %rcx
	movq	%r13, %rsi
	movq	%rcx, 272(%rbx)
	movzbl	263(%rbx), %ecx
	movq	%rdx, 256(%rbx)
	vpand	%ymm4, %ymm1, %ymm2
	vpermq	$27, %ymm3, %ymm1
	addq	%rcx, %rax
	movq	%rax, 264(%rbx)
	vpsrlq	$56, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm2, %ymm1
	vpermq	$27, %ymm1, %ymm1
	vmovdqa	%ymm1, 288(%rbx)
	vmovdqa	128(%r15), %ymm1
	vpsubq	(%r15), %ymm1, %ymm1
	vmovdqa	%ymm1, 128(%rbx)
	vpaddq	%ymm5, %ymm1, %ymm1
	vmovdqa	160(%r15), %ymm2
	vpsubq	32(%r15), %ymm2, %ymm2
	vmovdqa	%ymm1, 128(%rbx)
	vpaddq	%ymm0, %ymm2, %ymm1
	vmovdqa	%ymm0, -144(%rbp)
	movq	144(%rbx), %rcx
	andq	152(%rbx), %rsi
	vmovdqa	%ymm1, 160(%rbx)
	movzbl	191(%rbx), %edx
	addq	%rdx, 160(%rbx)
	vmovdqa	%ymm4, -112(%rbp)
	movq	%rcx, %rdi
	andq	%r13, %rcx
	shrq	$56, %rdi
	movq	%rdi, %rax
	movq	%r12, %rdi
	addq	%rsi, %rax
	vmovdqu	152(%rbx), %xmm1
	movq	%rax, 152(%rbx)
	movq	136(%rbx), %rax
	vinserti128	$0x1, 168(%rbx), %ymm1, %ymm3
	movq	%rax, %rsi
	vpermq	$27, 160(%rbx), %ymm1
	shrq	$56, %rsi
	andq	%r13, %rax
	addq	%rsi, %rcx
	movq	-56(%rbp), %rsi
	movq	%rcx, 144(%rbx)
	movzbl	135(%rbx), %ecx
	vpand	%ymm4, %ymm1, %ymm2
	vpermq	$27, %ymm3, %ymm1
	addq	%rcx, %rax
	movq	%r13, %rcx
	andq	128(%rbx), %rcx
	movq	%rax, 136(%rbx)
	vpsrlq	$56, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm2, %ymm1
	vpermq	$27, %ymm1, %ymm1
	addq	%rcx, %rdx
	leaq	64(%r15), %rcx
	movq	%rdx, 128(%rbx)
	vmovdqa	%ymm1, 160(%rbx)
	movq	%rcx, %rdx
	movq	%rcx, -64(%rbp)
	vzeroupper
	call	p448_mul@PLT
	vmovdqa	128(%r15), %ymm1
	movq	%r13, %rdi
	vmovdqa	-144(%rbp), %ymm0
	vpsubq	64(%r15), %ymm1, %ymm1
	vmovdqa	%ymm1, 128(%rbx)
	vmovdqa	-176(%rbp), %ymm5
	vmovdqa	160(%r15), %ymm2
	vpaddq	%ymm5, %ymm1, %ymm5
	vmovdqa	-112(%rbp), %ymm4
	vpsubq	96(%r15), %ymm2, %ymm2
	vpaddq	%ymm0, %ymm2, %ymm0
	vmovdqa	%ymm0, 160(%rbx)
	movzbl	191(%rbx), %edx
	vmovdqa	%ymm5, 128(%rbx)
	movq	144(%rbx), %rsi
	addq	%rdx, 160(%rbx)
	andq	152(%rbx), %rdi
	movq	%rsi, %rax
	andq	%r13, %rsi
	shrq	$56, %rax
	vmovdqu	152(%rbx), %xmm1
	addq	%rdi, %rax
	movq	%rax, 152(%rbx)
	movq	136(%rbx), %rax
	vinserti128	$0x1, 168(%rbx), %ymm1, %ymm1
	movq	%rax, %rdi
	andq	%r13, %rax
	andq	128(%rbx), %r13
	shrq	$56, %rdi
	addq	%rdi, %rsi
	movq	%rbx, %rdi
	vpermq	$27, %ymm1, %ymm0
	movq	%rsi, 144(%rbx)
	movzbl	135(%rbx), %esi
	addq	%rdx, %r13
	movq	%r12, %rdx
	movq	%r13, 128(%rbx)
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, 160(%rbx), %ymm0
	addq	%rsi, %rax
	movq	-56(%rbp), %rsi
	movq	%rax, 136(%rbx)
	vpand	%ymm4, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, 160(%rbx)
	vzeroupper
	leaq	192(%rbx), %r13
	call	p448_mul@PLT
	movq	%r14, %rdx
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
	movq	%r13, %rdx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	p448_mul@PLT
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	p448_isr@PLT
	movq	%r13, %rdx
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	p448_mul@PLT
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	p448_sqr@PLT
	movq	%rbx, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
	movq	%r14, %rdx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	movq	-64(%rbp), %rcx
	movq	%r14, %rdx
	movq	%r12, %rdi
	movq	%rcx, %rsi
	call	p448_mul@PLT
	movq	-56(%rbp), %rdi
	call	p448_is_zero@PLT
	leaq	144(%rbx), %rdi
	subq	%rax, 64(%rbx)
	movl	%ebx, %eax
	movq	$1, 128(%rbx)
	movq	$0, 136(%rbx)
	andq	$-8, %rdi
	movq	$0, 184(%rbx)
	subl	%edi, %eax
	leal	192(%rax), %ecx
	xorl	%eax, %eax
	shrl	$3, %ecx
	rep stosq
	movq	(%rbx), %rax
	movq	%rax, 192(%rbx)
	movq	8(%rbx), %rax
	movq	%rax, 200(%rbx)
	movq	16(%rbx), %rax
	movq	%rax, 208(%rbx)
	movq	24(%rbx), %rax
	movq	%rax, 216(%rbx)
	movq	32(%rbx), %rax
	movq	%rax, 224(%rbx)
	movq	40(%rbx), %rax
	movq	%rax, 232(%rbx)
	movq	48(%rbx), %rax
	movq	%rax, 240(%rbx)
	movq	56(%rbx), %rax
	movq	%rax, 248(%rbx)
	movq	64(%rbx), %rax
	movq	%rax, 256(%rbx)
	movq	8(%r12), %rax
	movq	%rax, 8(%r14)
	movq	16(%r12), %rax
	movq	%rax, 16(%r14)
	movq	24(%r12), %rax
	movq	%rax, 24(%r14)
	movq	32(%r12), %rax
	movq	%rax, 32(%r14)
	movq	40(%r12), %rax
	movq	%rax, 40(%r14)
	movq	48(%r12), %rax
	movq	%rax, 48(%r14)
	movq	56(%r12), %rax
	movq	%rax, 56(%r14)
	subq	$-128, %rsp
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
.LFE4678:
	.size	twist_even, .-twist_even
	.section	.text.unlikely.twist_even
.LCOLDE27:
	.section	.text.twist_even
.LHOTE27:
	.section	.text.unlikely.test_only_twist,"ax",@progbits
.LCOLDB28:
	.section	.text.test_only_twist,"ax",@progbits
.LHOTB28:
	.p2align 4,,15
	.globl	test_only_twist
	.hidden	test_only_twist
	.type	test_only_twist, @function
test_only_twist:
.LFB4679:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	leaq	256(%rdi), %r15
	pushq	%r14
	pushq	%r13
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	movabsq	$72057594037927935, %r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movq	%rsi, %r10
	pushq	%rbx
	subq	$-128, %rsi
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, %rbx
	movq	%r15, %rdi
	leaq	64(%rbx), %r14
	subq	$256, %rsp
	movq	%r10, -216(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_sqr@PLT
	movq	-216(%rbp), %r10
	movq	%r14, %rdi
	movq	%r10, %rsi
	call	p448_sqr@PLT
	vmovdqa	256(%rbx), %ymm1
	movq	%r13, %rdi
	leaq	128(%rbx), %rax
	vmovdqa	288(%rbx), %ymm0
	vpsubq	64(%rbx), %ymm1, %ymm1
	vpaddq	.LC0(%rip), %ymm1, %ymm1
	vmovdqa	%ymm1, 128(%rbx)
	movq	144(%rbx), %rsi
	andq	152(%rbx), %rdi
	vpsubq	96(%rbx), %ymm0, %ymm0
	vpaddq	.LC1(%rip), %ymm0, %ymm0
	vmovdqa	%ymm0, 160(%rbx)
	movzbl	191(%rbx), %ecx
	addq	%rcx, 160(%rbx)
	vmovdqa	.LC2(%rip), %ymm3
	movq	%rsi, %rdx
	andq	%r13, %rsi
	movq	%rax, -224(%rbp)
	shrq	$56, %rdx
	addq	%rdi, %rdx
	vmovdqu	152(%rbx), %xmm0
	movq	%rdx, 152(%rbx)
	movq	136(%rbx), %rdx
	vinserti128	$0x1, 168(%rbx), %ymm0, %ymm2
	movq	%rdx, %rdi
	vpermq	$27, 160(%rbx), %ymm0
	shrq	$56, %rdi
	andq	%r13, %rdx
	addq	%rdi, %rsi
	movq	%r13, %rdi
	movq	%rsi, 144(%rbx)
	movzbl	135(%rbx), %esi
	vpand	%ymm3, %ymm0, %ymm1
	vpermq	$27, %ymm2, %ymm0
	addq	%rsi, %rdx
	movq	%rdx, 136(%rbx)
	movq	%r13, %rdx
	andq	128(%rbx), %rdx
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	addq	%rdx, %rcx
	vmovdqa	%ymm0, 160(%rbx)
	vpaddq	%ymm0, %ymm0, %ymm0
	movq	%rcx, 128(%rbx)
	vmovdqa	%ymm0, 96(%rbx)
	movzbl	127(%rbx), %ecx
	addq	%rcx, 96(%rbx)
	vmovdqa	128(%rbx), %ymm1
	vpaddq	%ymm1, %ymm1, %ymm1
	vmovdqa	%ymm1, 64(%rbx)
	vmovdqu	88(%rbx), %xmm0
	movq	80(%rbx), %rsi
	andq	88(%rbx), %rdi
	vinserti128	$0x1, 104(%rbx), %ymm0, %ymm2
	movq	%rsi, %rdx
	andq	%r13, %rsi
	shrq	$56, %rdx
	vpermq	$27, 96(%rbx), %ymm0
	addq	%rdi, %rdx
	movq	%rdx, 88(%rbx)
	movq	72(%rbx), %rdx
	movq	%rdx, %rdi
	andq	%r13, %rdx
	shrq	$56, %rdi
	vpand	%ymm3, %ymm0, %ymm1
	addq	%rdi, %rsi
	vpermq	$27, %ymm2, %ymm0
	movq	%rsi, 80(%rbx)
	movzbl	71(%rbx), %esi
	movq	%r13, %rdi
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	addq	%rsi, %rdx
	movq	%rdx, 72(%rbx)
	movq	%r13, %rdx
	andq	64(%rbx), %rdx
	vmovdqa	%ymm0, 96(%rbx)
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, 288(%rbx)
	addq	%rdx, %rcx
	movq	%rcx, 64(%rbx)
	movzbl	319(%rbx), %ecx
	vmovdqa	64(%rbx), %ymm1
	addq	%rcx, 288(%rbx)
	vpaddq	%ymm1, %ymm1, %ymm1
	vmovdqa	%ymm1, 256(%rbx)
	movq	272(%rbx), %rsi
	andq	280(%rbx), %rdi
	movq	%rsi, %rdx
	vmovdqu	280(%rbx), %xmm0
	shrq	$56, %rdx
	addq	%rdi, %rdx
	andq	%r13, %rsi
	movq	%rdx, 280(%rbx)
	movq	264(%rbx), %rdx
	vinserti128	$0x1, 296(%rbx), %ymm0, %ymm2
	movq	%rdx, %rdi
	vpermq	$27, 288(%rbx), %ymm0
	shrq	$56, %rdi
	andq	%r13, %rdx
	addq	%rdi, %rsi
	movq	%r13, %rdi
	movq	%rsi, 272(%rbx)
	movzbl	263(%rbx), %esi
	vpand	%ymm3, %ymm0, %ymm1
	vpermq	$27, %ymm2, %ymm0
	addq	%rsi, %rdx
	movq	%rdx, 264(%rbx)
	movq	%r13, %rdx
	andq	256(%rbx), %rdx
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	addq	%rdx, %rcx
	vmovdqa	%ymm0, 288(%rbx)
	movq	%rcx, 256(%rbx)
	movq	-216(%rbp), %r10
	vmovdqa	%ymm3, -272(%rbp)
	vmovdqa	128(%r10), %ymm0
	vpsubq	(%r10), %ymm0, %ymm0
	vmovdqa	%ymm0, 64(%rbx)
	vpaddq	.LC0(%rip), %ymm0, %ymm0
	vmovdqa	160(%r10), %ymm1
	vpsubq	32(%r10), %ymm1, %ymm1
	vmovdqa	%ymm0, 64(%rbx)
	movq	80(%rbx), %rsi
	vpaddq	.LC1(%rip), %ymm1, %ymm0
	andq	88(%rbx), %rdi
	vmovdqa	%ymm0, 96(%rbx)
	movzbl	127(%rbx), %ecx
	addq	%rcx, 96(%rbx)
	movq	%rsi, %rdx
	andq	%r13, %rsi
	shrq	$56, %rdx
	addq	%rdi, %rdx
	vmovdqu	88(%rbx), %xmm0
	movq	%rdx, 88(%rbx)
	movq	72(%rbx), %rdx
	vinserti128	$0x1, 104(%rbx), %ymm0, %ymm2
	movq	%rdx, %rdi
	vpermq	$27, 96(%rbx), %ymm0
	shrq	$56, %rdi
	andq	%r13, %rdx
	addq	%rdi, %rsi
	movq	%rbx, %rdi
	movq	%rsi, 80(%rbx)
	movzbl	71(%rbx), %esi
	vpand	%ymm3, %ymm0, %ymm1
	vpermq	$27, %ymm2, %ymm0
	addq	%rsi, %rdx
	movq	%r14, %rsi
	movq	%rdx, 72(%rbx)
	movq	%r13, %rdx
	andq	64(%rbx), %rdx
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	addq	%rdx, %rcx
	vmovdqa	%ymm0, 96(%rbx)
	movq	%rcx, 64(%rbx)
	leaq	64(%r10), %rcx
	movq	%rcx, %rdx
	movq	%rcx, -240(%rbp)
	vzeroupper
	call	p448_mul@PLT
	movq	-216(%rbp), %r10
	movq	%r13, %r11
	vmovdqa	-272(%rbp), %ymm3
	leaq	192(%rbx), %r12
	vmovdqa	%ymm3, -304(%rbp)
	vmovdqa	128(%r10), %ymm0
	movq	%r10, -232(%rbp)
	vpsubq	64(%r10), %ymm0, %ymm0
	vmovdqa	%ymm0, 128(%rbx)
	vpaddq	.LC0(%rip), %ymm0, %ymm0
	vmovdqa	160(%r10), %ymm1
	vpsubq	96(%r10), %ymm1, %ymm1
	vmovdqa	%ymm0, 128(%rbx)
	vpaddq	.LC1(%rip), %ymm1, %ymm0
	vmovdqa	%ymm0, 160(%rbx)
	movzbl	191(%rbx), %edi
	movq	144(%rbx), %rsi
	addq	%rdi, 160(%rbx)
	andq	152(%rbx), %r11
	movq	%rsi, %rdx
	andq	%r13, %rsi
	shrq	$56, %rdx
	vmovdqu	152(%rbx), %xmm1
	addq	%r11, %rdx
	movq	%rdx, 152(%rbx)
	movq	136(%rbx), %rdx
	vinserti128	$0x1, 168(%rbx), %ymm1, %ymm1
	movq	%rdx, %r11
	andq	%r13, %rdx
	shrq	$56, %r11
	addq	%r11, %rsi
	vpermq	$27, %ymm1, %ymm1
	movq	%rsi, 144(%rbx)
	movzbl	135(%rbx), %esi
	vpsrlq	$56, %ymm1, %ymm2
	vpermq	$27, 160(%rbx), %ymm1
	addq	%rsi, %rdx
	leaq	128(%rbx), %rsi
	movq	%rdx, 136(%rbx)
	movq	%r13, %rdx
	andq	128(%rbx), %rdx
	vpand	%ymm3, %ymm1, %ymm1
	addq	%rdx, %rdi
	movq	%rbx, %rdx
	movq	%rdi, 128(%rbx)
	movq	%r12, %rdi
	vpaddq	%ymm1, %ymm2, %ymm1
	vpermq	$27, %ymm1, %ymm1
	vmovdqa	%ymm1, 160(%rbx)
	vzeroupper
	call	p448_mul@PLT
	leaq	-144(%rbp), %rax
	movq	%r15, %rdx
	movq	%r12, %rsi
	movq	%rax, %rdi
	movq	%rax, -272(%rbp)
	call	p448_mul@PLT
	movq	-272(%rbp), %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	leaq	-208(%rbp), %rax
	movq	%rbx, %rsi
	movq	%rax, %rdi
	movq	%rax, -216(%rbp)
	call	p448_isr@PLT
	movq	-216(%rbp), %rdx
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	p448_mul@PLT
	movq	-216(%rbp), %rsi
	movq	-272(%rbp), %rdi
	call	p448_sqr@PLT
	movq	-272(%rbp), %rdx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	p448_mul@PLT
	movq	-232(%rbp), %r10
	vmovdqa	-304(%rbp), %ymm3
	vmovdqa	64(%r10), %ymm7
	vmovdqa	(%r10), %ymm5
	vmovdqa	96(%r10), %ymm6
	vpaddq	%ymm5, %ymm7, %ymm0
	vmovdqa	32(%r10), %ymm4
	movq	%r13, %r10
	vmovdqa	%ymm0, -144(%rbp)
	movq	-128(%rbp), %rsi
	andq	-120(%rbp), %r10
	vpaddq	%ymm4, %ymm6, %ymm0
	vmovdqa	%ymm0, -112(%rbp)
	movzbl	-81(%rbp), %edx
	addq	%rdx, -112(%rbp)
	vpsubq	%ymm6, %ymm4, %ymm4
	vpaddq	.LC1(%rip), %ymm4, %ymm4
	movq	%rsi, %rcx
	andq	%r13, %rsi
	vmovdqa	%ymm4, -176(%rbp)
	shrq	$56, %rcx
	vpsubq	%ymm7, %ymm5, %ymm5
	vpaddq	.LC0(%rip), %ymm5, %ymm5
	movq	%rcx, %rdi
	vmovdqa	%ymm5, -208(%rbp)
	addq	%r10, %rdi
	vmovdqu	-120(%rbp), %xmm0
	movq	%rdi, -120(%rbp)
	movq	-136(%rbp), %rdi
	vinserti128	$0x1, -104(%rbp), %ymm0, %ymm2
	movq	%rdi, %r10
	vpermq	$27, -112(%rbp), %ymm0
	shrq	$56, %r10
	andq	%r13, %rdi
	addq	%r10, %rsi
	movq	%rsi, -128(%rbp)
	movq	-144(%rbp), %rsi
	vpand	%ymm3, %ymm0, %ymm1
	movq	%rsi, %r10
	andq	%r13, %rsi
	addq	%rsi, %rdx
	movzbl	-145(%rbp), %esi
	shrq	$56, %r10
	addq	%rsi, -176(%rbp)
	vpermq	$27, %ymm2, %ymm0
	addq	%r10, %rdi
	movq	%rdx, -144(%rbp)
	movq	%r13, %r10
	movq	%rdi, -136(%rbp)
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqu	-184(%rbp), %xmm1
	vinserti128	$0x1, -168(%rbp), %ymm1, %ymm1
	vmovdqa	%ymm0, -112(%rbp)
	vpermq	$27, %ymm1, %ymm1
	vpsrlq	$56, %ymm1, %ymm2
	vpermq	$27, -176(%rbp), %ymm1
	vmovdqa	%ymm3, -272(%rbp)
	movq	-192(%rbp), %rdi
	andq	-184(%rbp), %r10
	movq	%rdi, %rdx
	andq	%r13, %rdi
	shrq	$56, %rdx
	vpand	%ymm3, %ymm1, %ymm1
	addq	%r10, %rdx
	movq	%rdx, -184(%rbp)
	movq	-200(%rbp), %rdx
	vpaddq	%ymm1, %ymm2, %ymm1
	vpermq	$27, %ymm1, %ymm1
	movq	%rdx, %r10
	andq	%r13, %rdx
	shrq	$56, %r10
	vmovdqa	%ymm1, -176(%rbp)
	addq	%r10, %rdi
	movq	%rdi, -192(%rbp)
	movq	-208(%rbp), %rdi
	movq	%rdi, %r10
	andq	%r13, %rdi
	shrq	$56, %r10
	addq	%rdi, %rsi
	movq	%rbx, %rdi
	addq	%r10, %rdx
	movq	%rsi, -208(%rbp)
	movq	%r12, %rsi
	movq	%rdx, -200(%rbp)
	movq	-216(%rbp), %rdx
	vzeroupper
	call	p448_mul@PLT
	vmovdqa	(%rbx), %ymm7
	movq	%r13, %r10
	vmovdqa	-144(%rbp), %ymm5
	vmovdqa	32(%rbx), %ymm6
	vmovdqa	-112(%rbp), %ymm4
	vpaddq	%ymm5, %ymm7, %ymm0
	vpsubq	%ymm7, %ymm5, %ymm5
	vmovdqa	%ymm0, -208(%rbp)
	movq	-192(%rbp), %rsi
	andq	-184(%rbp), %r10
	vpaddq	%ymm4, %ymm6, %ymm0
	vmovdqa	%ymm0, -176(%rbp)
	movzbl	-145(%rbp), %edi
	addq	%rdi, -176(%rbp)
	vpsubq	%ymm6, %ymm4, %ymm4
	vpaddq	.LC1(%rip), %ymm4, %ymm4
	movq	%rsi, %rdx
	andq	%r13, %rsi
	vmovdqa	%ymm4, 224(%rbx)
	shrq	$56, %rdx
	vmovdqa	-272(%rbp), %ymm3
	vpaddq	.LC0(%rip), %ymm5, %ymm5
	addq	%r10, %rdx
	vmovdqa	%ymm5, 192(%rbx)
	vmovdqu	-184(%rbp), %xmm0
	movq	%rdx, -184(%rbp)
	movq	-200(%rbp), %rdx
	vinserti128	$0x1, -168(%rbp), %ymm0, %ymm2
	movq	%rdx, %r10
	vpermq	$27, -176(%rbp), %ymm0
	shrq	$56, %r10
	andq	%r13, %rdx
	addq	%r10, %rsi
	movq	%rsi, -192(%rbp)
	movq	-208(%rbp), %rsi
	vpand	%ymm3, %ymm0, %ymm1
	movq	%rsi, %r10
	andq	%r13, %rsi
	addq	%rsi, %rdi
	movzbl	255(%rbx), %esi
	shrq	$56, %r10
	addq	%rsi, 224(%rbx)
	vpermq	$27, %ymm2, %ymm0
	addq	%r10, %rdx
	movq	%rdi, -208(%rbp)
	movq	%r13, %r10
	movq	%rdx, -200(%rbp)
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqu	216(%rbx), %xmm1
	vinserti128	$0x1, 232(%rbx), %ymm1, %ymm1
	vmovdqa	%ymm0, -176(%rbp)
	vpermq	$27, %ymm1, %ymm0
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, 224(%rbx), %ymm0
	vpand	%ymm3, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, 224(%rbx)
	movq	208(%rbx), %rdi
	andq	216(%rbx), %r10
	movq	%rdi, %rdx
	andq	%r13, %rdi
	shrq	$56, %rdx
	addq	%r10, %rdx
	movq	%rdx, 216(%rbx)
	movq	200(%rbx), %rdx
	movq	%rdx, %r10
	andq	%r13, %rdx
	andq	192(%rbx), %r13
	shrq	$56, %r10
	addq	%r10, %rdi
	movq	%rdi, 208(%rbx)
	movzbl	199(%rbx), %edi
	movq	%r13, %rax
	addq	%rsi, %rax
	movq	-216(%rbp), %rsi
	movq	%rax, 192(%rbx)
	addq	%rdi, %rdx
	movq	%rbx, %rdi
	movq	%rdx, 200(%rbx)
	movq	%r15, %rdx
	vzeroupper
	call	p448_mul@PLT
	movq	%r14, %rdi
	call	p448_is_zero@PLT
	subq	%rax, (%rbx)
	movq	%r15, %rdx
	movq	%r12, %rsi
	movq	%r14, %rdi
	call	p448_mul@PLT
	movq	-224(%rbp), %rdi
	call	p448_is_zero@PLT
	movq	-240(%rbp), %rcx
	subq	%rax, 64(%rbx)
	movq	%rcx, %rdi
	call	p448_is_zero@PLT
	leaq	144(%rbx), %rdi
	addq	$1, %rax
	movq	$0, 136(%rbx)
	movq	%rax, 128(%rbx)
	movl	%ebx, %eax
	movq	$0, 184(%rbx)
	andq	$-8, %rdi
	subl	%edi, %eax
	leal	192(%rax), %ecx
	xorl	%eax, %eax
	shrl	$3, %ecx
	rep stosq
	movq	(%rbx), %rax
	movq	%rax, 192(%rbx)
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
	movq	64(%rbx), %rax
	movq	%rax, 256(%rbx)
	movq	8(%r14), %rax
	movq	%rax, 8(%r15)
	movq	16(%r14), %rax
	movq	%rax, 16(%r15)
	movq	24(%r14), %rax
	movq	%rax, 24(%r15)
	movq	32(%r14), %rax
	movq	%rax, 32(%r15)
	movq	40(%r14), %rax
	movq	%rax, 40(%r15)
	movq	48(%r14), %rax
	movq	%rax, 48(%r15)
	movq	56(%r14), %rax
	movq	%rax, 56(%r15)
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L79
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
.L79:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4679:
	.size	test_only_twist, .-test_only_twist
	.section	.text.unlikely.test_only_twist
.LCOLDE28:
	.section	.text.test_only_twist
.LHOTE28:
	.section	.text.unlikely.is_even_pt,"ax",@progbits
.LCOLDB29:
	.section	.text.is_even_pt,"ax",@progbits
.LHOTB29:
	.p2align 4,,15
	.globl	is_even_pt
	.hidden	is_even_pt
	.type	is_even_pt, @function
is_even_pt:
.LFB4680:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	leaq	128(%rdi), %rsi
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x70
	movq	%rdi, %rbx
	leaq	-112(%rbp), %rdi
	subq	$224, %rsp
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	call	p448_sqr@PLT
	leaq	-176(%rbp), %rdi
	movq	%rbx, %rsi
	call	p448_sqr@PLT
	vmovdqa	-80(%rbp), %ymm0
	movabsq	$72057594037927935, %rax
	vmovdqa	-112(%rbp), %ymm1
	movq	%rax, %rdi
	vpsubq	-144(%rbp), %ymm0, %ymm0
	vpaddq	.LC1(%rip), %ymm0, %ymm0
	vmovdqa	%ymm0, -208(%rbp)
	movzbl	-177(%rbp), %edx
	vpsubq	-176(%rbp), %ymm1, %ymm1
	vpaddq	.LC0(%rip), %ymm1, %ymm1
	addq	%rdx, -208(%rbp)
	vmovdqa	%ymm1, -240(%rbp)
	movq	-224(%rbp), %rsi
	andq	-216(%rbp), %rdi
	movq	%rsi, %rcx
	andq	%rax, %rsi
	vmovdqu	-216(%rbp), %xmm0
	shrq	$56, %rcx
	addq	%rdi, %rcx
	vinserti128	$0x1, -200(%rbp), %ymm0, %ymm2
	movq	%rcx, -216(%rbp)
	movq	-232(%rbp), %rcx
	vpermq	$27, -208(%rbp), %ymm0
	movq	%rcx, %rdi
	andq	%rax, %rcx
	shrq	$56, %rdi
	addq	%rdi, %rsi
	movq	-240(%rbp), %rdi
	vpand	.LC2(%rip), %ymm0, %ymm1
	movq	%rsi, -224(%rbp)
	vpermq	$27, %ymm2, %ymm0
	movq	%rdi, %rsi
	andq	%rdi, %rax
	shrq	$56, %rsi
	leaq	-240(%rbp), %rdi
	addq	%rdx, %rax
	addq	%rsi, %rcx
	movq	%rax, -240(%rbp)
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	movq	%rcx, -232(%rbp)
	vmovdqa	%ymm0, -208(%rbp)
	vzeroupper
	call	field_is_square@PLT
	movq	-24(%rbp), %rdx
	xorq	%fs:40, %rdx
	jne	.L84
	addq	$224, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L84:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4680:
	.size	is_even_pt, .-is_even_pt
	.section	.text.unlikely.is_even_pt
.LCOLDE29:
	.section	.text.is_even_pt
.LHOTE29:
	.section	.text.unlikely.is_even_tw,"ax",@progbits
.LCOLDB30:
	.section	.text.is_even_tw,"ax",@progbits
.LHOTB30:
	.p2align 4,,15
	.globl	is_even_tw
	.hidden	is_even_tw
	.type	is_even_tw, @function
is_even_tw:
.LFB4681:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	leaq	128(%rdi), %rsi
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x70
	movq	%rdi, %rbx
	leaq	-112(%rbp), %rdi
	subq	$224, %rsp
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	call	p448_sqr@PLT
	leaq	-176(%rbp), %rdi
	movq	%rbx, %rsi
	call	p448_sqr@PLT
	vmovdqa	-176(%rbp), %ymm0
	movabsq	$72057594037927935, %rax
	movq	%rax, %rdi
	vpaddq	-112(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	movq	-224(%rbp), %rsi
	vmovdqa	-144(%rbp), %ymm0
	andq	-216(%rbp), %rdi
	vpaddq	-80(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -208(%rbp)
	movzbl	-177(%rbp), %edx
	addq	%rdx, -208(%rbp)
	movq	%rsi, %rcx
	andq	%rax, %rsi
	shrq	$56, %rcx
	addq	%rdi, %rcx
	vmovdqu	-216(%rbp), %xmm0
	movq	%rcx, -216(%rbp)
	movq	-232(%rbp), %rcx
	vinserti128	$0x1, -200(%rbp), %ymm0, %ymm2
	vpermq	$27, -208(%rbp), %ymm0
	movq	%rcx, %rdi
	shrq	$56, %rdi
	andq	%rax, %rcx
	addq	%rdi, %rsi
	movq	-240(%rbp), %rdi
	movq	%rsi, -224(%rbp)
	vpand	.LC2(%rip), %ymm0, %ymm1
	movq	%rdi, %rsi
	andq	%rdi, %rax
	shrq	$56, %rsi
	leaq	-240(%rbp), %rdi
	vpermq	$27, %ymm2, %ymm0
	addq	%rsi, %rcx
	addq	%rdx, %rax
	movq	%rcx, -232(%rbp)
	movq	%rax, -240(%rbp)
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, -208(%rbp)
	vzeroupper
	call	field_is_square@PLT
	movq	-24(%rbp), %rdx
	xorq	%fs:40, %rdx
	jne	.L89
	addq	$224, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L89:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4681:
	.size	is_even_tw, .-is_even_tw
	.section	.text.unlikely.is_even_tw
.LCOLDE30:
	.section	.text.is_even_tw
.LHOTE30:
	.section	.text.unlikely.deserialize_affine,"ax",@progbits
.LCOLDB31:
	.section	.text.deserialize_affine,"ax",@progbits
.LHOTB31:
	.p2align 4,,15
	.globl	deserialize_affine
	.hidden	deserialize_affine
	.type	deserialize_affine, @function
deserialize_affine:
.LFB4682:
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
	leaq	-272(%rbp), %rcx
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
	movq	%rdi, %rbx
	movq	%rcx, %rdi
	leaq	-144(%rbp), %r13
	leaq	-208(%rbp), %r15
	subq	$352, %rsp
	movq	%rcx, -352(%rbp)
	movq	%rsi, -360(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_sqr@PLT
	movq	-272(%rbp), %rax
	movq	%r13, %rsi
	movq	%r15, %rdi
	movabsq	$72057594037927935, %r12
	leaq	64(%rbx), %r14
	movq	%rax, -144(%rbp)
	movq	-264(%rbp), %rax
	addq	$1, -144(%rbp)
	movq	%rax, -136(%rbp)
	movq	-256(%rbp), %rax
	movq	%rax, -128(%rbp)
	movq	-248(%rbp), %rax
	movq	%rax, -120(%rbp)
	movq	-240(%rbp), %rax
	movq	%rax, -112(%rbp)
	movq	-232(%rbp), %rax
	movq	%rax, -104(%rbp)
	movq	-224(%rbp), %rax
	movq	%rax, -96(%rbp)
	movq	-216(%rbp), %rax
	movq	%rax, -88(%rbp)
	call	p448_sqr@PLT
	movq	%r15, %rsi
	movq	%rbx, %rdi
	movl	$39082, %edx
	call	p448_mulw@PLT
	vmovdqa	-272(%rbp), %ymm0
	movq	%r12, %rdi
	movq	%r12, %r9
	vmovdqa	.LC2(%rip), %ymm3
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, -144(%rbp)
	movq	-128(%rbp), %rdx
	vmovdqa	-240(%rbp), %ymm0
	andq	-120(%rbp), %rdi
	vmovdqa	.LC0(%rip), %ymm5
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, -112(%rbp)
	movzbl	-81(%rbp), %eax
	addq	%rax, -112(%rbp)
	movq	%rdx, %rsi
	andq	%r12, %rdx
	shrq	$56, %rsi
	vmovdqa	.LC1(%rip), %ymm4
	vpsubq	(%rbx), %ymm5, %ymm7
	addq	%rdi, %rsi
	vpsubq	32(%rbx), %ymm4, %ymm6
	vmovdqu	-120(%rbp), %xmm1
	movq	%rsi, -120(%rbp)
	movq	-136(%rbp), %rsi
	vinserti128	$0x1, -104(%rbp), %ymm1, %ymm0
	vpermq	$27, -112(%rbp), %ymm1
	movq	%rsi, %rdi
	shrq	$56, %rdi
	andq	%r12, %rsi
	addq	%rdi, %rdx
	movq	%rdx, -128(%rbp)
	movq	-144(%rbp), %rdx
	vpand	%ymm3, %ymm1, %ymm2
	vpermq	$27, %ymm0, %ymm1
	movq	%rdx, %rdi
	andq	%r12, %rdx
	shrq	$56, %rdi
	addq	%rdx, %rax
	addq	%rdi, %rsi
	movq	%rax, -144(%rbp)
	movl	$56, %eax
	vpsrlq	$56, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm2, %ymm1
	vpermq	$27, %ymm1, %ymm1
	movq	%rsi, -136(%rbp)
	vmovdqa	-144(%rbp), %ymm0
	vpaddq	%ymm1, %ymm1, %ymm1
	vmovdqa	%ymm1, 96(%rbx)
	movzbl	127(%rbx), %esi
	addq	%rsi, 96(%rbx)
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, 64(%rbx)
	vmovdqu	88(%rbx), %xmm0
	vinserti128	$0x1, 104(%rbx), %ymm0, %ymm2
	vpermq	$27, 96(%rbx), %ymm0
	movq	80(%rbx), %rdi
	andq	88(%rbx), %r9
	movq	%rdi, %rdx
	andq	%r12, %rdi
	shrq	$56, %rdx
	vpand	%ymm3, %ymm0, %ymm1
	addq	%r9, %rdx
	vpermq	$27, %ymm2, %ymm0
	movq	%rdx, 88(%rbx)
	movq	72(%rbx), %rdx
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	movq	%rdx, %r9
	andq	%r12, %rdx
	shrq	$56, %r9
	addq	%r9, %rdi
	vpaddq	%ymm0, %ymm6, %ymm0
	movq	%r12, %r9
	movq	%rdi, 80(%rbx)
	movzbl	71(%rbx), %edi
	vmovdqa	%ymm0, -112(%rbp)
	addq	%rdi, %rdx
	movq	%rdx, 72(%rbx)
	movq	%r12, %rdx
	andq	64(%rbx), %rdx
	addq	%rdx, %rsi
	movzbl	-81(%rbp), %edx
	movq	%rsi, 64(%rbx)
	addq	%rdx, -112(%rbp)
	vpaddq	64(%rbx), %ymm7, %ymm7
	vmovdqa	%ymm7, -144(%rbp)
	movq	-128(%rbp), %rsi
	andq	-120(%rbp), %r9
	movq	%rsi, %rdi
	shrq	$56, %rdi
	vmovdqu	-120(%rbp), %xmm0
	addq	%r9, %rdi
	andq	%r12, %rsi
	movq	%rdi, -120(%rbp)
	movq	-136(%rbp), %rdi
	vinserti128	$0x1, -104(%rbp), %ymm0, %ymm2
	movq	%rdi, %r9
	vpermq	$27, -112(%rbp), %ymm0
	shrq	$56, %r9
	andq	%r12, %rdi
	addq	%r9, %rsi
	movq	%rsi, -128(%rbp)
	movq	-144(%rbp), %rsi
	vpand	%ymm3, %ymm0, %ymm1
	movq	%rsi, %r9
	andq	%r12, %rsi
	addq	%rsi, %rdx
	vpermq	$27, %ymm2, %ymm0
	movq	%rdx, -144(%rbp)
	movq	-272(%rbp), %rdx
	shrq	$56, %r9
	addq	%r9, %rdi
	movq	%r12, %r9
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	movq	%rdx, 64(%rbx)
	movq	-264(%rbp), %rdx
	movq	%rdi, -136(%rbp)
	vmovdqa	%ymm0, -112(%rbp)
	movq	%rdx, 8(%r14)
	movq	-256(%rbp), %rdx
	movq	%rdx, 16(%r14)
	movq	-248(%rbp), %rdx
	vmovdqa	%ymm3, -400(%rbp)
	movq	%rdx, 24(%r14)
	movq	-240(%rbp), %rdx
	movq	%rdx, 32(%r14)
	movq	-232(%rbp), %rdx
	movq	%rdx, 40(%r14)
	movq	-224(%rbp), %rdx
	movq	%rdx, 48(%r14)
	movq	-216(%rbp), %rdx
	movq	%rdx, 56(%r14)
	vmovdqa	96(%rbx), %ymm0
	vpsubq	64(%rbx), %ymm5, %ymm5
	vmovdqa	%ymm5, (%rbx)
	movq	16(%rbx), %rsi
	andq	24(%rbx), %r9
	vpsubq	%ymm0, %ymm4, %ymm4
	vmovdqa	%ymm4, 32(%rbx)
	movzbl	63(%rbx), %edi
	addq	%rdi, 32(%rbx)
	movq	%rsi, %rdx
	andq	%r12, %rsi
	shrq	$56, %rdx
	addq	%r9, %rdx
	vmovdqu	24(%rbx), %xmm0
	movq	%rdx, 24(%rbx)
	movq	8(%rbx), %rdx
	vinserti128	$0x1, 40(%rbx), %ymm0, %ymm2
	movq	%rdx, %r9
	vpermq	$27, 32(%rbx), %ymm0
	shrq	$56, %r9
	andq	%r12, %rdx
	addq	%r9, %rsi
	movq	%rsi, 16(%rbx)
	shrx	%rax, (%rbx), %rsi
	vpand	%ymm3, %ymm0, %ymm1
	vpermq	$27, %ymm2, %ymm0
	addq	%rsi, %rdx
	movq	%rbx, %rsi
	movq	%rdx, 8(%rbx)
	movq	%r12, %rdx
	andq	(%rbx), %rdx
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	leaq	1(%rdi,%rdx), %rdx
	movq	%r14, %rdi
	vmovdqa	%ymm0, 32(%rbx)
	movq	%rdx, (%rbx)
	movq	%r13, %rdx
	vzeroupper
	call	p448_mul@PLT
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	p448_sqr@PLT
	leaq	-336(%rbp), %rax
	movq	%r14, %rdx
	movq	%r15, %rsi
	movq	%rax, %rdi
	movq	%rax, -344(%rbp)
	call	p448_mul@PLT
	movq	-344(%rbp), %rdx
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	p448_mul@PLT
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	p448_isr@PLT
	movq	%r13, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	p448_mul@PLT
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	p448_sqr@PLT
	movq	-344(%rbp), %rsi
	movq	%r15, %rdx
	movq	%r13, %rdi
	call	p448_mul@PLT
	movq	-344(%rbp), %rdi
	movq	%r13, %rdx
	movq	%rbx, %rsi
	call	p448_mul@PLT
	vmovdqa	64(%rbx), %ymm0
	movq	%r12, %r9
	movq	-360(%rbp), %r8
	vmovdqa	-400(%rbp), %ymm3
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, -208(%rbp)
	movq	-192(%rbp), %rsi
	vmovdqa	96(%rbx), %ymm0
	andq	-184(%rbp), %r9
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, -176(%rbp)
	movzbl	-145(%rbp), %edi
	addq	%rdi, -176(%rbp)
	movq	%rsi, %rdx
	andq	%r12, %rsi
	shrq	$56, %rdx
	addq	%r9, %rdx
	vmovdqu	-184(%rbp), %xmm1
	movq	%rdx, -184(%rbp)
	movq	-200(%rbp), %rdx
	vinserti128	$0x1, -168(%rbp), %ymm1, %ymm1
	movq	%rdx, %r9
	andq	%r12, %rdx
	shrq	$56, %r9
	addq	%r9, %rsi
	vpermq	$27, %ymm1, %ymm1
	movq	%rsi, -192(%rbp)
	movq	-208(%rbp), %rsi
	vpsrlq	$56, %ymm1, %ymm2
	vpermq	$27, -176(%rbp), %ymm1
	movq	%rsi, %r9
	shrq	$56, %r9
	andq	%r12, %rsi
	addq	%rsi, %rdi
	addq	%r9, %rdx
	movq	%r8, %rsi
	movq	%rdx, -200(%rbp)
	movq	%rdi, -208(%rbp)
	movq	%r15, %rdx
	movq	%rbx, %rdi
	vpand	%ymm3, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm2, %ymm1
	vpermq	$27, %ymm1, %ymm1
	vmovdqa	%ymm1, -176(%rbp)
	vzeroupper
	call	p448_mul@PLT
	movq	-352(%rbp), %rcx
	movq	%r13, %rdx
	movq	%r14, %rdi
	addq	$1, -272(%rbp)
	movq	%rcx, %rsi
	call	p448_mul@PLT
	subq	$1, -336(%rbp)
	movq	%r12, %rsi
	vmovdqa	-400(%rbp), %ymm3
	movq	-344(%rbp), %rdi
	vpaddq	-336(%rbp), %ymm3, %ymm0
	vmovdqa	%ymm0, -336(%rbp)
	movq	-320(%rbp), %rcx
	vmovdqa	.LC23(%rip), %ymm0
	andq	-312(%rbp), %rsi
	vpaddq	-304(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -304(%rbp)
	movzbl	-273(%rbp), %edx
	addq	%rdx, -304(%rbp)
	movq	%rcx, %rax
	andq	%r12, %rcx
	shrq	$56, %rax
	addq	%rsi, %rax
	vmovdqu	-312(%rbp), %xmm1
	movq	%rax, -312(%rbp)
	movq	-328(%rbp), %rax
	vinserti128	$0x1, -296(%rbp), %ymm1, %ymm1
	movq	%rax, %rsi
	andq	%r12, %rax
	shrq	$56, %rsi
	addq	%rsi, %rcx
	vpermq	$27, %ymm1, %ymm0
	movq	%rcx, -320(%rbp)
	movq	-336(%rbp), %rcx
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, -304(%rbp), %ymm0
	movq	%rcx, %rsi
	shrq	$56, %rsi
	andq	%rcx, %r12
	addq	%rsi, %rax
	addq	%rdx, %r12
	movq	%rax, -328(%rbp)
	movq	%r12, -336(%rbp)
	vpand	%ymm3, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, -304(%rbp)
	vzeroupper
	call	p448_is_zero@PLT
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L94
	addq	$352, %rsp
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
.L94:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4682:
	.size	deserialize_affine, .-deserialize_affine
	.section	.text.unlikely.deserialize_affine
.LCOLDE31:
	.section	.text.deserialize_affine
.LHOTE31:
	.section	.text.unlikely.deserialize_and_twist_approx,"ax",@progbits
.LCOLDB32:
	.section	.text.deserialize_and_twist_approx,"ax",@progbits
.LHOTB32:
	.p2align 4,,15
	.globl	deserialize_and_twist_approx
	.hidden	deserialize_and_twist_approx
	.type	deserialize_and_twist_approx, @function
deserialize_and_twist_approx:
.LFB4683:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	leaq	128(%rdi), %rcx
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	-208(%rbp), %r14
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, %rbx
	movq	%rcx, %rdi
	leaq	64(%rbx), %r15
	leaq	256(%rbx), %r12
	subq	$320, %rsp
	movq	%rsi, -232(%rbp)
	movq	%rcx, -216(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_sqr@PLT
	movq	-216(%rbp), %rcx
	movq	128(%rbx), %rax
	movq	%r15, %rsi
	movq	%r14, %rdi
	movq	%rax, 64(%rbx)
	movq	8(%rcx), %rax
	movq	%rcx, -224(%rbp)
	movq	%rax, 8(%r15)
	movq	16(%rcx), %rax
	movq	%rax, 16(%r15)
	movq	24(%rcx), %rax
	movq	%rax, 24(%r15)
	movq	32(%rcx), %rax
	movq	%rax, 32(%r15)
	movq	40(%rcx), %rax
	movq	%rax, 40(%r15)
	movq	48(%rcx), %rax
	movq	%rax, 48(%r15)
	movq	56(%rcx), %rax
	movq	%rax, 56(%r15)
	addq	$1, 64(%rbx)
	call	p448_sqr@PLT
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movl	$39082, %edx
	call	p448_mulw@PLT
	vmovdqa	128(%rbx), %ymm0
	movabsq	$72057594037927935, %rax
	movq	%rax, %r10
	vmovdqa	.LC2(%rip), %ymm3
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, 64(%rbx)
	movq	80(%rbx), %rdi
	vmovdqa	160(%rbx), %ymm0
	andq	88(%rbx), %r10
	vmovdqa	32(%rbx), %ymm6
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, 96(%rbx)
	movzbl	127(%rbx), %esi
	addq	%rsi, 96(%rbx)
	movq	%rdi, %rdx
	andq	%rax, %rdi
	shrq	$56, %rdx
	vmovdqa	.LC0(%rip), %ymm5
	addq	%r10, %rdx
	vmovdqa	.LC1(%rip), %ymm4
	vpsubq	(%rbx), %ymm5, %ymm7
	vmovdqa	%ymm5, -336(%rbp)
	vmovdqa	%ymm7, (%rbx)
	vpsubq	%ymm6, %ymm4, %ymm6
	vmovdqa	%ymm4, -304(%rbp)
	vmovdqa	%ymm6, 32(%rbx)
	vmovdqu	88(%rbx), %xmm1
	movq	%rdx, 88(%rbx)
	movq	72(%rbx), %rdx
	vinserti128	$0x1, 104(%rbx), %ymm1, %ymm0
	movq	%rdx, %r10
	vpermq	$27, 96(%rbx), %ymm1
	shrq	$56, %r10
	andq	%rax, %rdx
	addq	%r10, %rdi
	movq	%rax, %r10
	movq	%rdi, 80(%rbx)
	movzbl	71(%rbx), %edi
	vpand	%ymm3, %ymm1, %ymm2
	vpermq	$27, %ymm0, %ymm1
	addq	%rdi, %rdx
	movq	%rdx, 72(%rbx)
	movq	%rax, %rdx
	andq	64(%rbx), %rdx
	vpsrlq	$56, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm2, %ymm1
	vpermq	$27, %ymm1, %ymm1
	addq	%rdx, %rsi
	vpaddq	%ymm1, %ymm1, %ymm1
	vmovdqa	%ymm1, 288(%rbx)
	movq	%rsi, 64(%rbx)
	movzbl	319(%rbx), %esi
	vmovdqa	64(%rbx), %ymm0
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, 256(%rbx)
	addq	%rsi, 288(%rbx)
	movq	272(%rbx), %rdi
	andq	280(%rbx), %r10
	vmovdqa	%ymm3, -272(%rbp)
	movq	%rdi, %rdx
	andq	%rax, %rdi
	shrq	$56, %rdx
	vmovdqu	280(%rbx), %xmm0
	addq	%r10, %rdx
	movq	%rdx, 280(%rbx)
	movq	264(%rbx), %rdx
	vinserti128	$0x1, 296(%rbx), %ymm0, %ymm2
	movq	%rdx, %r10
	vpermq	$27, 288(%rbx), %ymm0
	shrq	$56, %r10
	andq	%rax, %rdx
	addq	%r10, %rdi
	movq	%rax, %r10
	movq	%rdi, 272(%rbx)
	movzbl	263(%rbx), %edi
	vpand	%ymm3, %ymm0, %ymm1
	vpermq	$27, %ymm2, %ymm0
	addq	%rdi, %rdx
	movq	%rdx, 264(%rbx)
	movq	%rax, %rdx
	andq	256(%rbx), %rdx
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	addq	%rdx, %rsi
	vmovdqa	%ymm0, 288(%rbx)
	vpaddq	%ymm0, %ymm6, %ymm0
	movq	%rsi, 256(%rbx)
	vmovdqa	%ymm0, 96(%rbx)
	movzbl	127(%rbx), %esi
	addq	%rsi, 96(%rbx)
	vpaddq	256(%rbx), %ymm7, %ymm7
	vmovdqa	%ymm7, 64(%rbx)
	movq	80(%rbx), %rdi
	andq	88(%rbx), %r10
	movq	%rdi, %rdx
	vmovdqu	88(%rbx), %xmm0
	shrq	$56, %rdx
	addq	%r10, %rdx
	andq	%rax, %rdi
	vinserti128	$0x1, 104(%rbx), %ymm0, %ymm2
	movq	%rdx, 88(%rbx)
	movq	72(%rbx), %rdx
	vpermq	$27, 96(%rbx), %ymm0
	movq	%rdx, %r10
	andq	%rax, %rdx
	shrq	$56, %r10
	addq	%r10, %rdi
	vpand	%ymm3, %ymm0, %ymm1
	movq	%rdi, 80(%rbx)
	movzbl	71(%rbx), %edi
	vpermq	$27, %ymm2, %ymm0
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	addq	%rdi, %rdx
	movq	%rbx, %rdi
	movq	%rdx, 72(%rbx)
	movq	%rax, %rdx
	vmovdqa	%ymm0, 96(%rbx)
	movq	%rax, -216(%rbp)
	andq	64(%rbx), %rdx
	movq	-224(%rbp), %rcx
	addq	%rdx, %rsi
	movq	%rsi, 64(%rbx)
	movq	%rcx, %rsi
	vzeroupper
	call	p448_sqr@PLT
	movq	-216(%rbp), %rax
	vmovdqa	-336(%rbp), %ymm5
	vmovdqa	-304(%rbp), %ymm4
	vmovdqa	32(%rbx), %ymm0
	vpsubq	(%rbx), %ymm5, %ymm1
	vmovdqa	%ymm1, 256(%rbx)
	movq	272(%rbx), %rsi
	movq	%rax, %r10
	vpsubq	%ymm0, %ymm4, %ymm0
	andq	280(%rbx), %r10
	vmovdqa	%ymm0, 288(%rbx)
	movzbl	319(%rbx), %edi
	vmovdqa	%ymm5, -368(%rbp)
	addq	%rdi, 288(%rbx)
	movq	%rsi, %rdx
	andq	%rax, %rsi
	shrq	$56, %rdx
	vmovdqa	-272(%rbp), %ymm3
	addq	%r10, %rdx
	vmovdqa	%ymm4, -336(%rbp)
	movq	%rax, -272(%rbp)
	vmovdqa	%ymm3, -304(%rbp)
	vmovdqu	280(%rbx), %xmm0
	movq	%rdx, 280(%rbx)
	movq	264(%rbx), %rdx
	vinserti128	$0x1, 296(%rbx), %ymm0, %ymm2
	movq	%rdx, %r10
	vpermq	$27, 288(%rbx), %ymm0
	shrq	$56, %r10
	andq	%rax, %rdx
	addq	%r10, %rsi
	movq	%rsi, 272(%rbx)
	movzbl	263(%rbx), %esi
	vpand	%ymm3, %ymm0, %ymm1
	vpermq	$27, %ymm2, %ymm0
	addq	%rsi, %rdx
	movq	sqrt_d_minus_1@GOTPCREL(%rip), %rsi
	movq	%rdx, 264(%rbx)
	movq	%rax, %rdx
	andq	256(%rbx), %rdx
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	leaq	1(%rdi,%rdx), %rdx
	movq	%rbx, %rdi
	vmovdqa	%ymm0, 288(%rbx)
	movq	%rdx, 256(%rbx)
	movq	%r12, %rdx
	vzeroupper
	leaq	192(%rbx), %r13
	call	p448_mul@PLT
	movq	%r15, %rdx
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	p448_mul@PLT
	movq	%r15, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
	movq	%r13, %rdx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	p448_mul@PLT
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
	movq	%r13, %rdx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	p448_mul@PLT
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	p448_isr@PLT
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	p448_mul@PLT
	leaq	-144(%rbp), %rax
	movq	%r14, %rsi
	movq	%rax, %rdi
	movq	%rax, -216(%rbp)
	call	p448_sqr@PLT
	movq	-216(%rbp), %rdx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	p448_mul@PLT
	movq	%r12, %rdx
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
	movq	-232(%rbp), %r9
	movq	-272(%rbp), %rax
	movl	$56, %ecx
	vmovdqa	-304(%rbp), %ymm3
	vmovdqa	(%r9), %ymm0
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, (%rbx)
	movq	16(%rbx), %rsi
	vmovdqa	32(%r9), %ymm0
	movq	%rax, %r9
	andq	24(%rbx), %r9
	movq	%rsi, %rdx
	andq	%rax, %rsi
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, 32(%rbx)
	movzbl	63(%rbx), %edi
	addq	%rdi, 32(%rbx)
	shrq	$56, %rdx
	addq	%r9, %rdx
	vmovdqu	24(%rbx), %xmm0
	movq	%rdx, 24(%rbx)
	movq	8(%rbx), %rdx
	vinserti128	$0x1, 40(%rbx), %ymm0, %ymm2
	movq	%rdx, %r9
	vpermq	$27, 32(%rbx), %ymm0
	shrq	$56, %r9
	andq	%rax, %rdx
	addq	%r9, %rsi
	movq	%rsi, 16(%rbx)
	shrx	%rcx, (%rbx), %rsi
	vpand	%ymm3, %ymm0, %ymm1
	vpermq	$27, %ymm2, %ymm0
	addq	%rsi, %rdx
	movq	%r12, %rsi
	movq	%rdx, 8(%rbx)
	movq	%rax, %rdx
	andq	(%rbx), %rdx
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	addq	%rdx, %rdi
	movq	%rbx, %rdx
	vmovdqa	%ymm0, 32(%rbx)
	movq	%rdi, (%rbx)
	movq	%r14, %rdi
	vzeroupper
	call	p448_mul@PLT
	movq	-224(%rbp), %rcx
	movq	128(%rbx), %rdx
	vmovdqa	-336(%rbp), %ymm4
	vmovdqa	-368(%rbp), %ymm5
	movq	%rdx, (%rbx)
	movq	8(%rcx), %rdx
	vmovdqa	-304(%rbp), %ymm3
	movq	%rdx, 8(%rbx)
	movq	16(%rcx), %rdx
	movq	%rdx, 16(%rbx)
	movq	24(%rcx), %rdx
	movq	%rdx, 24(%rbx)
	movq	32(%rcx), %rdx
	vpsubq	(%rbx), %ymm5, %ymm5
	vmovdqa	%ymm5, -144(%rbp)
	movq	-128(%rbp), %rsi
	movq	%rdx, 32(%rbx)
	movq	40(%rcx), %rdx
	movq	%rdx, 40(%rbx)
	movq	48(%rcx), %rdx
	movq	%rdx, 48(%rbx)
	movq	56(%rcx), %rdx
	movq	%rdx, 56(%rbx)
	movq	%rsi, %rdx
	vmovdqa	32(%rbx), %ymm0
	shrq	$56, %rdx
	vpsubq	%ymm0, %ymm4, %ymm4
	vmovdqa	%ymm4, -112(%rbp)
	movzbl	-81(%rbp), %edi
	addq	%rdi, -112(%rbp)
	vmovdqu	-120(%rbp), %xmm1
	vinserti128	$0x1, -104(%rbp), %ymm1, %ymm1
	vpermq	$27, %ymm1, %ymm1
	vpsrlq	$56, %ymm1, %ymm2
	vpermq	$27, -112(%rbp), %ymm1
	vpand	%ymm3, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm2, %ymm1
	vpermq	$27, %ymm1, %ymm1
	vmovdqa	%ymm1, -112(%rbp)
	movq	-272(%rbp), %rax
	movq	%rax, %r9
	andq	-120(%rbp), %r9
	andq	%rax, %rsi
	addq	%r9, %rdx
	movq	%rdx, -120(%rbp)
	movq	-136(%rbp), %rdx
	movq	%rdx, %r9
	andq	%rax, %rdx
	shrq	$56, %r9
	addq	%r9, %rsi
	movq	%rsi, -128(%rbp)
	movq	-144(%rbp), %rsi
	movq	%rsi, %r9
	andq	%rax, %rsi
	shrq	$56, %r9
	addq	%r9, %rdx
	movq	%rdx, -136(%rbp)
	leaq	1(%rdi,%rsi), %rdx
	movq	-216(%rbp), %rsi
	movq	%rbx, %rdi
	movq	%rdx, -144(%rbp)
	movq	%r14, %rdx
	vzeroupper
	call	p448_mul@PLT
	movq	%r15, %rdx
	movq	%r12, %rsi
	movq	%r14, %rdi
	call	p448_mul@PLT
	movq	-224(%rbp), %rcx
	addq	$1, 128(%rbx)
	movq	%r14, %rdx
	movq	%r15, %rdi
	movq	%rcx, %rsi
	call	p448_mul@PLT
	subq	$1, 192(%rbx)
	vmovdqa	-304(%rbp), %ymm3
	movq	-272(%rbp), %rax
	vpaddq	192(%rbx), %ymm3, %ymm0
	vmovdqa	%ymm0, 192(%rbx)
	movq	208(%rbx), %rcx
	vmovdqa	.LC23(%rip), %ymm0
	movq	%rax, %rdi
	andq	216(%rbx), %rdi
	vpaddq	224(%rbx), %ymm0, %ymm0
	vmovdqa	%ymm0, 224(%rbx)
	movzbl	255(%rbx), %esi
	addq	%rsi, 224(%rbx)
	movq	%rcx, %rdx
	andq	%rax, %rcx
	shrq	$56, %rdx
	addq	%rdi, %rdx
	vmovdqu	216(%rbx), %xmm1
	movq	%rdx, 216(%rbx)
	movq	200(%rbx), %rdx
	vinserti128	$0x1, 232(%rbx), %ymm1, %ymm1
	movq	%rdx, %rdi
	andq	%rax, %rdx
	andq	192(%rbx), %rax
	shrq	$56, %rdi
	addq	%rdi, %rcx
	movq	%r13, %rdi
	vpermq	$27, %ymm1, %ymm0
	movq	%rcx, 208(%rbx)
	movzbl	199(%rbx), %ecx
	addq	%rsi, %rax
	movq	%rax, 192(%rbx)
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, 224(%rbx), %ymm0
	addq	%rcx, %rdx
	movq	%rdx, 200(%rbx)
	vpand	%ymm3, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, 224(%rbx)
	vzeroupper
	call	p448_is_zero@PLT
	leaq	144(%rbx), %rdi
	movq	%rax, %rdx
	movl	%ebx, %eax
	movq	$1, 128(%rbx)
	movq	$0, 136(%rbx)
	andq	$-8, %rdi
	movq	$0, 184(%rbx)
	subl	%edi, %eax
	leal	192(%rax), %ecx
	xorl	%eax, %eax
	shrl	$3, %ecx
	rep stosq
	movq	(%rbx), %rax
	movq	%rax, 192(%rbx)
	movq	8(%rbx), %rax
	movq	%rax, 8(%r13)
	movq	16(%rbx), %rax
	movq	%rax, 16(%r13)
	movq	24(%rbx), %rax
	movq	%rax, 24(%r13)
	movq	32(%rbx), %rax
	movq	%rax, 32(%r13)
	movq	40(%rbx), %rax
	movq	%rax, 40(%r13)
	movq	48(%rbx), %rax
	movq	%rax, 48(%r13)
	movq	56(%rbx), %rax
	movq	%rax, 56(%r13)
	movq	64(%rbx), %rax
	movq	%rax, 256(%rbx)
	movq	8(%r15), %rax
	movq	%rax, 8(%r12)
	movq	16(%r15), %rax
	movq	%rax, 16(%r12)
	movq	24(%r15), %rax
	movq	%rax, 24(%r12)
	movq	32(%r15), %rax
	movq	%rax, 32(%r12)
	movq	40(%r15), %rax
	movq	%rax, 40(%r12)
	movq	48(%r15), %rax
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	movq	%rax, 48(%r12)
	movq	56(%r15), %rax
	movq	%rax, 56(%r12)
	jne	.L99
	addq	$320, %rsp
	movq	%rdx, %rax
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
.L99:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4683:
	.size	deserialize_and_twist_approx, .-deserialize_and_twist_approx
	.section	.text.unlikely.deserialize_and_twist_approx
.LCOLDE32:
	.section	.text.deserialize_and_twist_approx
.LHOTE32:
	.section	.text.unlikely.set_identity_extensible,"ax",@progbits
.LCOLDB33:
	.section	.text.set_identity_extensible,"ax",@progbits
.LHOTB33:
	.p2align 4,,15
	.globl	set_identity_extensible
	.hidden	set_identity_extensible
	.type	set_identity_extensible, @function
set_identity_extensible:
.LFB4697:
	.cfi_startproc
	movq	%rdi, %rdx
	movq	$0, (%rdi)
	movq	$0, 8(%rdi)
	movq	$0, 56(%rdi)
	leaq	72(%rdi), %r8
	leaq	16(%rdi), %rdi
	movl	%edx, %ecx
	xorl	%eax, %eax
	leaq	136(%rdx), %rsi
	andq	$-8, %rdi
	subl	%edi, %ecx
	addl	$64, %ecx
	shrl	$3, %ecx
	rep stosq
	leaq	80(%rdx), %rdi
	movq	$1, 64(%rdx)
	movq	$0, 72(%rdx)
	movq	$0, 120(%rdx)
	andq	$-8, %rdi
	subq	%rdi, %r8
	leal	56(%r8), %ecx
	leaq	200(%rdx), %r8
	shrl	$3, %ecx
	rep stosq
	leaq	144(%rdx), %rdi
	movq	$1, 128(%rdx)
	movq	$0, 136(%rdx)
	movq	$0, 184(%rdx)
	andq	$-8, %rdi
	subq	%rdi, %rsi
	leal	56(%rsi), %ecx
	leaq	264(%rdx), %rsi
	shrl	$3, %ecx
	rep stosq
	leaq	208(%rdx), %rdi
	movq	$0, 192(%rdx)
	movq	$0, 200(%rdx)
	movq	$0, 248(%rdx)
	andq	$-8, %rdi
	subq	%rdi, %r8
	leal	56(%r8), %ecx
	shrl	$3, %ecx
	rep stosq
	leaq	272(%rdx), %rdi
	movq	$0, 256(%rdx)
	movq	$0, 264(%rdx)
	movq	$0, 312(%rdx)
	andq	$-8, %rdi
	subq	%rdi, %rsi
	leal	56(%rsi), %ecx
	shrl	$3, %ecx
	rep stosq
	ret
	.cfi_endproc
.LFE4697:
	.size	set_identity_extensible, .-set_identity_extensible
	.section	.text.unlikely.set_identity_extensible
.LCOLDE33:
	.section	.text.set_identity_extensible
.LHOTE33:
	.section	.text.unlikely.set_identity_tw_extensible,"ax",@progbits
.LCOLDB34:
	.section	.text.set_identity_tw_extensible,"ax",@progbits
.LHOTB34:
	.p2align 4,,15
	.globl	set_identity_tw_extensible
	.hidden	set_identity_tw_extensible
	.type	set_identity_tw_extensible, @function
set_identity_tw_extensible:
.LFB4685:
	.cfi_startproc
	movq	%rdi, %rdx
	movq	$0, (%rdi)
	movq	$0, 8(%rdi)
	movq	$0, 56(%rdi)
	leaq	72(%rdi), %r8
	leaq	16(%rdi), %rdi
	movl	%edx, %ecx
	xorl	%eax, %eax
	leaq	136(%rdx), %rsi
	andq	$-8, %rdi
	subl	%edi, %ecx
	addl	$64, %ecx
	shrl	$3, %ecx
	rep stosq
	leaq	80(%rdx), %rdi
	movq	$1, 64(%rdx)
	movq	$0, 72(%rdx)
	movq	$0, 120(%rdx)
	andq	$-8, %rdi
	subq	%rdi, %r8
	leal	56(%r8), %ecx
	leaq	200(%rdx), %r8
	shrl	$3, %ecx
	rep stosq
	leaq	144(%rdx), %rdi
	movq	$1, 128(%rdx)
	movq	$0, 136(%rdx)
	movq	$0, 184(%rdx)
	andq	$-8, %rdi
	subq	%rdi, %rsi
	leal	56(%rsi), %ecx
	leaq	264(%rdx), %rsi
	shrl	$3, %ecx
	rep stosq
	leaq	208(%rdx), %rdi
	movq	$0, 192(%rdx)
	movq	$0, 200(%rdx)
	movq	$0, 248(%rdx)
	andq	$-8, %rdi
	subq	%rdi, %r8
	leal	56(%r8), %ecx
	shrl	$3, %ecx
	rep stosq
	leaq	272(%rdx), %rdi
	movq	$0, 256(%rdx)
	movq	$0, 264(%rdx)
	movq	$0, 312(%rdx)
	andq	$-8, %rdi
	subq	%rdi, %rsi
	leal	56(%rsi), %ecx
	shrl	$3, %ecx
	rep stosq
	ret
	.cfi_endproc
.LFE4685:
	.size	set_identity_tw_extensible, .-set_identity_tw_extensible
	.section	.text.unlikely.set_identity_tw_extensible
.LCOLDE34:
	.section	.text.set_identity_tw_extensible
.LHOTE34:
	.section	.text.unlikely.set_identity_affine,"ax",@progbits
.LCOLDB35:
	.section	.text.set_identity_affine,"ax",@progbits
.LHOTB35:
	.p2align 4,,15
	.globl	set_identity_affine
	.hidden	set_identity_affine
	.type	set_identity_affine, @function
set_identity_affine:
.LFB4686:
	.cfi_startproc
	movq	$0, (%rdi)
	movq	$0, 8(%rdi)
	movq	%rdi, %rdx
	movq	$0, 56(%rdi)
	leaq	72(%rdi), %rsi
	leaq	16(%rdi), %rdi
	movl	%edx, %ecx
	xorl	%eax, %eax
	andq	$-8, %rdi
	subl	%edi, %ecx
	addl	$64, %ecx
	shrl	$3, %ecx
	rep stosq
	leaq	80(%rdx), %rdi
	movq	$1, 64(%rdx)
	movq	$0, 72(%rdx)
	movq	$0, 120(%rdx)
	andq	$-8, %rdi
	subq	%rdi, %rsi
	leal	56(%rsi), %ecx
	shrl	$3, %ecx
	rep stosq
	ret
	.cfi_endproc
.LFE4686:
	.size	set_identity_affine, .-set_identity_affine
	.section	.text.unlikely.set_identity_affine
.LCOLDE35:
	.section	.text.set_identity_affine
.LHOTE35:
	.section	.text.unlikely.eq_affine,"ax",@progbits
.LCOLDB36:
	.section	.text.eq_affine,"ax",@progbits
.LHOTB36:
	.p2align 4,,15
	.globl	eq_affine
	.hidden	eq_affine
	.type	eq_affine, @function
eq_affine:
.LFB4687:
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
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movq	%rsi, %r15
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movabsq	$72057594037927935, %rbx
	leaq	-144(%rbp), %r14
	movq	%rdi, %r13
	subq	$192, %rsp
	vmovdqa	.LC1(%rip), %ymm6
	vmovdqa	32(%rdi), %ymm0
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	vpsubq	32(%rsi), %ymm0, %ymm0
	vpaddq	%ymm6, %ymm0, %ymm0
	vmovdqa	%ymm0, -112(%rbp)
	movzbl	-81(%rbp), %eax
	vmovdqa	.LC0(%rip), %ymm4
	addq	%rax, -112(%rbp)
	vmovdqa	%ymm6, -208(%rbp)
	vmovdqa	(%rdi), %ymm1
	movq	%r14, %rdi
	vmovdqa	.LC2(%rip), %ymm5
	vpsubq	(%rsi), %ymm1, %ymm1
	vpaddq	%ymm4, %ymm1, %ymm1
	vmovdqa	%ymm1, -144(%rbp)
	movq	-128(%rbp), %rdx
	movq	%rbx, %rsi
	vmovdqa	%ymm4, -240(%rbp)
	andq	-120(%rbp), %rsi
	vmovdqa	%ymm5, -176(%rbp)
	movq	%rdx, %rcx
	andq	%rbx, %rdx
	vmovdqu	-120(%rbp), %xmm1
	shrq	$56, %rcx
	addq	%rsi, %rcx
	vinserti128	$0x1, -104(%rbp), %ymm1, %ymm3
	vpermq	$27, -112(%rbp), %ymm1
	vpand	%ymm5, %ymm1, %ymm2
	vpermq	$27, %ymm3, %ymm1
	vpsrlq	$56, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm2, %ymm1
	vpermq	$27, %ymm1, %ymm1
	vmovdqa	%ymm1, -112(%rbp)
	movq	%rcx, -120(%rbp)
	movq	-136(%rbp), %rcx
	movq	%rcx, %rsi
	andq	%rbx, %rcx
	shrq	$56, %rsi
	addq	%rsi, %rdx
	movq	%rdx, -128(%rbp)
	movq	-144(%rbp), %rdx
	movq	%rdx, %rsi
	andq	%rbx, %rdx
	shrq	$56, %rsi
	addq	%rdx, %rax
	addq	%rsi, %rcx
	movq	%rax, -144(%rbp)
	movq	%rcx, -136(%rbp)
	vzeroupper
	call	p448_is_zero@PLT
	vmovdqa	96(%r13), %ymm0
	movq	%rax, %r12
	movq	%rbx, %rsi
	vmovdqa	-208(%rbp), %ymm6
	movq	%r14, %rdi
	vpsubq	96(%r15), %ymm0, %ymm0
	vmovdqa	-240(%rbp), %ymm4
	vpaddq	%ymm6, %ymm0, %ymm1
	vmovdqa	%ymm1, -112(%rbp)
	movzbl	-81(%rbp), %eax
	addq	%rax, -112(%rbp)
	vpsubq	64(%r15), %ymm4, %ymm4
	vpaddq	64(%r13), %ymm4, %ymm4
	vmovdqa	%ymm4, -144(%rbp)
	movq	-128(%rbp), %rcx
	andq	-120(%rbp), %rsi
	vmovdqa	-176(%rbp), %ymm5
	movq	%rcx, %rdx
	andq	%rbx, %rcx
	vmovdqu	-120(%rbp), %xmm1
	shrq	$56, %rdx
	addq	%rsi, %rdx
	vinserti128	$0x1, -104(%rbp), %ymm1, %ymm1
	movq	%rdx, -120(%rbp)
	movq	-136(%rbp), %rdx
	movq	%rdx, %rsi
	andq	%rbx, %rdx
	vpermq	$27, %ymm1, %ymm0
	shrq	$56, %rsi
	addq	%rsi, %rcx
	movq	%rcx, -128(%rbp)
	movq	-144(%rbp), %rcx
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, -112(%rbp), %ymm0
	movq	%rcx, %rsi
	andq	%rcx, %rbx
	shrq	$56, %rsi
	addq	%rax, %rbx
	addq	%rsi, %rdx
	movq	%rbx, -144(%rbp)
	vpand	%ymm5, %ymm0, %ymm0
	movq	%rdx, -136(%rbp)
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, -112(%rbp)
	vzeroupper
	call	p448_is_zero@PLT
	andq	%r12, %rax
	movq	-56(%rbp), %rdi
	xorq	%fs:40, %rdi
	jne	.L107
	addq	$192, %rsp
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
.L107:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4687:
	.size	eq_affine, .-eq_affine
	.section	.text.unlikely.eq_affine
.LCOLDE36:
	.section	.text.eq_affine
.LHOTE36:
	.section	.text.unlikely.eq_extensible,"ax",@progbits
.LCOLDB37:
	.section	.text.eq_extensible,"ax",@progbits
.LHOTB37:
	.p2align 4,,15
	.globl	eq_extensible
	.hidden	eq_extensible
	.type	eq_extensible, @function
eq_extensible:
.LFB4688:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movq	%rdi, %rdx
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	leaq	-144(%rbp), %r9
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	128(%rsi), %r10
	pushq	%rbx
	movq	%rdi, %r14
	movq	%rsi, %r13
	movq	%r9, %rdi
	subq	$352, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%r10, %rsi
	movq	%r10, -304(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%r9, -296(%rbp)
	leaq	-208(%rbp), %r12
	movabsq	$72057594037927935, %rbx
	call	p448_mul@PLT
	leaq	128(%r14), %r8
	movq	%r13, %rdx
	movq	%r12, %rdi
	leaq	-272(%rbp), %r15
	movq	%r8, %rsi
	movq	%r8, -288(%rbp)
	call	p448_mul@PLT
	vmovdqa	.LC0(%rip), %ymm4
	movq	%rbx, %rdi
	vmovdqa	.LC1(%rip), %ymm6
	vmovdqa	-112(%rbp), %ymm0
	vmovdqa	-144(%rbp), %ymm1
	vpsubq	-176(%rbp), %ymm0, %ymm0
	vpaddq	%ymm6, %ymm0, %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	vpsubq	-208(%rbp), %ymm1, %ymm1
	movzbl	-209(%rbp), %eax
	vpaddq	%ymm4, %ymm1, %ymm1
	vmovdqa	%ymm1, -272(%rbp)
	movq	-256(%rbp), %rdx
	addq	%rax, -240(%rbp)
	andq	-248(%rbp), %rdi
	vmovdqa	%ymm4, -400(%rbp)
	vmovdqa	.LC2(%rip), %ymm5
	movq	%rdx, %rsi
	andq	%rbx, %rdx
	vmovdqa	%ymm6, -368(%rbp)
	shrq	$56, %rsi
	vmovdqa	%ymm5, -336(%rbp)
	addq	%rdi, %rsi
	vmovdqu	-248(%rbp), %xmm1
	movq	%rsi, -248(%rbp)
	movq	-264(%rbp), %rsi
	vinserti128	$0x1, -232(%rbp), %ymm1, %ymm3
	vpermq	$27, -240(%rbp), %ymm1
	movq	%rsi, %rdi
	shrq	$56, %rdi
	andq	%rbx, %rsi
	addq	%rdi, %rdx
	movq	%rdx, -256(%rbp)
	movq	-272(%rbp), %rdx
	vpand	%ymm5, %ymm1, %ymm2
	vpermq	$27, %ymm3, %ymm1
	movq	%rdx, %rdi
	andq	%rbx, %rdx
	shrq	$56, %rdi
	addq	%rdx, %rax
	addq	%rdi, %rsi
	movq	%r15, %rdi
	movq	%rax, -272(%rbp)
	vpsrlq	$56, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm2, %ymm1
	vpermq	$27, %ymm1, %ymm1
	movq	%rsi, -264(%rbp)
	vmovdqa	%ymm1, -240(%rbp)
	vzeroupper
	call	p448_is_zero@PLT
	movq	-304(%rbp), %r10
	leaq	64(%r14), %rdx
	movq	-296(%rbp), %r9
	movq	%rax, -280(%rbp)
	movq	%r10, %rsi
	movq	%r9, %rdi
	call	p448_mul@PLT
	movq	-288(%rbp), %r8
	leaq	64(%r13), %rdx
	movq	%r12, %rdi
	movq	%r8, %rsi
	call	p448_mul@PLT
	vmovdqa	-112(%rbp), %ymm0
	movq	%rbx, %rsi
	movq	%r15, %rdi
	vmovdqa	-368(%rbp), %ymm6
	vpsubq	-176(%rbp), %ymm0, %ymm0
	vmovdqa	-400(%rbp), %ymm4
	vpaddq	%ymm6, %ymm0, %ymm1
	vmovdqa	%ymm1, -240(%rbp)
	movzbl	-209(%rbp), %eax
	addq	%rax, -240(%rbp)
	vpsubq	-208(%rbp), %ymm4, %ymm4
	vpaddq	-144(%rbp), %ymm4, %ymm4
	vmovdqa	%ymm4, -272(%rbp)
	movq	-256(%rbp), %rcx
	andq	-248(%rbp), %rsi
	vmovdqa	-336(%rbp), %ymm5
	movq	%rcx, %rdx
	andq	%rbx, %rcx
	vmovdqu	-248(%rbp), %xmm1
	shrq	$56, %rdx
	addq	%rsi, %rdx
	vinserti128	$0x1, -232(%rbp), %ymm1, %ymm1
	movq	%rdx, -248(%rbp)
	movq	-264(%rbp), %rdx
	movq	%rdx, %rsi
	andq	%rbx, %rdx
	vpermq	$27, %ymm1, %ymm0
	shrq	$56, %rsi
	addq	%rsi, %rcx
	movq	%rcx, -256(%rbp)
	movq	-272(%rbp), %rcx
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, -240(%rbp), %ymm0
	movq	%rcx, %rsi
	andq	%rcx, %rbx
	shrq	$56, %rsi
	addq	%rax, %rbx
	addq	%rsi, %rdx
	movq	%rbx, -272(%rbp)
	vpand	%ymm5, %ymm0, %ymm0
	movq	%rdx, -264(%rbp)
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	vzeroupper
	call	p448_is_zero@PLT
	andq	-280(%rbp), %rax
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L112
	addq	$352, %rsp
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
.L112:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4688:
	.size	eq_extensible, .-eq_extensible
	.section	.text.unlikely.eq_extensible
.LCOLDE37:
	.section	.text.eq_extensible
.LHOTE37:
	.section	.text.unlikely.eq_tw_extensible,"ax",@progbits
.LCOLDB38:
	.section	.text.eq_tw_extensible,"ax",@progbits
.LHOTB38:
	.p2align 4,,15
	.globl	eq_tw_extensible
	.hidden	eq_tw_extensible
	.type	eq_tw_extensible, @function
eq_tw_extensible:
.LFB4689:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movq	%rdi, %rdx
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	leaq	-144(%rbp), %r9
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	128(%rsi), %r10
	pushq	%rbx
	movq	%rdi, %r14
	movq	%rsi, %r13
	movq	%r9, %rdi
	subq	$352, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%r10, %rsi
	movq	%r10, -304(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%r9, -296(%rbp)
	leaq	-208(%rbp), %r12
	movabsq	$72057594037927935, %rbx
	call	p448_mul@PLT
	leaq	128(%r14), %r8
	movq	%r13, %rdx
	movq	%r12, %rdi
	leaq	-272(%rbp), %r15
	movq	%r8, %rsi
	movq	%r8, -288(%rbp)
	call	p448_mul@PLT
	vmovdqa	.LC0(%rip), %ymm4
	movq	%rbx, %rdi
	vmovdqa	.LC1(%rip), %ymm6
	vmovdqa	-112(%rbp), %ymm0
	vmovdqa	-144(%rbp), %ymm1
	vpsubq	-176(%rbp), %ymm0, %ymm0
	vpaddq	%ymm6, %ymm0, %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	vpsubq	-208(%rbp), %ymm1, %ymm1
	movzbl	-209(%rbp), %eax
	vpaddq	%ymm4, %ymm1, %ymm1
	vmovdqa	%ymm1, -272(%rbp)
	movq	-256(%rbp), %rdx
	addq	%rax, -240(%rbp)
	andq	-248(%rbp), %rdi
	vmovdqa	%ymm4, -400(%rbp)
	vmovdqa	.LC2(%rip), %ymm5
	movq	%rdx, %rsi
	andq	%rbx, %rdx
	vmovdqa	%ymm6, -368(%rbp)
	shrq	$56, %rsi
	vmovdqa	%ymm5, -336(%rbp)
	addq	%rdi, %rsi
	vmovdqu	-248(%rbp), %xmm1
	movq	%rsi, -248(%rbp)
	movq	-264(%rbp), %rsi
	vinserti128	$0x1, -232(%rbp), %ymm1, %ymm3
	vpermq	$27, -240(%rbp), %ymm1
	movq	%rsi, %rdi
	shrq	$56, %rdi
	andq	%rbx, %rsi
	addq	%rdi, %rdx
	movq	%rdx, -256(%rbp)
	movq	-272(%rbp), %rdx
	vpand	%ymm5, %ymm1, %ymm2
	vpermq	$27, %ymm3, %ymm1
	movq	%rdx, %rdi
	andq	%rbx, %rdx
	shrq	$56, %rdi
	addq	%rdx, %rax
	addq	%rdi, %rsi
	movq	%r15, %rdi
	movq	%rax, -272(%rbp)
	vpsrlq	$56, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm2, %ymm1
	vpermq	$27, %ymm1, %ymm1
	movq	%rsi, -264(%rbp)
	vmovdqa	%ymm1, -240(%rbp)
	vzeroupper
	call	p448_is_zero@PLT
	movq	-304(%rbp), %r10
	leaq	64(%r14), %rdx
	movq	-296(%rbp), %r9
	movq	%rax, -280(%rbp)
	movq	%r10, %rsi
	movq	%r9, %rdi
	call	p448_mul@PLT
	movq	-288(%rbp), %r8
	leaq	64(%r13), %rdx
	movq	%r12, %rdi
	movq	%r8, %rsi
	call	p448_mul@PLT
	vmovdqa	-112(%rbp), %ymm0
	movq	%rbx, %rsi
	movq	%r15, %rdi
	vmovdqa	-368(%rbp), %ymm6
	vpsubq	-176(%rbp), %ymm0, %ymm0
	vmovdqa	-400(%rbp), %ymm4
	vpaddq	%ymm6, %ymm0, %ymm1
	vmovdqa	%ymm1, -240(%rbp)
	movzbl	-209(%rbp), %eax
	addq	%rax, -240(%rbp)
	vpsubq	-208(%rbp), %ymm4, %ymm4
	vpaddq	-144(%rbp), %ymm4, %ymm4
	vmovdqa	%ymm4, -272(%rbp)
	movq	-256(%rbp), %rcx
	andq	-248(%rbp), %rsi
	vmovdqa	-336(%rbp), %ymm5
	movq	%rcx, %rdx
	andq	%rbx, %rcx
	vmovdqu	-248(%rbp), %xmm1
	shrq	$56, %rdx
	addq	%rsi, %rdx
	vinserti128	$0x1, -232(%rbp), %ymm1, %ymm1
	movq	%rdx, -248(%rbp)
	movq	-264(%rbp), %rdx
	movq	%rdx, %rsi
	andq	%rbx, %rdx
	vpermq	$27, %ymm1, %ymm0
	shrq	$56, %rsi
	addq	%rsi, %rcx
	movq	%rcx, -256(%rbp)
	movq	-272(%rbp), %rcx
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, -240(%rbp), %ymm0
	movq	%rcx, %rsi
	andq	%rcx, %rbx
	shrq	$56, %rsi
	addq	%rax, %rbx
	addq	%rsi, %rdx
	movq	%rbx, -272(%rbp)
	vpand	%ymm5, %ymm0, %ymm0
	movq	%rdx, -264(%rbp)
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	vzeroupper
	call	p448_is_zero@PLT
	andq	-280(%rbp), %rax
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L117
	addq	$352, %rsp
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
.L117:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4689:
	.size	eq_tw_extensible, .-eq_tw_extensible
	.section	.text.unlikely.eq_tw_extensible
.LCOLDE38:
	.section	.text.eq_tw_extensible
.LHOTE38:
	.section	.text.unlikely.elligator_2s_inject,"ax",@progbits
.LCOLDB39:
	.section	.text.elligator_2s_inject,"ax",@progbits
.LHOTB39:
	.p2align 4,,15
	.globl	elligator_2s_inject
	.hidden	elligator_2s_inject
	.type	elligator_2s_inject, @function
elligator_2s_inject:
.LFB4690:
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
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movq	%rdi, %r15
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	movabsq	$72057594037927935, %r14
	subq	$608, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_sqr@PLT
	leaq	-464(%rbp), %rax
	movq	%r15, %rsi
	movq	%rax, %rdi
	movq	%rax, %r13
	call	p448_sqr@PLT
	movq	-464(%rbp), %rax
	vmovdqa	.LC1(%rip), %ymm4
	leaq	64(%r15), %r8
	vmovdqa	.LC0(%rip), %ymm0
	movq	%r14, %rdi
	leaq	-528(%rbp), %rcx
	movq	%r8, -632(%rbp)
	movq	%rax, 64(%r15)
	movq	-456(%rbp), %rax
	vmovdqa	%ymm0, -592(%rbp)
	movq	%rcx, %r12
	movq	%rax, 72(%r15)
	movq	-448(%rbp), %rax
	movq	%rax, 80(%r15)
	movq	-440(%rbp), %rax
	movq	%rax, 88(%r15)
	movq	-432(%rbp), %rax
	vpsubq	64(%r15), %ymm0, %ymm2
	vmovdqa	%ymm2, -400(%rbp)
	movq	%rax, 96(%r15)
	movq	-424(%rbp), %rax
	movq	%rax, 104(%r15)
	movq	-416(%rbp), %rax
	movq	%rax, 112(%r15)
	movq	-408(%rbp), %rax
	movq	%rax, 120(%r15)
	leaq	-400(%rbp), %rax
	vmovdqa	96(%r15), %ymm1
	vpsubq	%ymm1, %ymm4, %ymm1
	vmovdqa	%ymm1, -368(%rbp)
	movzbl	-337(%rbp), %r9d
	addq	%r9, -368(%rbp)
	vmovdqu	-376(%rbp), %xmm1
	vinserti128	$0x1, -360(%rbp), %ymm1, %ymm3
	vpermq	$27, -368(%rbp), %ymm1
	vpand	.LC2(%rip), %ymm1, %ymm2
	vpermq	$27, %ymm3, %ymm1
	vpsrlq	$56, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm2, %ymm1
	vpermq	$27, %ymm1, %ymm1
	vmovdqa	%ymm1, -368(%rbp)
	movq	-384(%rbp), %rdx
	andq	-376(%rbp), %rdi
	movq	%rax, -536(%rbp)
	movq	%rdx, %rsi
	andq	%r14, %rdx
	shrq	$56, %rsi
	addq	%rdi, %rsi
	movq	%rsi, -376(%rbp)
	movq	-392(%rbp), %rsi
	movq	%rsi, %rdi
	andq	%r14, %rsi
	shrq	$56, %rdi
	addq	%rdi, %rdx
	movq	%rdx, -384(%rbp)
	movq	-400(%rbp), %rdx
	movq	%rdx, %rdi
	andq	%r14, %rdx
	shrq	$56, %rdi
	leaq	1(%r9,%rdx), %rdx
	addq	%rdi, %rsi
	movq	%rcx, %rdi
	movq	%rsi, -392(%rbp)
	movq	%rax, %rsi
	movq	%rdx, -400(%rbp)
	vzeroupper
	call	p448_sqr@PLT
	leaq	-208(%rbp), %rcx
	leaq	-144(%rbp), %rbx
	movq	%r12, %rsi
	movl	$1527402724, %edx
	movq	%rcx, %rdi
	movq	%rcx, -544(%rbp)
	call	p448_mulw@PLT
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movabsq	$6108985600, %rdx
	movq	%r13, -552(%rbp)
	call	p448_mulw@PLT
	vmovdqa	-144(%rbp), %ymm1
	movq	%r14, %r9
	movq	%r12, -560(%rbp)
	vpaddq	-208(%rbp), %ymm1, %ymm1
	vmovdqa	%ymm1, 64(%r15)
	movq	80(%r15), %rdi
	vmovdqa	-112(%rbp), %ymm1
	andq	88(%r15), %r9
	vpaddq	-176(%rbp), %ymm1, %ymm1
	vmovdqa	%ymm1, 96(%r15)
	movzbl	127(%r15), %esi
	addq	%rsi, 96(%r15)
	movq	%rdi, %rdx
	andq	%r14, %rdi
	shrq	$56, %rdx
	addq	%r9, %rdx
	vmovdqu	88(%r15), %xmm1
	movq	%rdx, 88(%r15)
	movq	72(%r15), %rdx
	vinserti128	$0x1, 104(%r15), %ymm1, %ymm3
	movq	%rdx, %r9
	vpermq	$27, 96(%r15), %ymm1
	shrq	$56, %r9
	andq	%r14, %rdx
	addq	%r9, %rdi
	movq	%rdi, 80(%r15)
	movzbl	71(%r15), %edi
	vpand	.LC2(%rip), %ymm1, %ymm2
	addq	%rdi, %rdx
	vpermq	$27, %ymm3, %ymm1
	movq	%rdx, 72(%r15)
	movq	%r14, %rdx
	andq	64(%r15), %rdx
	movq	%rbx, %rdi
	vpsrlq	$56, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm2, %ymm1
	vpermq	$27, %ymm1, %ymm1
	addq	%rdx, %rsi
	movabsq	$6109454568, %rdx
	movq	%rsi, 64(%r15)
	movq	%r12, %rsi
	vmovdqa	%ymm1, 96(%r15)
	vzeroupper
	call	p448_mulw@PLT
	vmovdqa	96(%r15), %ymm1
	movq	%r14, %r9
	leaq	-272(%rbp), %r13
	vmovdqa	-592(%rbp), %ymm0
	movq	-632(%rbp), %r8
	vpsubq	-112(%rbp), %ymm1, %ymm1
	vpaddq	.LC1(%rip), %ymm1, %ymm1
	vmovdqa	%ymm1, -176(%rbp)
	movzbl	-145(%rbp), %edx
	vpsubq	-144(%rbp), %ymm0, %ymm2
	vpaddq	64(%r15), %ymm2, %ymm2
	addq	%rdx, -176(%rbp)
	vmovdqa	%ymm2, -208(%rbp)
	movq	-192(%rbp), %rsi
	andq	-184(%rbp), %r9
	vmovdqa	%ymm0, -624(%rbp)
	movq	%r8, -592(%rbp)
	movq	%rsi, %rdi
	andq	%r14, %rsi
	vmovdqu	-184(%rbp), %xmm1
	shrq	$56, %rdi
	addq	%r9, %rdi
	vinserti128	$0x1, -168(%rbp), %ymm1, %ymm3
	movq	%rdi, -184(%rbp)
	movq	-200(%rbp), %rdi
	vpermq	$27, -176(%rbp), %ymm1
	movq	%rdi, %r9
	andq	%r14, %rdi
	shrq	$56, %r9
	addq	%r9, %rsi
	vpand	.LC2(%rip), %ymm1, %ymm2
	movq	%rsi, -192(%rbp)
	movq	-208(%rbp), %rsi
	vpermq	$27, %ymm3, %ymm1
	movq	%rsi, %r9
	andq	%r14, %rsi
	shrq	$56, %r9
	vpsrlq	$56, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm2, %ymm1
	vpermq	$27, %ymm1, %ymm1
	addq	%rsi, %rdx
	addq	%r9, %rdi
	movq	%rdi, -200(%rbp)
	movq	%rdx, -208(%rbp)
	movq	%r8, %rsi
	movl	$78160, %edx
	movq	%r13, %rdi
	vmovdqa	%ymm1, -176(%rbp)
	vzeroupper
	leaq	-336(%rbp), %r12
	call	p448_mulw@PLT
	movq	-544(%rbp), %rsi
	movq	%r13, %rdx
	movq	%r12, %rdi
	call	p448_mul@PLT
	movq	-536(%rbp), %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	movq	-536(%rbp), %rdi
	movq	%r13, %rdx
	movq	%r12, %rsi
	call	p448_mul@PLT
	movq	-544(%rbp), %rsi
	movq	%rbx, %rdx
	movq	%r12, %rdi
	call	p448_mul@PLT
	movq	-536(%rbp), %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	movq	-544(%rbp), %rsi
	movq	-536(%rbp), %rdi
	movq	%rbx, %rdx
	call	p448_mul@PLT
	movq	-536(%rbp), %rsi
	movq	%r13, %rdi
	call	p448_isr@PLT
	movq	-536(%rbp), %rdi
	movq	%r13, %rdx
	movq	%r12, %rsi
	call	p448_mul@PLT
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	p448_sqr@PLT
	movq	%r12, %rdx
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
	movq	-544(%rbp), %rsi
	movq	%r13, %rdx
	movq	%rbx, %rdi
	call	p448_mul@PLT
	movq	%r13, %rdx
	movq	-544(%rbp), %r13
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
	movq	(%r15), %rdx
	addq	$1, (%r15)
	movq	%r15, %rsi
	movq	%r12, %rdi
	movq	%rdx, -272(%rbp)
	movq	8(%r15), %rdx
	movq	%rdx, -264(%rbp)
	movq	16(%r15), %rdx
	movq	%rdx, -256(%rbp)
	movq	24(%r15), %rdx
	movq	%rdx, -248(%rbp)
	movq	32(%r15), %rdx
	movq	%rdx, -240(%rbp)
	movq	40(%r15), %rdx
	movq	%rdx, -232(%rbp)
	movq	48(%r15), %rdx
	movq	%rdx, -224(%rbp)
	movq	56(%r15), %rdx
	movq	%rdx, -216(%rbp)
	movq	%rbx, %rdx
	call	p448_mul@PLT
	addq	$1, -336(%rbp)
	vmovdqa	-624(%rbp), %ymm0
	movq	%r14, %r9
	vmovdqa	-240(%rbp), %ymm1
	vpsubq	-304(%rbp), %ymm1, %ymm1
	vpsubq	-336(%rbp), %ymm0, %ymm0
	vpaddq	-272(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, (%r15)
	movq	16(%r15), %rdi
	vpaddq	.LC1(%rip), %ymm1, %ymm0
	andq	24(%r15), %r9
	vmovdqa	%ymm0, 32(%r15)
	movzbl	63(%r15), %esi
	addq	%rsi, 32(%r15)
	movq	%rdi, %rdx
	andq	%r14, %rdi
	shrq	$56, %rdx
	addq	%r9, %rdx
	vmovdqu	24(%r15), %xmm0
	movq	%rdx, 24(%r15)
	movq	8(%r15), %rdx
	vinserti128	$0x1, 40(%r15), %ymm0, %ymm2
	movq	%rdx, %r9
	vpermq	$27, 32(%r15), %ymm0
	shrq	$56, %r9
	andq	%r14, %rdx
	addq	%r9, %rdi
	movq	%rdi, 16(%r15)
	movl	$56, %edi
	shrx	%rdi, (%r15), %rdi
	vpand	.LC2(%rip), %ymm0, %ymm1
	addq	%rdi, %rdx
	vpermq	$27, %ymm2, %ymm0
	movq	%rdx, 8(%r15)
	movq	%r14, %rdx
	andq	(%r15), %rdx
	movq	%r12, %rdi
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	addq	%rdx, %rsi
	movq	%r15, %rdx
	movq	%rsi, (%r15)
	movq	-536(%rbp), %rsi
	vmovdqa	%ymm0, 32(%r15)
	vzeroupper
	call	p448_mul@PLT
	movq	%r12, %rsi
	movq	%r15, %rdi
	movl	$78160, %edx
	call	p448_mulw@PLT
	vmovdqa	-464(%rbp), %ymm0
	movq	%r14, %r9
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, -400(%rbp)
	movq	-384(%rbp), %rdx
	vmovdqa	-432(%rbp), %ymm0
	andq	-376(%rbp), %r9
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	%ymm0, -368(%rbp)
	movzbl	-337(%rbp), %esi
	addq	%rsi, -368(%rbp)
	movq	%rdx, %rdi
	andq	%r14, %rdx
	shrq	$56, %rdi
	addq	%r9, %rdi
	vmovdqu	-376(%rbp), %xmm0
	movq	%rdi, -376(%rbp)
	movq	-392(%rbp), %rdi
	vinserti128	$0x1, -360(%rbp), %ymm0, %ymm2
	vpermq	$27, -368(%rbp), %ymm0
	movq	%rdi, %r9
	shrq	$56, %r9
	andq	%r14, %rdi
	addq	%r9, %rdx
	movq	%rdx, -384(%rbp)
	movq	-400(%rbp), %rdx
	vpand	.LC2(%rip), %ymm0, %ymm1
	movq	%rdx, %r9
	andq	%r14, %rdx
	vpermq	$27, %ymm2, %ymm0
	shrq	$56, %r9
	addq	%rdx, %rsi
	addq	%r9, %rdi
	movq	%rsi, -400(%rbp)
	movq	%r14, %r9
	movq	%rdi, -392(%rbp)
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	-400(%rbp), %ymm1
	vmovdqa	%ymm0, -368(%rbp)
	vpaddq	-496(%rbp), %ymm0, %ymm0
	vpaddq	-528(%rbp), %ymm1, %ymm1
	vmovdqa	%ymm0, -432(%rbp)
	movzbl	-401(%rbp), %edi
	addq	%rdi, -432(%rbp)
	vmovdqa	%ymm1, -464(%rbp)
	vmovdqu	-440(%rbp), %xmm0
	vinserti128	$0x1, -424(%rbp), %ymm0, %ymm2
	vpermq	$27, -432(%rbp), %ymm0
	vpand	.LC2(%rip), %ymm0, %ymm1
	movq	-448(%rbp), %rdx
	andq	-440(%rbp), %r9
	vpermq	$27, %ymm2, %ymm0
	vmovdqa	.LC2(%rip), %ymm5
	movq	-560(%rbp), %r12
	movq	%rdx, %rsi
	andq	%r14, %rdx
	shrq	$56, %rsi
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	addq	%r9, %rsi
	vpermq	$27, %ymm0, %ymm0
	movq	%rsi, -440(%rbp)
	movq	-456(%rbp), %rsi
	vpaddq	.LC23(%rip), %ymm0, %ymm0
	vmovdqa	%ymm0, -432(%rbp)
	movq	%rsi, %r9
	andq	%r14, %rsi
	shrq	$56, %r9
	addq	%r9, %rdx
	movq	%rdx, -448(%rbp)
	movq	-464(%rbp), %rdx
	movq	%rdx, %r9
	andq	%r14, %rdx
	shrq	$56, %r9
	leaq	-2(%rdi,%rdx), %rdx
	movzbl	-401(%rbp), %edi
	addq	%rdi, -432(%rbp)
	addq	%r9, %rsi
	movq	%r14, %r9
	movq	%rsi, -456(%rbp)
	movq	%rdx, -464(%rbp)
	vpaddq	-464(%rbp), %ymm5, %ymm1
	vmovdqa	%ymm1, -464(%rbp)
	movq	-448(%rbp), %rsi
	andq	-440(%rbp), %r9
	vmovdqu	-440(%rbp), %xmm0
	movq	%rsi, %rdx
	shrq	$56, %rdx
	andq	%r14, %rsi
	vinserti128	$0x1, -424(%rbp), %ymm0, %ymm0
	addq	%r9, %rdx
	movq	%rdx, -440(%rbp)
	movq	-456(%rbp), %rdx
	movq	%rdx, %r9
	vpermq	$27, %ymm0, %ymm0
	shrq	$56, %r9
	addq	%r9, %rsi
	movq	%rsi, -448(%rbp)
	movq	-464(%rbp), %rsi
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, -432(%rbp), %ymm0
	movq	%rsi, %r9
	shrq	$56, %r9
	andq	%r14, %rsi
	andq	%r14, %rdx
	addq	%rsi, %rdi
	movq	-552(%rbp), %rsi
	addq	%r9, %rdx
	vpand	%ymm5, %ymm0, %ymm0
	movq	%rdx, -456(%rbp)
	movq	%rdi, -464(%rbp)
	movq	%rbx, %rdx
	movq	%r12, %rdi
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, -432(%rbp)
	vzeroupper
	call	p448_mul@PLT
	movq	-552(%rbp), %rdi
	movq	%r12, %rsi
	movl	$3054649120, %edx
	call	p448_mulw@PLT
	vmovdqa	-464(%rbp), %ymm0
	movq	%r14, %r9
	movq	-592(%rbp), %r8
	vpaddq	64(%r15), %ymm0, %ymm0
	vmovdqa	%ymm0, -528(%rbp)
	movq	-512(%rbp), %rsi
	vmovdqa	-432(%rbp), %ymm0
	andq	-504(%rbp), %r9
	vpaddq	96(%r15), %ymm0, %ymm0
	vmovdqa	%ymm0, -496(%rbp)
	movzbl	-465(%rbp), %edi
	addq	%rdi, -496(%rbp)
	movq	%rsi, %rdx
	andq	%r14, %rsi
	shrq	$56, %rdx
	addq	%r9, %rdx
	vmovdqu	-504(%rbp), %xmm0
	movq	%rdx, -504(%rbp)
	movq	-520(%rbp), %rdx
	vinserti128	$0x1, -488(%rbp), %ymm0, %ymm0
	movq	%rdx, %r9
	andq	%r14, %rdx
	shrq	$56, %r9
	addq	%r9, %rsi
	vpermq	$27, %ymm0, %ymm0
	movq	%rsi, -512(%rbp)
	movq	-528(%rbp), %rsi
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, -496(%rbp), %ymm0
	movq	%rsi, %r9
	shrq	$56, %r9
	movq	%rsi, %rax
	movq	%r13, %rsi
	addq	%r9, %rdx
	andq	%r14, %rax
	addq	%rdi, %rax
	movq	%rdx, -520(%rbp)
	movq	%r8, %rdi
	movq	%r12, %rdx
	movq	%rax, -528(%rbp)
	vpand	.LC2(%rip), %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, -496(%rbp)
	vzeroupper
	call	p448_mul@PLT
	movq	%rbx, %rdi
	call	p448_is_zero@PLT
	subq	%rax, 64(%r15)
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L122
	addq	$608, %rsp
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
.L122:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4690:
	.size	elligator_2s_inject, .-elligator_2s_inject
	.section	.text.unlikely.elligator_2s_inject
.LCOLDE39:
	.section	.text.elligator_2s_inject
.LHOTE39:
	.section	.text.unlikely.validate_affine,"ax",@progbits
.LCOLDB40:
	.section	.text.validate_affine,"ax",@progbits
.LHOTB40:
	.p2align 4,,15
	.globl	validate_affine
	.hidden	validate_affine
	.type	validate_affine, @function
validate_affine:
.LFB4691:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	leaq	64(%rdi), %rsi
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xe,0x2,0x76,0x78
	.cfi_escape 0x10,0xd,0x2,0x76,0x70
	.cfi_escape 0x10,0xc,0x2,0x76,0x68
	leaq	-336(%rbp), %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x60,0x6
	pushq	%rbx
	leaq	-272(%rbp), %r13
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	movq	%rdi, %rbx
	movq	%r12, %rdi
	leaq	-208(%rbp), %r14
	subq	$392, %rsp
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_sqr@PLT
	movq	%rbx, %rsi
	movq	%r13, %rdi
	movabsq	$72057594037927935, %rbx
	call	p448_sqr@PLT
	vmovdqa	-272(%rbp), %ymm0
	movq	%rbx, %rsi
	movq	%r14, %rdi
	vmovdqa	.LC2(%rip), %ymm3
	vpaddq	-336(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -144(%rbp)
	movq	-128(%rbp), %rcx
	vmovdqa	-240(%rbp), %ymm0
	andq	-120(%rbp), %rsi
	vmovdqa	%ymm3, -432(%rbp)
	vpaddq	-304(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -112(%rbp)
	movzbl	-81(%rbp), %edx
	addq	%rdx, -112(%rbp)
	movq	%rcx, %rax
	andq	%rbx, %rcx
	shrq	$56, %rax
	addq	%rsi, %rax
	vmovdqu	-120(%rbp), %xmm1
	movq	%rax, -120(%rbp)
	movq	-136(%rbp), %rax
	vinserti128	$0x1, -104(%rbp), %ymm1, %ymm1
	movq	%rax, %rsi
	andq	%rbx, %rax
	shrq	$56, %rsi
	addq	%rsi, %rcx
	vpermq	$27, %ymm1, %ymm1
	movq	%rcx, -128(%rbp)
	movq	-144(%rbp), %rcx
	vpsrlq	$56, %ymm1, %ymm2
	vpermq	$27, -112(%rbp), %ymm1
	movq	%rcx, %rsi
	andq	%rbx, %rcx
	shrq	$56, %rsi
	addq	%rcx, %rdx
	addq	%rsi, %rax
	movq	%r13, %rsi
	movq	%rdx, -144(%rbp)
	movl	$39081, %edx
	movq	%rax, -136(%rbp)
	vpand	%ymm3, %ymm1, %ymm1
	vpaddq	%ymm1, %ymm2, %ymm1
	vpermq	$27, %ymm1, %ymm1
	vmovdqa	%ymm1, -112(%rbp)
	vzeroupper
	call	p448_mulw@PLT
	vmovdqa	.LC0(%rip), %ymm1
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	vpsubq	-208(%rbp), %ymm1, %ymm0
	vmovdqa	%ymm0, -208(%rbp)
	vmovdqa	.LC1(%rip), %ymm0
	vmovdqa	%ymm1, -400(%rbp)
	vpsubq	-176(%rbp), %ymm0, %ymm2
	vmovdqa	%ymm0, -368(%rbp)
	vmovdqa	%ymm2, -176(%rbp)
	vzeroupper
	call	p448_mul@PLT
	addq	$1, -272(%rbp)
	movq	%rbx, %rsi
	movq	%r12, %rdi
	vmovdqa	-368(%rbp), %ymm0
	vmovdqa	-112(%rbp), %ymm2
	vmovdqa	-400(%rbp), %ymm1
	vpsubq	-240(%rbp), %ymm2, %ymm2
	vmovdqa	-432(%rbp), %ymm3
	vpsubq	-272(%rbp), %ymm1, %ymm1
	vpaddq	-144(%rbp), %ymm1, %ymm1
	vmovdqa	%ymm1, -336(%rbp)
	vpaddq	%ymm0, %ymm2, %ymm1
	vmovdqa	%ymm1, -304(%rbp)
	movzbl	-273(%rbp), %ecx
	addq	%rcx, -304(%rbp)
	movq	-320(%rbp), %rdx
	andq	-312(%rbp), %rsi
	movq	%rdx, %rax
	andq	%rbx, %rdx
	vmovdqu	-312(%rbp), %xmm1
	shrq	$56, %rax
	addq	%rsi, %rax
	vinserti128	$0x1, -296(%rbp), %ymm1, %ymm1
	movq	%rax, -312(%rbp)
	movq	-328(%rbp), %rax
	movq	%rax, %rsi
	andq	%rbx, %rax
	vpermq	$27, %ymm1, %ymm0
	shrq	$56, %rsi
	addq	%rsi, %rdx
	movq	%rdx, -320(%rbp)
	movq	-336(%rbp), %rdx
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, -304(%rbp), %ymm0
	movq	%rdx, %rsi
	andq	%rdx, %rbx
	shrq	$56, %rsi
	addq	%rcx, %rbx
	addq	%rsi, %rax
	movq	%rbx, -336(%rbp)
	vpand	%ymm3, %ymm0, %ymm0
	movq	%rax, -328(%rbp)
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, -304(%rbp)
	vzeroupper
	call	p448_is_zero@PLT
	movq	-56(%rbp), %rdi
	xorq	%fs:40, %rdi
	jne	.L127
	addq	$392, %rsp
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
.L127:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4691:
	.size	validate_affine, .-validate_affine
	.section	.text.unlikely.validate_affine
.LCOLDE40:
	.section	.text.validate_affine
.LHOTE40:
	.section	.text.unlikely.validate_tw_extensible,"ax",@progbits
.LCOLDB41:
	.section	.text.validate_tw_extensible,"ax",@progbits
.LHOTB41:
	.p2align 4,,15
	.globl	validate_tw_extensible
	.hidden	validate_tw_extensible
	.type	validate_tw_extensible, @function
validate_tw_extensible:
.LFB4692:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	leaq	256(%rdi), %r9
	leaq	192(%rdi), %r8
	pushq	-8(%r10)
	pushq	%rbp
	movq	%r9, %rdx
	movq	%r8, %rsi
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	-272(%rbp), %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	movq	%rdi, %r14
	movq	%r12, %rdi
	leaq	128(%r14), %r13
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	leaq	-336(%rbp), %rbx
	subq	$448, %rsp
	movq	%r9, -472(%rbp)
	movq	%r8, -368(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_mul@PLT
	leaq	-208(%rbp), %r10
	movq	%r12, %rdx
	movq	%r13, %rsi
	movabsq	$72057594037927935, %r15
	movq	%r10, %rdi
	movq	%r10, -360(%rbp)
	call	p448_mul@PLT
	leaq	64(%r14), %r11
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movq	%r11, %rdx
	movq	%r11, -352(%rbp)
	call	p448_mul@PLT
	vmovdqa	.LC0(%rip), %ymm5
	movq	%r15, %rdi
	vmovdqa	.LC1(%rip), %ymm2
	vpsubq	-336(%rbp), %ymm5, %ymm0
	vmovdqa	%ymm0, -272(%rbp)
	movq	-256(%rbp), %rdx
	vpsubq	-304(%rbp), %ymm2, %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	movzbl	-209(%rbp), %eax
	addq	%rax, -240(%rbp)
	vmovdqa	%ymm5, -464(%rbp)
	andq	-248(%rbp), %rdi
	movq	%rdx, %rsi
	andq	%r15, %rdx
	shrq	$56, %rsi
	vmovdqa	.LC2(%rip), %ymm4
	vmovdqa	%ymm2, -432(%rbp)
	addq	%rdi, %rsi
	vmovdqu	-248(%rbp), %xmm0
	movq	%rsi, -248(%rbp)
	movq	-264(%rbp), %rsi
	vinserti128	$0x1, -232(%rbp), %ymm0, %ymm3
	vpermq	$27, -240(%rbp), %ymm0
	movq	%rsi, %rdi
	shrq	$56, %rdi
	andq	%r15, %rsi
	addq	%rdi, %rdx
	movq	%rdx, -256(%rbp)
	movq	-272(%rbp), %rdx
	vpand	%ymm4, %ymm0, %ymm1
	vpermq	$27, %ymm3, %ymm0
	movq	%rdx, %rdi
	andq	%r15, %rdx
	shrq	$56, %rdi
	addq	%rdx, %rax
	addq	%rdi, %rsi
	movq	%rax, -272(%rbp)
	movq	%r15, %rdi
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	movq	%rsi, -264(%rbp)
	vmovdqa	-272(%rbp), %ymm1
	vmovdqa	%ymm0, -240(%rbp)
	vpaddq	-176(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -304(%rbp)
	movzbl	-273(%rbp), %eax
	vpaddq	-208(%rbp), %ymm1, %ymm1
	addq	%rax, -304(%rbp)
	vmovdqa	%ymm1, -336(%rbp)
	vmovdqu	-312(%rbp), %xmm0
	movq	-320(%rbp), %rdx
	andq	-312(%rbp), %rdi
	vinserti128	$0x1, -296(%rbp), %ymm0, %ymm3
	vmovdqa	%ymm4, -400(%rbp)
	movq	%rdx, %rsi
	andq	%r15, %rdx
	shrq	$56, %rsi
	vpermq	$27, -304(%rbp), %ymm0
	addq	%rdi, %rsi
	movq	%rsi, -312(%rbp)
	movq	-328(%rbp), %rsi
	movq	%rsi, %rdi
	vpand	%ymm4, %ymm0, %ymm1
	shrq	$56, %rdi
	vpermq	$27, %ymm3, %ymm0
	addq	%rdi, %rdx
	andq	%r15, %rsi
	movq	%rdx, -320(%rbp)
	movq	-336(%rbp), %rdx
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	movq	%rdx, %rdi
	andq	%r15, %rdx
	shrq	$56, %rdi
	addq	%rdx, %rax
	vmovdqa	%ymm0, -304(%rbp)
	addq	%rdi, %rsi
	movq	%rbx, %rdi
	movq	%rax, -336(%rbp)
	movq	%rsi, -328(%rbp)
	vzeroupper
	call	p448_is_zero@PLT
	movq	-352(%rbp), %r11
	movq	-360(%rbp), %r10
	movq	%rax, -344(%rbp)
	movq	%r11, %rsi
	movq	%r10, %rdi
	call	p448_sqr@PLT
	vmovdqa	-464(%rbp), %ymm5
	movq	%r15, %rdi
	vmovdqa	-432(%rbp), %ymm2
	vpsubq	-208(%rbp), %ymm5, %ymm0
	vmovdqa	%ymm0, -272(%rbp)
	movq	-256(%rbp), %rdx
	andq	-248(%rbp), %rdi
	vpsubq	-176(%rbp), %ymm2, %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	movzbl	-209(%rbp), %eax
	addq	%rax, -240(%rbp)
	movq	%rdx, %rsi
	andq	%r15, %rdx
	shrq	$56, %rsi
	vmovdqa	-400(%rbp), %ymm4
	addq	%rdi, %rsi
	vmovdqu	-248(%rbp), %xmm0
	movq	%rsi, -248(%rbp)
	movq	-264(%rbp), %rsi
	vinserti128	$0x1, -232(%rbp), %ymm0, %ymm3
	vpermq	$27, -240(%rbp), %ymm0
	movq	%rsi, %rdi
	shrq	$56, %rdi
	andq	%r15, %rsi
	addq	%rdi, %rdx
	movq	%rdx, -256(%rbp)
	movq	-272(%rbp), %rdx
	vpand	%ymm4, %ymm0, %ymm1
	vpermq	$27, %ymm3, %ymm0
	movq	%rdx, %rdi
	andq	%r15, %rdx
	shrq	$56, %rdi
	addq	%rdx, %rax
	addq	%rdi, %rsi
	movq	%rbx, %rdi
	movq	%rax, -272(%rbp)
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	movq	%rsi, -264(%rbp)
	movq	%r14, %rsi
	vmovdqa	%ymm0, -240(%rbp)
	vzeroupper
	leaq	-144(%rbp), %r14
	call	p448_sqr@PLT
	vmovdqa	-336(%rbp), %ymm0
	movq	%r15, %rdi
	vmovdqa	-400(%rbp), %ymm4
	movq	-472(%rbp), %r9
	vpaddq	-272(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -208(%rbp)
	movq	-192(%rbp), %rdx
	vmovdqa	-304(%rbp), %ymm0
	andq	-184(%rbp), %rdi
	vpaddq	-240(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -176(%rbp)
	movzbl	-145(%rbp), %eax
	addq	%rax, -176(%rbp)
	movq	%rdx, %rsi
	andq	%r15, %rdx
	shrq	$56, %rsi
	addq	%rdi, %rsi
	vmovdqu	-184(%rbp), %xmm0
	movq	%rsi, -184(%rbp)
	movq	-200(%rbp), %rsi
	vinserti128	$0x1, -168(%rbp), %ymm0, %ymm3
	vpermq	$27, -176(%rbp), %ymm0
	movq	%rsi, %rdi
	shrq	$56, %rdi
	andq	%r15, %rsi
	addq	%rdi, %rdx
	movq	%rdx, -192(%rbp)
	movq	-208(%rbp), %rdx
	vpand	%ymm4, %ymm0, %ymm1
	vpermq	$27, %ymm3, %ymm0
	movq	%rdx, %rdi
	andq	%r15, %rdx
	shrq	$56, %rdi
	addq	%rdx, %rax
	addq	%rdi, %rsi
	movq	%r14, %rdi
	movq	%rax, -208(%rbp)
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	movq	%rsi, -200(%rbp)
	movq	%r9, %rsi
	vmovdqa	%ymm0, -176(%rbp)
	vzeroupper
	call	p448_sqr@PLT
	movq	-368(%rbp), %r8
	movq	%rbx, %rdi
	movq	%r8, %rsi
	call	p448_sqr@PLT
	movq	%r14, %rdx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	p448_mul@PLT
	movq	%r12, %rsi
	movq	%r14, %rdi
	movl	$39081, %edx
	call	p448_mulw@PLT
	vmovdqa	-432(%rbp), %ymm2
	movq	%r15, %rdi
	vmovdqa	-464(%rbp), %ymm5
	vpsubq	-112(%rbp), %ymm2, %ymm0
	vpaddq	-176(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -304(%rbp)
	movzbl	-273(%rbp), %esi
	vpsubq	-144(%rbp), %ymm5, %ymm1
	vpaddq	-208(%rbp), %ymm1, %ymm1
	addq	%rsi, -304(%rbp)
	vmovdqa	%ymm1, -336(%rbp)
	vpsubq	-240(%rbp), %ymm2, %ymm2
	movq	-320(%rbp), %rdx
	andq	-312(%rbp), %rdi
	vmovdqa	%ymm2, -112(%rbp)
	vmovdqa	-400(%rbp), %ymm4
	vpsubq	-272(%rbp), %ymm5, %ymm5
	vmovdqa	%ymm5, -144(%rbp)
	movq	%rdx, %rax
	andq	%r15, %rdx
	shrq	$56, %rax
	vmovdqu	-312(%rbp), %xmm0
	addq	%rdi, %rax
	movq	%rax, -312(%rbp)
	movq	-328(%rbp), %rax
	vinserti128	$0x1, -296(%rbp), %ymm0, %ymm0
	movq	%rax, %rdi
	andq	%r15, %rax
	shrq	$56, %rdi
	addq	%rdi, %rdx
	vpermq	$27, %ymm0, %ymm0
	movq	%rdx, -320(%rbp)
	movq	-336(%rbp), %rdx
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, -304(%rbp), %ymm0
	movq	%rdx, %rdi
	andq	%r15, %rdx
	shrq	$56, %rdi
	addq	%rdx, %rsi
	movzbl	-81(%rbp), %edx
	addq	%rdi, %rax
	addq	%rdx, -112(%rbp)
	movq	%rax, -328(%rbp)
	movq	%r15, %rdi
	movq	%rsi, -336(%rbp)
	vpand	%ymm4, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm3
	vmovdqu	-120(%rbp), %xmm1
	vmovdqa	%ymm3, -304(%rbp)
	vinserti128	$0x1, -104(%rbp), %ymm1, %ymm1
	movq	-128(%rbp), %rax
	andq	-120(%rbp), %rdi
	vpermq	$27, -112(%rbp), %ymm0
	movq	%rax, %rsi
	andq	%r15, %rax
	shrq	$56, %rsi
	vpermq	$27, %ymm1, %ymm1
	addq	%rdi, %rsi
	movq	%rsi, -120(%rbp)
	movq	-136(%rbp), %rsi
	vpand	%ymm4, %ymm0, %ymm0
	vpsrlq	$56, %ymm1, %ymm2
	movq	%rsi, %rdi
	andq	%r15, %rsi
	shrq	$56, %rdi
	vpaddq	%ymm0, %ymm2, %ymm1
	vpermq	$27, %ymm1, %ymm0
	addq	%rdi, %rax
	movq	%rax, -128(%rbp)
	movq	-144(%rbp), %rax
	vmovdqa	%ymm0, -112(%rbp)
	vpaddq	%ymm3, %ymm0, %ymm0
	vmovdqa	%ymm0, -176(%rbp)
	movq	%rax, %rdi
	andq	%r15, %rax
	shrq	$56, %rdi
	addq	%rax, %rdx
	addq	%rdi, %rsi
	movq	%rdx, -144(%rbp)
	movq	%r15, %rdi
	movq	%rsi, -136(%rbp)
	movzbl	-145(%rbp), %esi
	addq	%rsi, -176(%rbp)
	vmovdqa	-144(%rbp), %ymm1
	vpaddq	-336(%rbp), %ymm1, %ymm1
	vmovdqa	%ymm1, -208(%rbp)
	movq	-192(%rbp), %rdx
	andq	-184(%rbp), %rdi
	vmovdqu	-184(%rbp), %xmm0
	movq	%rdx, %rax
	shrq	$56, %rax
	vinserti128	$0x1, -168(%rbp), %ymm0, %ymm0
	addq	%rdi, %rax
	movq	%rax, -184(%rbp)
	movq	-200(%rbp), %rax
	movq	%rax, %rdi
	vpermq	$27, %ymm0, %ymm0
	shrq	$56, %rdi
	andq	%r15, %rdx
	addq	%rdi, %rdx
	andq	%r15, %rax
	movq	%rdx, -192(%rbp)
	movq	-208(%rbp), %rdx
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, -176(%rbp), %ymm0
	movq	%rdx, %rdi
	andq	%r15, %rdx
	shrq	$56, %rdi
	addq	%rdx, %rsi
	addq	%rdi, %rax
	movq	%rsi, -208(%rbp)
	movq	%r12, %rdi
	vpand	%ymm4, %ymm0, %ymm0
	movq	%r13, %rsi
	movq	%rax, -200(%rbp)
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, -176(%rbp)
	vzeroupper
	call	p448_sqr@PLT
	vmovdqa	-272(%rbp), %ymm0
	movq	%r15, %rdi
	vmovdqa	-400(%rbp), %ymm4
	vpaddq	-208(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -336(%rbp)
	movq	-320(%rbp), %rdx
	vmovdqa	-240(%rbp), %ymm0
	andq	-312(%rbp), %rdi
	vpaddq	-176(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -304(%rbp)
	movzbl	-273(%rbp), %esi
	addq	%rsi, -304(%rbp)
	movq	%rdx, %rax
	andq	%r15, %rdx
	shrq	$56, %rax
	addq	%rdi, %rax
	vmovdqu	-312(%rbp), %xmm0
	movq	%rax, -312(%rbp)
	movq	-328(%rbp), %rax
	vinserti128	$0x1, -296(%rbp), %ymm0, %ymm0
	movq	%rax, %rdi
	andq	%r15, %rax
	shrq	$56, %rdi
	addq	%rdi, %rdx
	vpermq	$27, %ymm0, %ymm0
	movq	%rdx, -320(%rbp)
	movq	-336(%rbp), %rdx
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, -304(%rbp), %ymm0
	movq	%rdx, %rdi
	movq	%rdx, %rcx
	shrq	$56, %rdi
	andq	%r15, %rcx
	addq	%rdi, %rax
	movq	%rbx, %rdi
	addq	%rsi, %rcx
	movq	%rax, -328(%rbp)
	movq	%rcx, -336(%rbp)
	vpand	%ymm4, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, -304(%rbp)
	vzeroupper
	call	p448_is_zero@PLT
	movq	-344(%rbp), %r15
	movq	%r13, %rdi
	andq	%rax, %r15
	call	p448_is_zero@PLT
	notq	%rax
	andq	%r15, %rax
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L132
	addq	$448, %rsp
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
.L132:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4692:
	.size	validate_tw_extensible, .-validate_tw_extensible
	.section	.text.unlikely.validate_tw_extensible
.LCOLDE41:
	.section	.text.validate_tw_extensible
.LHOTE41:
	.section	.text.unlikely.validate_extensible,"ax",@progbits
.LCOLDB42:
	.section	.text.validate_extensible,"ax",@progbits
.LHOTB42:
	.p2align 4,,15
	.globl	validate_extensible
	.hidden	validate_extensible
	.type	validate_extensible, @function
validate_extensible:
.LFB4693:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	leaq	64(%rdi), %r8
	pushq	-8(%r10)
	pushq	%rbp
	movq	%r8, %rsi
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	leaq	-208(%rbp), %r9
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	movq	%rdi, %r12
	movq	%r9, %rdi
	movabsq	$72057594037927935, %r14
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	leaq	-336(%rbp), %rbx
	subq	$352, %rsp
	movq	%r8, -376(%rbp)
	movq	%r9, -368(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_sqr@PLT
	vmovdqa	.LC0(%rip), %ymm3
	movq	%r14, %rdi
	vmovdqa	.LC1(%rip), %ymm4
	vpsubq	-208(%rbp), %ymm3, %ymm0
	vmovdqa	%ymm0, -272(%rbp)
	movq	-256(%rbp), %rdx
	vpsubq	-176(%rbp), %ymm4, %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	movzbl	-209(%rbp), %eax
	addq	%rax, -240(%rbp)
	andq	-248(%rbp), %rdi
	movq	%rdx, %rsi
	andq	%r14, %rdx
	shrq	$56, %rsi
	vmovdqu	-248(%rbp), %xmm0
	addq	%rdi, %rsi
	movq	%rsi, -248(%rbp)
	movq	-264(%rbp), %rsi
	vinserti128	$0x1, -232(%rbp), %ymm0, %ymm2
	vpermq	$27, -240(%rbp), %ymm0
	movq	%rsi, %rdi
	shrq	$56, %rdi
	andq	%r14, %rsi
	addq	%rdi, %rdx
	movq	%rdx, -256(%rbp)
	movq	-272(%rbp), %rdx
	vpand	.LC2(%rip), %ymm0, %ymm1
	movq	%rdx, %rdi
	andq	%r14, %rdx
	vpermq	$27, %ymm2, %ymm0
	addq	%rdx, %rax
	shrq	$56, %rdi
	movq	%rax, -272(%rbp)
	leaq	128(%r12), %rax
	addq	%rdi, %rsi
	movq	%rsi, -264(%rbp)
	movq	%rbx, %rdi
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	movq	%rax, %rsi
	movq	%rax, -344(%rbp)
	vmovdqa	%ymm0, -240(%rbp)
	vzeroupper
	leaq	-144(%rbp), %r15
	call	p448_sqr@PLT
	vmovdqa	-336(%rbp), %ymm0
	movq	%r14, %rdi
	leaq	256(%r12), %r11
	vpaddq	-272(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -208(%rbp)
	movq	-192(%rbp), %rsi
	vmovdqa	-304(%rbp), %ymm0
	andq	-184(%rbp), %rdi
	movq	%r11, -360(%rbp)
	vpaddq	-240(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -176(%rbp)
	movzbl	-145(%rbp), %edx
	addq	%rdx, -176(%rbp)
	movq	%rsi, %rcx
	andq	%r14, %rsi
	shrq	$56, %rcx
	movq	%rcx, %rax
	addq	%rdi, %rax
	vmovdqu	-184(%rbp), %xmm0
	movq	%rax, -184(%rbp)
	movq	-200(%rbp), %rax
	vinserti128	$0x1, -168(%rbp), %ymm0, %ymm2
	vpermq	$27, -176(%rbp), %ymm0
	movq	%rax, %rdi
	shrq	$56, %rdi
	andq	%r14, %rax
	addq	%rdi, %rsi
	movq	%rsi, -192(%rbp)
	movq	-208(%rbp), %rsi
	vpand	.LC2(%rip), %ymm0, %ymm1
	movq	%rsi, %rdi
	andq	%r14, %rsi
	vpermq	$27, %ymm2, %ymm0
	shrq	$56, %rdi
	addq	%rsi, %rdx
	addq	%rdi, %rax
	movq	%r11, %rsi
	movq	%r15, %rdi
	movq	%rax, -200(%rbp)
	movq	%rdx, -208(%rbp)
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, -176(%rbp)
	vzeroupper
	leaq	-272(%rbp), %r13
	call	p448_sqr@PLT
	leaq	192(%r12), %r10
	movq	%rbx, %rdi
	movq	%r10, %rsi
	movq	%r10, -352(%rbp)
	call	p448_sqr@PLT
	movq	%r15, %rdx
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movl	$39081, %edx
	call	p448_mulw@PLT
	vmovdqa	.LC1(%rip), %ymm6
	movq	%r14, %rdi
	vmovdqa	.LC0(%rip), %ymm5
	vpsubq	-304(%rbp), %ymm6, %ymm0
	vmovdqa	%ymm0, -304(%rbp)
	vpaddq	-176(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	movzbl	-209(%rbp), %edx
	vpsubq	-336(%rbp), %ymm5, %ymm1
	addq	%rdx, -240(%rbp)
	vmovdqa	%ymm1, -336(%rbp)
	vpaddq	-208(%rbp), %ymm1, %ymm1
	vmovdqa	%ymm1, -272(%rbp)
	movq	-256(%rbp), %rsi
	andq	-248(%rbp), %rdi
	movq	%rsi, %rcx
	andq	%r14, %rsi
	vmovdqu	-248(%rbp), %xmm0
	shrq	$56, %rcx
	movq	%rcx, %rax
	vinserti128	$0x1, -232(%rbp), %ymm0, %ymm2
	addq	%rdi, %rax
	movq	%rax, -248(%rbp)
	movq	-264(%rbp), %rax
	vpermq	$27, -240(%rbp), %ymm0
	movq	%rax, %rdi
	andq	%r14, %rax
	shrq	$56, %rdi
	addq	%rdi, %rsi
	vpand	.LC2(%rip), %ymm0, %ymm1
	movq	%rsi, -256(%rbp)
	movq	-272(%rbp), %rsi
	vpermq	$27, %ymm2, %ymm0
	movq	%rsi, %rdi
	andq	%r14, %rsi
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	shrq	$56, %rdi
	addq	%rsi, %rdx
	movq	%r12, %rsi
	addq	%rdi, %rax
	movq	%rbx, %rdi
	movq	%rdx, -272(%rbp)
	vmovdqa	%ymm0, -240(%rbp)
	movq	%rax, -264(%rbp)
	vzeroupper
	call	p448_sqr@PLT
	vmovdqa	.LC0(%rip), %ymm7
	movq	%r14, %rdi
	vmovdqa	.LC1(%rip), %ymm3
	vpsubq	-336(%rbp), %ymm7, %ymm0
	vmovdqa	%ymm0, -208(%rbp)
	movq	-192(%rbp), %rax
	vpsubq	-304(%rbp), %ymm3, %ymm0
	vmovdqa	%ymm0, -176(%rbp)
	movzbl	-145(%rbp), %edx
	addq	%rdx, -176(%rbp)
	andq	-184(%rbp), %rdi
	movq	%rax, %rsi
	andq	%r14, %rax
	shrq	$56, %rsi
	vmovdqu	-184(%rbp), %xmm0
	addq	%rdi, %rsi
	movq	%rsi, -184(%rbp)
	movq	-200(%rbp), %rsi
	vinserti128	$0x1, -168(%rbp), %ymm0, %ymm2
	vpermq	$27, -176(%rbp), %ymm0
	movq	%rsi, %rdi
	shrq	$56, %rdi
	andq	%r14, %rsi
	addq	%rdi, %rax
	movq	%rax, -192(%rbp)
	movq	-208(%rbp), %rax
	vpand	.LC2(%rip), %ymm0, %ymm1
	movq	%rax, %rdi
	andq	%r14, %rax
	vpermq	$27, %ymm2, %ymm0
	shrq	$56, %rdi
	addq	%rax, %rdx
	addq	%rdi, %rsi
	movq	%rdx, -208(%rbp)
	movq	%r14, %rdi
	movq	%rsi, -200(%rbp)
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	-208(%rbp), %ymm1
	vmovdqa	%ymm0, -176(%rbp)
	vpaddq	-240(%rbp), %ymm0, %ymm0
	vpaddq	-272(%rbp), %ymm1, %ymm1
	vmovdqa	%ymm0, -304(%rbp)
	movzbl	-273(%rbp), %edx
	addq	%rdx, -304(%rbp)
	vmovdqa	%ymm1, -336(%rbp)
	vmovdqu	-312(%rbp), %xmm0
	vinserti128	$0x1, -296(%rbp), %ymm0, %ymm2
	vpermq	$27, -304(%rbp), %ymm0
	movq	-320(%rbp), %rax
	andq	-312(%rbp), %rdi
	movq	%rax, %rsi
	andq	%r14, %rax
	shrq	$56, %rsi
	vpand	.LC2(%rip), %ymm0, %ymm1
	addq	%rdi, %rsi
	movq	%rsi, -312(%rbp)
	movq	-328(%rbp), %rsi
	vpermq	$27, %ymm2, %ymm0
	movq	%rsi, %rdi
	andq	%r14, %rsi
	shrq	$56, %rdi
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	addq	%rdi, %rax
	vpermq	$27, %ymm0, %ymm0
	movq	%rax, -320(%rbp)
	movq	-336(%rbp), %rax
	vmovdqa	%ymm0, -304(%rbp)
	movq	%rax, %rdi
	andq	%r14, %rax
	shrq	$56, %rdi
	addq	%rax, %rdx
	addq	%rdi, %rsi
	movq	%rbx, %rdi
	movq	%rdx, -336(%rbp)
	movq	%rsi, -328(%rbp)
	vzeroupper
	call	p448_is_zero@PLT
	movq	-360(%rbp), %r11
	movq	-352(%rbp), %r10
	movq	%r13, %rdi
	movq	%rax, %r15
	movq	%r11, %rdx
	movq	%r10, %rsi
	call	p448_mul@PLT
	movq	-368(%rbp), %r9
	movq	%r13, %rdx
	movq	-344(%rbp), %r13
	movq	%r9, %rdi
	movq	%r13, %rsi
	call	p448_mul@PLT
	movq	-376(%rbp), %r8
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movq	%r8, %rdx
	call	p448_mul@PLT
	vmovdqa	.LC0(%rip), %ymm4
	movq	%r14, %rdi
	vmovdqa	.LC1(%rip), %ymm5
	vpsubq	-336(%rbp), %ymm4, %ymm0
	vmovdqa	%ymm0, -272(%rbp)
	movq	-256(%rbp), %rsi
	vpsubq	-304(%rbp), %ymm5, %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	movzbl	-209(%rbp), %edx
	addq	%rdx, -240(%rbp)
	andq	-248(%rbp), %rdi
	movq	%rsi, %rax
	andq	%r14, %rsi
	shrq	$56, %rax
	vmovdqu	-248(%rbp), %xmm0
	addq	%rdi, %rax
	movq	%rax, -248(%rbp)
	movq	-264(%rbp), %rax
	vinserti128	$0x1, -232(%rbp), %ymm0, %ymm2
	vpermq	$27, -240(%rbp), %ymm0
	movq	%rax, %rdi
	shrq	$56, %rdi
	andq	%r14, %rax
	addq	%rdi, %rsi
	movq	%rsi, -256(%rbp)
	movq	-272(%rbp), %rsi
	vpand	.LC2(%rip), %ymm0, %ymm1
	movq	%rsi, %rdi
	andq	%r14, %rsi
	vpermq	$27, %ymm2, %ymm0
	shrq	$56, %rdi
	addq	%rsi, %rdx
	addq	%rdi, %rax
	movq	%rdx, -272(%rbp)
	movq	%r14, %rdi
	movq	%rax, -264(%rbp)
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	-272(%rbp), %ymm1
	vmovdqa	%ymm0, -240(%rbp)
	vpaddq	-176(%rbp), %ymm0, %ymm0
	vpaddq	-208(%rbp), %ymm1, %ymm1
	vmovdqa	%ymm0, -304(%rbp)
	movzbl	-273(%rbp), %esi
	addq	%rsi, -304(%rbp)
	vmovdqa	%ymm1, -336(%rbp)
	vmovdqu	-312(%rbp), %xmm0
	vinserti128	$0x1, -296(%rbp), %ymm0, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vpsrlq	$56, %ymm0, %ymm1
	vpermq	$27, -304(%rbp), %ymm0
	movq	-320(%rbp), %rdx
	andq	-312(%rbp), %rdi
	movq	%rdx, %rax
	andq	%r14, %rdx
	shrq	$56, %rax
	vpand	.LC2(%rip), %ymm0, %ymm0
	addq	%rdi, %rax
	movq	%rax, -312(%rbp)
	movq	-328(%rbp), %rax
	movq	%rax, %rdi
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	shrq	$56, %rdi
	andq	%r14, %rax
	addq	%rdi, %rdx
	movq	%rdx, -320(%rbp)
	movq	-336(%rbp), %rdx
	vmovdqa	%ymm0, -304(%rbp)
	movq	%rdx, %rdi
	movq	%rdx, %rcx
	shrq	$56, %rdi
	andq	%r14, %rcx
	addq	%rdi, %rax
	addq	%rsi, %rcx
	movq	%rbx, %rdi
	movq	%rax, -328(%rbp)
	movq	%rcx, -336(%rbp)
	vzeroupper
	call	p448_is_zero@PLT
	movq	%r13, %rdi
	andq	%rax, %r15
	call	p448_is_zero@PLT
	notq	%rax
	andq	%r15, %rax
	movq	-56(%rbp), %rbx
	xorq	%fs:40, %rbx
	jne	.L137
	addq	$352, %rsp
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
.L137:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4693:
	.size	validate_extensible, .-validate_extensible
	.section	.text.unlikely.validate_extensible
.LCOLDE42:
	.section	.text.validate_extensible
.LHOTE42:
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.quad	144115188075855870
	.quad	144115188075855870
	.quad	144115188075855870
	.quad	144115188075855870
	.align 32
.LC1:
	.quad	144115188075855868
	.quad	144115188075855870
	.quad	144115188075855870
	.quad	144115188075855870
	.align 32
.LC2:
	.quad	72057594037927935
	.quad	72057594037927935
	.quad	72057594037927935
	.quad	72057594037927935
	.align 32
.LC7:
	.quad	216172782113783805
	.quad	216172782113783805
	.quad	216172782113783805
	.quad	216172782113783805
	.align 32
.LC8:
	.quad	216172782113783802
	.quad	216172782113783805
	.quad	216172782113783805
	.quad	216172782113783805
	.align 32
.LC19:
	.quad	288230376151711740
	.quad	288230376151711740
	.quad	288230376151711740
	.quad	288230376151711740
	.align 32
.LC20:
	.quad	288230376151711736
	.quad	288230376151711740
	.quad	288230376151711740
	.quad	288230376151711740
	.align 32
.LC23:
	.quad	72057594037927934
	.quad	72057594037927935
	.quad	72057594037927935
	.quad	72057594037927935
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
