	.file	"p448.c"
	.section	.text.unlikely.p448_mul,"ax",@progbits
.LCOLDB0:
	.section	.text.p448_mul,"ax",@progbits
.LHOTB0:
	.p2align 4,,15
	.globl	p448_mul
	.hidden	p448_mul
	.type	p448_mul, @function
p448_mul:
.LFB4623:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movq	%rdx, %rax
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
	subq	$160, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	vmovdqa	(%rsi), %ymm0
	movq	%fs:40, %rdx
	movq	%rdx, -56(%rbp)
	xorl	%edx, %edx
	vpaddq	32(%rsi), %ymm0, %ymm0
	vmovdqa	%ymm0, -176(%rbp)
	vmovdqa	32(%rax), %ymm0
	vpaddq	(%rax), %ymm0, %ymm1
	vpaddq	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm1, -144(%rbp)
	vmovdqa	%ymm0, -112(%rbp)
#APP
# 26 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq (%rsi), %rdx;mulx 24(%rax), %r9, %rcx;
# 0 "" 2
# 26 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -176(%rbp), %rdx;mulx -120(%rbp), %rbx, %r12;
# 0 "" 2
# 26 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 32(%rsi), %rdx;mulx 56(%rax), %r11, %r8;
# 0 "" 2
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 8(%rsi), %rdx; mulx 16(%rax), %r10, %r13; addq %r10, %r9; adcq %r13, %rcx; 
# 0 "" 2
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -168(%rbp), %rdx; mulx -128(%rbp), %r10, %r13; addq %r10, %rbx; adcq %r13, %r12; 
# 0 "" 2
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 40(%rsi), %rdx; mulx 48(%rax), %r10, %r13; addq %r10, %r11; adcq %r13, %r8; 
# 0 "" 2
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 16(%rsi), %rdx; mulx 8(%rax), %r10, %r13; addq %r10, %r9; adcq %r13, %rcx; 
# 0 "" 2
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -160(%rbp), %rdx; mulx -136(%rbp), %r10, %r13; addq %r10, %rbx; adcq %r13, %r12; 
# 0 "" 2
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 48(%rsi), %rdx; mulx 40(%rax), %r10, %r13; addq %r10, %r11; adcq %r13, %r8; 
# 0 "" 2
#NO_APP
	movq	%r9, %r13
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 24(%rsi), %rdx; mulx (%rax), %r9, %r10; addq %r9, %r13; adcq %r10, %rcx; 
# 0 "" 2
#NO_APP
	movq	%r13, %r9
	movq	%rcx, %r10
	movq	%rbx, %r13
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -152(%rbp), %rdx; mulx -144(%rbp), %rcx, %rbx; addq %rcx, %r13; adcq %rbx, %r12; 
# 0 "" 2
#NO_APP
	movq	%r13, %rcx
	movq	%r12, %rbx
	movq	%r11, %r13
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 56(%rsi), %rdx; mulx 32(%rax), %r11, %r12; addq %r11, %r13; adcq %r12, %r8; 
# 0 "" 2
#NO_APP
	subq	%r9, %rcx
	sbbq	%r10, %rbx
	addq	%r13, %r9
	movq	%rcx, %rdx
	adcq	%r8, %r10
	movq	%r9, %r15
	movabsq	$72057594037927935, %r8
	shrdq	$56, %rbx, %rcx
	andq	%r8, %rdx
	andq	%r8, %r15
	shrq	$56, %rbx
	shrdq	$56, %r10, %r9
	movq	%r15, 24(%rdi)
	movq	%rdx, -184(%rbp)
	shrq	$56, %r10
	movq	%rdx, 56(%rdi)
	movq	%rcx, %r13
	movq	%rbx, %r11
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -168(%rbp), %rdx; mulx -120(%rbp), %rcx, %rbx; addq %rcx, %r13; adcq %rbx, %r11; 
# 0 "" 2
#NO_APP
	movq	%r9, %r12
	movq	%r10, %rcx
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 40(%rsi), %rdx; mulx 56(%rax), %r9, %r10; addq %r9, %r12; adcq %r10, %rcx; 
# 0 "" 2
#NO_APP
	movq	%r13, %rbx
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -160(%rbp), %rdx; mulx -128(%rbp), %r9, %r10; addq %r9, %rbx; adcq %r10, %r11; 
# 0 "" 2
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 48(%rsi), %rdx; mulx 48(%rax), %r9, %r10; addq %r9, %r12; adcq %r10, %rcx; 
# 0 "" 2
#NO_APP
	movq	%r12, %r9
	movq	%rcx, %r10
	movq	%rbx, %r12
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -152(%rbp), %rdx; mulx -136(%rbp), %rcx, %rbx; addq %rcx, %r12; adcq %rbx, %r11; 
# 0 "" 2
#NO_APP
	addq	%r12, %r9
	movq	%r12, %rcx
	movq	%r11, %rbx
	adcq	%r11, %r10
#APP
# 26 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq (%rsi), %rdx;mulx (%rax), %r14, %r13;
# 0 "" 2
#NO_APP
	subq	%r14, %r9
	sbbq	%r13, %r10
	addq	%r14, %rcx
	adcq	%r13, %rbx
	movq	%rcx, %r11
	movq	%rbx, %rcx
#APP
# 199 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 8(%rsi), %rdx; mulx 24(%rax), %rbx, %r12; subq %rbx, %r11; sbbq %r12, %rcx; 
# 0 "" 2
# 199 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 16(%rsi), %rdx; mulx 16(%rax), %rbx, %r12; subq %rbx, %r11; sbbq %r12, %rcx; 
# 0 "" 2
#NO_APP
	movq	%r9, %r12
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 56(%rsi), %rdx; mulx 40(%rax), %r9, %rbx; addq %r9, %r12; adcq %rbx, %r10; 
# 0 "" 2
#NO_APP
	movq	%rcx, %r9
#APP
# 199 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 24(%rsi), %rdx; mulx 8(%rax), %rcx, %rbx; subq %rcx, %r11; sbbq %rbx, %r9; 
# 0 "" 2
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -176(%rbp), %rdx; mulx -144(%rbp), %rcx, %rbx; addq %rcx, %r12; adcq %rbx, %r10; 
# 0 "" 2
#NO_APP
	movq	%r12, %rcx
	movq	%r10, %rbx
	movq	%r9, %r12
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 32(%rsi), %rdx; mulx 32(%rax), %r9, %r10; addq %r9, %r11; adcq %r10, %r12; 
# 0 "" 2
#NO_APP
	movq	%r11, %r9
	movq	%r11, %r14
	movq	%rcx, %r11
	andq	%r8, %r14
	andq	%r8, %r11
	movq	%r12, %r10
	shrdq	$56, %rbx, %rcx
	movq	%r14, -192(%rbp)
	movq	%r14, (%rdi)
	shrq	$56, %r10
	movq	%r11, -200(%rbp)
	movq	%r11, 32(%rdi)
	shrq	$56, %rbx
	shrdq	$56, %r12, %r9
#APP
# 26 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 16(%rsi), %rdx;mulx 56(%rax), %r12, %r11;
# 0 "" 2
#NO_APP
	movq	%r9, %r14
	movq	%r10, %r9
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 48(%rsi), %rdx; mulx -120(%rbp), %r10, %r13; addq %r10, %r14; adcq %r13, %r9; 
# 0 "" 2
#NO_APP
	movq	%rcx, %r13
	movq	%rbx, %rcx
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -160(%rbp), %rdx; mulx -88(%rbp), %r10, %rbx; addq %r10, %r13; adcq %rbx, %rcx; 
# 0 "" 2
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 24(%rsi), %rdx; mulx 48(%rax), %r10, %rbx; addq %r10, %r12; adcq %rbx, %r11; 
# 0 "" 2
#NO_APP
	movq	%r14, %r10
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 56(%rsi), %rdx; mulx -128(%rbp), %rbx, %r14; addq %rbx, %r10; adcq %r14, %r9; 
# 0 "" 2
#NO_APP
	movq	%r13, %rbx
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -152(%rbp), %rdx; mulx -96(%rbp), %r13, %r14; addq %r13, %rbx; adcq %r14, %rcx; 
# 0 "" 2
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq (%rsi), %rdx; mulx 8(%rax), %r13, %r14; addq %r13, %r12; adcq %r14, %r11; 
# 0 "" 2
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -176(%rbp), %rdx; mulx -136(%rbp), %r13, %r14; addq %r13, %rbx; adcq %r14, %rcx; 
# 0 "" 2
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 32(%rsi), %rdx; mulx 40(%rax), %r13, %r14; addq %r13, %r10; adcq %r14, %r9; 
# 0 "" 2
#NO_APP
	movq	%r12, %r13
	movq	%r11, %r14
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 8(%rsi), %rdx; mulx (%rax), %r11, %r12; addq %r11, %r13; adcq %r12, %r14; 
# 0 "" 2
#NO_APP
	movq	%r13, %r11
	movq	%r14, %r12
	movq	%rbx, %r13
	movq	%rcx, %r14
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -168(%rbp), %rdx; mulx -144(%rbp), %rcx, %rbx; addq %rcx, %r13; adcq %rbx, %r14; 
# 0 "" 2
#NO_APP
	movq	%r13, %rcx
	movq	%r14, %rbx
	movq	%r10, %r13
	movq	%r9, %r14
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 40(%rsi), %rdx; mulx 32(%rax), %r9, %r10; addq %r9, %r13; adcq %r10, %r14; 
# 0 "" 2
#NO_APP
	subq	%r11, %rcx
	movq	%r13, %r9
	movq	%r14, %r10
	sbbq	%r12, %rbx
	addq	%r11, %r9
	adcq	%r12, %r10
	movq	%r9, %r13
	movq	%rcx, %r12
	andq	%r8, %r13
	andq	%r8, %r12
	shrdq	$56, %r10, %r9
	shrdq	$56, %rbx, %rcx
	movq	%r13, 8(%rdi)
	movq	%r12, 40(%rdi)
	shrq	$56, %r10
	shrq	$56, %rbx
#APP
# 26 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 24(%rsi), %rdx;mulx 56(%rax), %r14, %r13;
# 0 "" 2
#NO_APP
	movq	%r9, %r12
	movq	%r10, %r11
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 56(%rsi), %rdx; mulx -120(%rbp), %r9, %r10; addq %r9, %r12; adcq %r10, %r11; 
# 0 "" 2
#NO_APP
	movq	%rcx, %r10
	movq	%rbx, %r9
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -152(%rbp), %rdx; mulx -88(%rbp), %rcx, %rbx; addq %rcx, %r10; adcq %rbx, %r9; 
# 0 "" 2
#NO_APP
	movq	%r14, %rbx
	movq	%r13, %rcx
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq (%rsi), %rdx; mulx 16(%rax), %r13, %r14; addq %r13, %rbx; adcq %r14, %rcx; 
# 0 "" 2
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -176(%rbp), %rdx; mulx -128(%rbp), %r13, %r14; addq %r13, %r10; adcq %r14, %r9; 
# 0 "" 2
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 32(%rsi), %rdx; mulx 48(%rax), %r13, %r14; addq %r13, %r12; adcq %r14, %r11; 
# 0 "" 2
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 8(%rsi), %rdx; mulx 8(%rax), %r13, %r14; addq %r13, %rbx; adcq %r14, %rcx; 
# 0 "" 2
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -168(%rbp), %rdx; mulx -136(%rbp), %r13, %r14; addq %r13, %r10; adcq %r14, %r9; 
# 0 "" 2
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 40(%rsi), %rdx; mulx 40(%rax), %r13, %r14; addq %r13, %r12; adcq %r14, %r11; 
# 0 "" 2
#NO_APP
	movq	%rbx, %r13
	movq	%rcx, %r14
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 16(%rsi), %rdx; mulx (%rax), %rcx, %rbx; addq %rcx, %r13; adcq %rbx, %r14; 
# 0 "" 2
#NO_APP
	movq	%r13, %rcx
	movq	%r14, %rbx
	movq	%r10, %r13
	movq	%r9, %r14
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -160(%rbp), %rdx; mulx -144(%rbp), %r9, %r10; addq %r9, %r13; adcq %r10, %r14; 
# 0 "" 2
#NO_APP
	movq	%r13, %r9
	movq	%r14, %r10
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 48(%rsi), %rdx; mulx 32(%rax), %rax, %rsi; addq %rax, %r12; adcq %rsi, %r11; 
# 0 "" 2
#NO_APP
	subq	%rcx, %r9
	sbbq	%rbx, %r10
	addq	%r12, %rcx
	adcq	%r11, %rbx
	movq	%rcx, %rax
	movq	-184(%rbp), %r11
	andq	%r8, %rax
	xorl	%edx, %edx
	shrdq	$56, %rbx, %rcx
	movq	%rax, 16(%rdi)
	movq	%r9, %rax
	shrq	$56, %rbx
	shrdq	$56, %r10, %r9
	andq	%r8, %rax
	shrq	$56, %r10
	addq	%r15, %rcx
	adcq	%rdx, %rbx
	xorl	%r12d, %r12d
	addq	%r11, %r9
	adcq	%r12, %r10
	movq	%rax, 48(%rdi)
	movq	%rcx, %rax
	andq	%r8, %rax
	andq	%r9, %r8
	shrdq	$56, %rbx, %rcx
	shrdq	$56, %r10, %r9
	movq	%rax, 24(%rdi)
	movq	%r8, 56(%rdi)
	addq	%r9, %rcx
	addq	-192(%rbp), %r9
	addq	-200(%rbp), %rcx
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	movq	%rcx, 32(%rdi)
	movq	%r9, (%rdi)
	jne	.L6
	vzeroupper
	addq	$160, %rsp
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
	vzeroupper
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4623:
	.size	p448_mul, .-p448_mul
	.section	.text.unlikely.p448_mul
.LCOLDE0:
	.section	.text.p448_mul
.LHOTE0:
	.section	.text.unlikely.p448_mulw,"ax",@progbits
.LCOLDB1:
	.section	.text.p448_mulw,"ax",@progbits
.LHOTB1:
	.p2align 4,,15
	.globl	p448_mulw
	.hidden	p448_mulw
	.type	p448_mulw, @function
p448_mulw:
.LFB4624:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
#APP
# 48 "src/p448/arch_x86_64/x86-64-arith.h" 1
	mulx (%rsi), %rcx, %rax;
# 0 "" 2
#NO_APP
	movq	%rcx, %r9
	movq	%rax, %r10
#APP
# 48 "src/p448/arch_x86_64/x86-64-arith.h" 1
	mulx 32(%rsi), %r8, %rax;
# 0 "" 2
#NO_APP
	movq	%rax, %rbx
	movq	%r9, %r13
	movabsq	$72057594037927935, %rax
	shrdq	$56, %r10, %r9
	movq	%r8, %rcx
	andq	%rax, %r13
	shrq	$56, %r10
	andq	%rax, %r8
	movq	%r13, (%rdi)
	movq	%r9, %rbp
	shrdq	$56, %rbx, %rcx
	movq	%r8, 32(%rdi)
	shrq	$56, %rbx
	movq	%r10, %r11
#APP
# 145 "src/p448/arch_x86_64/x86-64-arith.h" 1
	mulx 8(%rsi), %r9, %r10; addq %r9, %rbp; adcq %r10, %r11; 
# 0 "" 2
#NO_APP
	movq	%rbp, %r9
	movq	%r11, %r10
	movq	%rcx, %rbp
	movq	%rbx, %r11
#APP
# 145 "src/p448/arch_x86_64/x86-64-arith.h" 1
	mulx 40(%rsi), %rcx, %rbx; addq %rcx, %rbp; adcq %rbx, %r11; 
# 0 "" 2
#NO_APP
	movq	%r9, %r14
	movq	%rbp, %rcx
	movq	%r11, %rbx
	shrdq	$56, %r10, %r9
	andq	%rax, %r14
	shrq	$56, %r10
	andq	%rax, %rbp
	shrdq	$56, %r11, %rcx
	movq	%r14, 8(%rdi)
	movq	%rbp, 40(%rdi)
	shrq	$56, %rbx
	movq	%r9, %r11
	movq	%r10, %r12
#APP
# 145 "src/p448/arch_x86_64/x86-64-arith.h" 1
	mulx 16(%rsi), %r9, %r10; addq %r9, %r11; adcq %r10, %r12; 
# 0 "" 2
#NO_APP
	movq	%r11, %r9
	movq	%r12, %r10
	movq	%rcx, %r11
	movq	%rbx, %r12
#APP
# 145 "src/p448/arch_x86_64/x86-64-arith.h" 1
	mulx 48(%rsi), %rcx, %rbx; addq %rcx, %r11; adcq %rbx, %r12; 
# 0 "" 2
#NO_APP
	movq	%r11, %rcx
	movq	%r9, %r11
	movq	%r12, %rbx
	andq	%rax, %r11
	shrq	$56, %rbx
	shrdq	$56, %r10, %r9
	movq	%r11, 16(%rdi)
	movq	%rcx, %r11
	shrq	$56, %r10
	andq	%rax, %r11
	movq	%r11, 48(%rdi)
	movq	%r9, %r11
	shrdq	$56, %r12, %rcx
	movq	%r10, %r12
#APP
# 145 "src/p448/arch_x86_64/x86-64-arith.h" 1
	mulx 24(%rsi), %r9, %r10; addq %r9, %r11; adcq %r10, %r12; 
# 0 "" 2
#NO_APP
	movq	%r11, %r9
	movq	%r12, %r10
	movq	%rcx, %r11
	movq	%rbx, %r12
#APP
# 145 "src/p448/arch_x86_64/x86-64-arith.h" 1
	mulx 56(%rsi), %rdx, %rcx; addq %rdx, %r11; adcq %rcx, %r12; 
# 0 "" 2
#NO_APP
	movq	%r9, %rdx
	movq	%r11, %rcx
	movq	%r12, %rbx
	andq	%rax, %rdx
	shrq	$56, %rbx
	shrdq	$56, %r12, %rcx
	shrdq	$56, %r10, %r9
	movq	%rdx, 24(%rdi)
	movq	%r11, %rdx
	shrq	$56, %r10
	andq	%rax, %rdx
	addq	%rcx, %r9
	adcq	%rbx, %r10
	xorl	%r12d, %r12d
	addq	%r8, %r9
	adcq	%r12, %r10
	movq	%rdx, 56(%rdi)
	movq	%r9, %rdx
	shrdq	$56, %r10, %r9
	andq	%rax, %rdx
	xorl	%r10d, %r10d
	addq	%rbp, %r9
	addq	%r13, %rcx
	movq	%rdx, 32(%rdi)
	adcq	%r10, %rbx
	andq	%rcx, %rax
	movq	%r9, 40(%rdi)
	shrdq	$56, %rbx, %rcx
	movq	%rax, (%rdi)
	addq	%r14, %rcx
	popq	%rbx
	.cfi_def_cfa_offset 40
	movq	%rcx, 8(%rdi)
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4624:
	.size	p448_mulw, .-p448_mulw
	.section	.text.unlikely.p448_mulw
.LCOLDE1:
	.section	.text.p448_mulw
.LHOTE1:
	.section	.text.unlikely.p448_sqr,"ax",@progbits
.LCOLDB2:
	.section	.text.p448_sqr,"ax",@progbits
.LHOTB2:
	.p2align 4,,15
	.globl	p448_sqr
	.hidden	p448_sqr
	.type	p448_sqr, @function
p448_sqr:
.LFB4625:
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
	subq	$96, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	vmovdqa	(%rsi), %ymm0
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	vpaddq	32(%rsi), %ymm0, %ymm0
	vmovdqa	%ymm0, -112(%rbp)
#APP
# 26 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq (%rsi), %rdx;mulx 24(%rsi), %rbx, %rcx;
# 0 "" 2
# 26 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -112(%rbp), %rdx;mulx -88(%rbp), %r12, %rax;
# 0 "" 2
# 26 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 32(%rsi), %rdx;mulx 56(%rsi), %r11, %r8;
# 0 "" 2
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 8(%rsi), %rdx; mulx 16(%rsi), %r9, %r10; addq %r9, %rbx; adcq %r10, %rcx; 
# 0 "" 2
#NO_APP
	movq	%rbx, %r9
	movq	%rcx, %r10
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -104(%rbp), %rdx; mulx -96(%rbp), %rcx, %rbx; addq %rcx, %r12; adcq %rbx, %rax; 
# 0 "" 2
#NO_APP
	movq	%r12, %rcx
	movq	%rax, %rbx
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 40(%rsi), %rdx; mulx 48(%rsi), %rax, %r12; addq %rax, %r11; adcq %r12, %r8; 
# 0 "" 2
#NO_APP
	subq	%r9, %rcx
	movq	%r11, %rax
	movq	%r8, %rdx
	sbbq	%r10, %rbx
	addq	%r9, %rax
	leaq	(%rcx,%rcx), %r9
	adcq	%r10, %rdx
	leaq	(%rax,%rax), %r15
	movabsq	$72057594037927935, %r8
	shrdq	$55, %rdx, %rax
	shrdq	$55, %rbx, %rcx
	movq	%r9, %r14
	andq	%r8, %r15
	shrq	$55, %rbx
	andq	%r8, %r14
	shrq	$55, %rdx
	movq	%rax, %r9
	movq	%r15, 24(%rdi)
	movq	%r14, -120(%rbp)
	movq	%rdx, %r10
	movq	%r14, 56(%rdi)
	movq	%rcx, %rax
	movq	%rbx, %r11
#APP
# 171 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -104(%rbp), %rdx; addq %rdx, %rdx; mulx -88(%rbp), %rcx, %rbx; addq %rcx, %rax; adcq %rbx, %r11; 
# 0 "" 2
#NO_APP
	movq	%r9, %r12
	movq	%r10, %r9
#APP
# 171 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 40(%rsi), %rdx; addq %rdx, %rdx; mulx 56(%rsi), %rcx, %r10; addq %rcx, %r12; adcq %r10, %r9; 
# 0 "" 2
#NO_APP
	movq	%r9, %rbx
	movq	%r12, %rcx
	movq	%rax, %r10
	movq	%r11, %r9
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -96(%rbp), %rdx; mulx -96(%rbp), %rax, %r11; addq %rax, %r10; adcq %r11, %r9; 
# 0 "" 2
#NO_APP
	addq	%r10, %rcx
	movq	%r10, %rax
	movq	%r9, %r11
	adcq	%r9, %rbx
#APP
# 224 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 8(%rsi), %rdx; addq %rdx, %rdx; mulx 24(%rsi), %r9, %r10; subq %r9, %rax; sbbq %r10, %r11; 
# 0 "" 2
#NO_APP
	movq	%rax, %r9
	movq	%r11, %r10
	movq	%rbx, %rax
	movq	%rcx, %r11
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 48(%rsi), %rdx; mulx 48(%rsi), %rcx, %rbx; addq %rcx, %r11; adcq %rbx, %rax; 
# 0 "" 2
#NO_APP
	movq	%r11, %rcx
	movq	%rax, %rbx
#APP
# 26 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq (%rsi), %rdx;mulx (%rsi), %r12, %r11;
# 0 "" 2
#NO_APP
	subq	%r12, %rcx
	movq	%r12, %rax
	movq	%r11, %rdx
	sbbq	%r11, %rbx
	addq	%r9, %rax
	adcq	%r10, %rdx
	movq	%rax, %r9
	movq	%rdx, %rax
#APP
# 199 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 16(%rsi), %rdx; mulx 16(%rsi), %r10, %r11; subq %r10, %r9; sbbq %r11, %rax; 
# 0 "" 2
#NO_APP
	movq	%rcx, %r10
	movq	%rbx, %rcx
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -112(%rbp), %rdx; mulx -112(%rbp), %r11, %rbx; addq %r11, %r10; adcq %rbx, %rcx; 
# 0 "" 2
#NO_APP
	movq	%r10, %r13
	movq	%rcx, %r14
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 32(%rsi), %rdx; mulx 32(%rsi), %rcx, %r10; addq %rcx, %r9; adcq %r10, %rax; 
# 0 "" 2
#NO_APP
	movq	%rax, %rbx
	movq	%r9, %rdx
	movq	%r13, %rax
	andq	%r8, %rdx
	andq	%r8, %rax
	movq	%r9, %rcx
	shrdq	$56, %rbx, %rcx
	shrdq	$56, %r14, %r13
	movq	%rdx, -128(%rbp)
	movq	%rdx, (%rdi)
	shrq	$56, %rbx
	movq	%rax, -136(%rbp)
	movq	%rax, 32(%rdi)
	shrq	$56, %r14
#APP
# 69 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -96(%rbp), %rdx;leaq (,%rdx,2), %rdx;mulx -88(%rbp), %r11, %rax;
# 0 "" 2
#NO_APP
	movq	%rax, %r10
	movq	%r11, %r9
	movq	%rcx, %rax
	movq	%rbx, %rcx
#APP
# 224 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 16(%rsi), %rdx; addq %rdx, %rdx; mulx 24(%rsi), %r11, %rbx; subq %r11, %rax; sbbq %rbx, %rcx; 
# 0 "" 2
#NO_APP
	movq	%rax, %r11
	movq	%rcx, %r12
	movq	%r13, %rax
	movq	%r14, %r13
#APP
# 171 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 48(%rsi), %rdx; addq %rdx, %rdx; mulx 56(%rsi), %rcx, %rbx; addq %rcx, %rax; adcq %rbx, %r13; 
# 0 "" 2
#NO_APP
	movq	%rax, %rcx
	movq	%r13, %rbx
	addq	%r9, %rcx
	adcq	%r10, %rbx
	addq	%r9, %r11
	adcq	%r10, %r12
	movq	%r11, %r13
	movq	%r12, %r14
#APP
# 69 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq (%rsi), %rdx;leaq (,%rdx,2), %rdx;mulx 8(%rsi), %r11, %rax;
# 0 "" 2
#NO_APP
	movq	%rax, %r10
	movq	%r11, %r9
	movq	%rcx, %rax
	movq	%rbx, %rcx
#APP
# 171 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -112(%rbp), %rdx; addq %rdx, %rdx; mulx -104(%rbp), %r11, %rbx; addq %r11, %rax; adcq %rbx, %rcx; 
# 0 "" 2
#NO_APP
	movq	%rax, %r11
	movq	%rcx, %r12
	movq	%r13, %rax
	movq	%r14, %r13
#APP
# 171 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 32(%rsi), %rdx; addq %rdx, %rdx; mulx 40(%rsi), %rcx, %rbx; addq %rcx, %rax; adcq %rbx, %r13; 
# 0 "" 2
#NO_APP
	subq	%r9, %r11
	movq	%rax, %rcx
	movq	%r13, %rbx
	sbbq	%r10, %r12
	addq	%r9, %rcx
	movq	%rcx, %r9
	adcq	%r10, %rbx
	andq	%r8, %r9
	shrdq	$56, %rbx, %rcx
	movq	%r9, 8(%rdi)
	movq	%r11, %r9
	shrq	$56, %rbx
	andq	%r8, %r9
	movq	%rbx, %r10
	movq	%r9, 40(%rdi)
	movq	%rcx, %r9
	shrdq	$56, %r12, %r11
	shrq	$56, %r12
#APP
# 26 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -88(%rbp), %rdx;mulx -88(%rbp), %r13, %rax;
# 0 "" 2
#NO_APP
	movq	%r13, %rcx
	movq	%rax, %rbx
	movq	%r10, %r13
	movq	%r9, %rax
#APP
# 199 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 24(%rsi), %rdx; mulx 24(%rsi), %r9, %r10; subq %r9, %rax; sbbq %r10, %r13; 
# 0 "" 2
#NO_APP
	movq	%rax, %r9
	movq	%r13, %r10
	movq	%r11, %rax
	movq	%r12, %r13
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 56(%rsi), %rdx; mulx 56(%rsi), %r11, %r12; addq %r11, %rax; adcq %r12, %r13; 
# 0 "" 2
#NO_APP
	movq	%rax, %r11
	movq	%r13, %r12
	addq	%rcx, %r11
	adcq	%rbx, %r12
	addq	%r9, %rcx
	adcq	%r10, %rbx
#APP
# 69 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq (%rsi), %rdx;leaq (,%rdx,2), %rdx;mulx 16(%rsi), %r14, %r13;
# 0 "" 2
#NO_APP
	movq	%r11, %r10
	movq	%r12, %r9
#APP
# 171 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -112(%rbp), %rdx; addq %rdx, %rdx; mulx -96(%rbp), %rax, %r11; addq %rax, %r10; adcq %r11, %r9; 
# 0 "" 2
#NO_APP
	movq	%rcx, %r11
	movq	%rbx, %rax
#APP
# 171 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 32(%rsi), %rdx; addq %rdx, %rdx; mulx 48(%rsi), %rcx, %rbx; addq %rcx, %r11; adcq %rbx, %rax; 
# 0 "" 2
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 8(%rsi), %rdx; mulx 8(%rsi), %rcx, %rbx; addq %rcx, %r14; adcq %rbx, %r13; 
# 0 "" 2
#NO_APP
	movq	%r13, %rbx
	movq	%r14, %rcx
	movq	%r10, %r12
	movq	%r9, %r13
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq -104(%rbp), %rdx; mulx -104(%rbp), %r9, %r10; addq %r9, %r12; adcq %r10, %r13; 
# 0 "" 2
#NO_APP
	movq	%r12, %r9
	movq	%r13, %r10
#APP
# 85 "src/p448/arch_x86_64/x86-64-arith.h" 1
	movq 40(%rsi), %rdx; mulx 40(%rsi), %rsi, %r12; addq %rsi, %r11; adcq %r12, %rax; 
# 0 "" 2
#NO_APP
	subq	%r14, %r9
	sbbq	%rbx, %r10
	addq	%r11, %rcx
	adcq	%rax, %rbx
	movq	%rcx, %rsi
	movq	-120(%rbp), %rax
	andq	%r8, %rsi
	xorl	%r14d, %r14d
	shrdq	$56, %rbx, %rcx
	movq	%rsi, 16(%rdi)
	movq	%r9, %rsi
	shrq	$56, %rbx
	shrdq	$56, %r10, %r9
	andq	%r8, %rsi
	shrq	$56, %r10
	addq	%r15, %rcx
	adcq	%r14, %rbx
	xorl	%edx, %edx
	addq	%r9, %rax
	adcq	%r10, %rdx
	movq	%rsi, 48(%rdi)
	movq	%rcx, %rsi
	andq	%r8, %rsi
	andq	%rax, %r8
	shrdq	$56, %rbx, %rcx
	shrdq	$56, %rdx, %rax
	movq	%rsi, 24(%rdi)
	movq	%r8, 56(%rdi)
	addq	%rax, %rcx
	addq	-128(%rbp), %rax
	addq	-136(%rbp), %rcx
	movq	%rax, (%rdi)
	movq	%rcx, 32(%rdi)
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L13
	vzeroupper
	addq	$96, %rsp
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
.L13:
	.cfi_restore_state
	vzeroupper
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4625:
	.size	p448_sqr, .-p448_sqr
	.section	.text.unlikely.p448_sqr
.LCOLDE2:
	.section	.text.p448_sqr
.LHOTE2:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"src/p448/arch_x86_64/p448.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
	.string	"is_zero(scarry) | is_zero(scarry+1)"
	.section	.rodata.str1.1
.LC5:
	.string	"is_zero(carry + scarry)"
	.section	.text.unlikely.p448_strong_reduce,"ax",@progbits
.LCOLDB6:
	.section	.text.p448_strong_reduce,"ax",@progbits
.LHOTB6:
	.p2align 4,,15
	.globl	p448_strong_reduce
	.hidden	p448_strong_reduce
	.type	p448_strong_reduce, @function
p448_strong_reduce:
.LFB4626:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movabsq	$-72057594037927935, %r11
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	$-1, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	xorl	%ebx, %ebx
	movabsq	$72057594037927935, %rax
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	56(%rdi), %r8
	movq	8(%rdi), %r9
	movq	%r8, %rdx
	shrq	$56, %rdx
	addq	%rdx, 32(%rdi)
	addq	(%rdi), %rdx
	movq	%rdx, %rcx
	addq	%r11, %rcx
	adcq	%r12, %rbx
	movq	%rcx, %rdx
	xorl	%r10d, %r10d
	shrdq	$56, %rbx, %rcx
	andq	%rax, %rdx
	sarq	$56, %rbx
	addq	%r9, %rcx
	movq	16(%rdi), %r9
	movq	%rdx, (%rdi)
	adcq	%r10, %rbx
	addq	%r11, %rcx
	adcq	%r12, %rbx
	movq	%rcx, %rsi
	xorl	%r10d, %r10d
	shrdq	$56, %rbx, %rcx
	andq	%rax, %rsi
	sarq	$56, %rbx
	addq	%r9, %rcx
	movq	%rsi, 8(%rdi)
	adcq	%r10, %rbx
	addq	%r11, %rcx
	adcq	%r12, %rbx
	movq	%rcx, %r15
	shrdq	$56, %rbx, %rcx
	sarq	$56, %rbx
	andq	%rax, %r15
	movq	%rcx, %r9
	movq	24(%rdi), %rcx
	movq	%rbx, %r10
	xorl	%ebx, %ebx
	movq	%r15, 16(%rdi)
	addq	%r9, %rcx
	movq	32(%rdi), %r9
	adcq	%r10, %rbx
	addq	%r11, %rcx
	adcq	%r12, %rbx
	movq	%rcx, %r14
	xorl	%r10d, %r10d
	shrdq	$56, %rbx, %rcx
	andq	%rax, %r14
	sarq	$56, %rbx
	addq	%r9, %rcx
	movabsq	$-72057594037927934, %r9
	movq	%r14, (%rsp)
	adcq	%r10, %rbx
	addq	%r9, %rcx
	movq	$-1, %r10
	adcq	%r10, %rbx
	movq	40(%rdi), %r9
	movq	%rcx, %r10
	shrdq	$56, %rbx, %rcx
	andq	%rax, %r10
	sarq	$56, %rbx
	movq	%r14, 24(%rdi)
	movq	%r10, 8(%rsp)
	movq	%r10, 32(%rdi)
	xorl	%r10d, %r10d
	addq	%r9, %rcx
	adcq	%r10, %rbx
	addq	%r11, %rcx
	adcq	%r12, %rbx
	movq	%rcx, %r14
	shrdq	$56, %rbx, %rcx
	sarq	$56, %rbx
	andq	%rax, %r14
	movq	%rcx, %r9
	movq	48(%rdi), %rcx
	movq	%rbx, %r10
	xorl	%ebx, %ebx
	movq	%r14, 16(%rsp)
	movq	%r14, 40(%rdi)
	addq	%r9, %rcx
	adcq	%r10, %rbx
	addq	%r11, %rcx
	adcq	%r12, %rbx
	movq	%rcx, %r10
	andq	%rax, %r8
	shrdq	$56, %rbx, %rcx
	andq	%rax, %r10
	sarq	$56, %rbx
	movq	%r10, 24(%rsp)
	movq	%r10, 48(%rdi)
	xorl	%r10d, %r10d
	addq	%r8, %rcx
	adcq	%r10, %rbx
	addq	%r11, %rcx
	adcq	%r12, %rbx
	movq	%rcx, %rbp
	shrdq	$56, %rbx, %rcx
	andq	%rax, %rbp
	movq	%rbp, 56(%rdi)
	movq	%rcx, %r10
#APP
# 275 "src/p448/arch_x86_64/x86-64-arith.h" 1
	neg %r10; sbb %r10, %r10;
# 0 "" 2
#NO_APP
	leaq	1(%rcx), %r9
#APP
# 275 "src/p448/arch_x86_64/x86-64-arith.h" 1
	neg %r9; sbb %r9, %r9;
# 0 "" 2
#NO_APP
	andq	%r10, %r9
	cmpq	$-1, %r9
	je	.L19
	movq	%rcx, %r8
	andq	%rax, %rcx
	movq	%rdx, %r9
	movq	%rcx, %rbx
	xorl	%r10d, %r10d
	movq	(%rsp), %r11
	sarq	$63, %rbx
	addq	%rcx, %r9
	movq	%rcx, %r13
	adcq	%rbx, %r10
	movq	%r9, %rdx
	xorl	%r12d, %r12d
	shrdq	$56, %r10, %r9
	andq	%rax, %rdx
	shrq	$56, %r10
	movq	%rbx, %r14
	addq	%rsi, %r9
	movq	%rdx, (%rdi)
	adcq	%r12, %r10
	addq	%rcx, %r9
	adcq	%rbx, %r10
	movq	%r9, %rdx
	xorl	%r12d, %r12d
	shrdq	$56, %r10, %r9
	andq	%rax, %rdx
	shrq	$56, %r10
	addq	%r15, %r9
	movq	%rdx, 8(%rdi)
	adcq	%r12, %r10
	addq	%rcx, %r9
	adcq	%rbx, %r10
	movq	%r9, %rdx
	xorl	%r12d, %r12d
	shrdq	$56, %r10, %r9
	andq	%rax, %rdx
	shrq	$56, %r10
	addq	%r9, %r11
	movq	8(%rsp), %r9
	movq	%rdx, 16(%rdi)
	adcq	%r10, %r12
	addq	%rcx, %r11
	adcq	%rbx, %r12
	movq	%r11, %rdx
	xorl	%r10d, %r10d
	shrdq	$56, %r12, %r11
	andq	%rax, %rdx
	shrq	$56, %r12
	addq	%r11, %r9
	movq	%rdx, 24(%rdi)
	adcq	%r12, %r10
	andq	$-2, %rcx
	xorl	%ebx, %ebx
	addq	%r9, %rcx
	adcq	%r10, %rbx
	movq	%rcx, %rdx
	shrdq	$56, %rbx, %rcx
	shrq	$56, %rbx
	andq	%rax, %rdx
	movq	%rcx, %r9
	movq	16(%rsp), %rcx
	movq	%rbx, %r10
	xorl	%ebx, %ebx
	movq	%rdx, 32(%rdi)
	addq	%r9, %rcx
	movq	24(%rsp), %r9
	adcq	%r10, %rbx
	addq	%r13, %rcx
	adcq	%r14, %rbx
	movq	%rcx, %rdx
	xorl	%r10d, %r10d
	shrdq	$56, %rbx, %rcx
	andq	%rax, %rdx
	shrq	$56, %rbx
	addq	%r9, %rcx
	movq	%rdx, 40(%rdi)
	adcq	%r10, %rbx
	addq	%r13, %rcx
	adcq	%r14, %rbx
	movq	%rcx, %rdx
	shrdq	$56, %rbx, %rcx
	shrq	$56, %rbx
	andq	%rax, %rdx
	movq	%rcx, %r9
	movq	%rbp, %rcx
	movq	%rbx, %r10
	xorl	%ebx, %ebx
	addq	%r9, %rcx
	movq	%rdx, 48(%rdi)
	adcq	%r10, %rbx
	addq	%r13, %rcx
	adcq	%r14, %rbx
	andq	%rcx, %rax
	shrdq	$56, %rbx, %rcx
	movq	%rax, 56(%rdi)
	addq	%r8, %rcx
#APP
# 275 "src/p448/arch_x86_64/x86-64-arith.h" 1
	neg %rcx; sbb %rcx, %rcx;
# 0 "" 2
#NO_APP
	cmpq	$-1, %rcx
	je	.L20
	addq	$40, %rsp
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
.L19:
	.cfi_restore_state
	leaq	__PRETTY_FUNCTION__.26714(%rip), %rcx
	leaq	.LC3(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	movl	$336, %edx
	call	__assert_fail@PLT
.L20:
	leaq	__PRETTY_FUNCTION__.26714(%rip), %rcx
	leaq	.LC3(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	movl	$348, %edx
	call	__assert_fail@PLT
	.cfi_endproc
.LFE4626:
	.size	p448_strong_reduce, .-p448_strong_reduce
	.section	.text.unlikely.p448_strong_reduce
.LCOLDE6:
	.section	.text.p448_strong_reduce
.LHOTE6:
	.section	.text.unlikely.p448_is_zero,"ax",@progbits
.LCOLDB7:
	.section	.text.p448_is_zero,"ax",@progbits
.LHOTB7:
	.p2align 4,,15
	.globl	p448_is_zero
	.hidden	p448_is_zero
	.type	p448_is_zero, @function
p448_is_zero:
.LFB4627:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movabsq	$-72057594037927935, %r9
	movabsq	$72057594037927935, %rcx
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
	movq	$-1, %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	$56, %ebx
	movq	$-1, %r10
	subq	$160, %rsp
	vmovdqa	(%rdi), %ymm1
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	vmovdqa	%xmm1, %xmm0
	vmovdqa	%ymm1, -144(%rbp)
	movq	-128(%rbp), %r13
	vmovq	%xmm0, %rax
	vmovdqa	32(%rdi), %ymm0
	xorl	%edi, %edi
	vmovdqa	%ymm0, -112(%rbp)
	shrx	%rbx, -88(%rbp), %rdx
	leaq	(%rdx,%rax), %rsi
	movq	%rdx, %r11
	addq	-112(%rbp), %r11
	movq	-136(%rbp), %rax
	addq	%r9, %rsi
	adcq	%r10, %rdi
	movq	%rsi, %r8
	xorl	%edx, %edx
	shrdq	$56, %rdi, %rsi
	andq	%rcx, %r8
	sarq	$56, %rdi
	addq	%rax, %rsi
	movq	%r8, -144(%rbp)
	adcq	%rdx, %rdi
	addq	%r9, %rsi
	adcq	%r10, %rdi
	movq	%rsi, %rbx
	xorl	%r14d, %r14d
	shrdq	$56, %rdi, %rsi
	andq	%rcx, %rbx
	sarq	$56, %rdi
	addq	%r13, %rsi
	movq	-104(%rbp), %r13
	movq	%rbx, -136(%rbp)
	adcq	%r14, %rdi
	movq	%rsi, %rax
	movq	-120(%rbp), %rsi
	addq	%r9, %rax
	movq	%rdi, %rdx
	adcq	%r10, %rdx
	movq	%rax, %r15
	xorl	%edi, %edi
	shrdq	$56, %rdx, %rax
	andq	%rcx, %r15
	sarq	$56, %rdx
	addq	%rsi, %rax
	movq	%r11, %rsi
	movabsq	$-72057594037927934, %r11
	adcq	%rdi, %rdx
	addq	%r9, %rax
	movq	%r15, -128(%rbp)
	adcq	%r10, %rdx
	movq	%rax, %rdi
	shrdq	$56, %rdx, %rax
	andq	%rcx, %rdi
	sarq	$56, %rdx
	movq	%rdi, -152(%rbp)
	movq	%rdi, -120(%rbp)
	xorl	%edi, %edi
	addq	%rax, %rsi
	adcq	%rdx, %rdi
	addq	%r11, %rsi
	movq	-96(%rbp), %r11
	adcq	%r12, %rdi
	movq	%rsi, %rax
	xorl	%r14d, %r14d
	shrdq	$56, %rdi, %rsi
	andq	%rcx, %rax
	sarq	$56, %rdi
	addq	%r13, %rsi
	movq	%rax, -160(%rbp)
	movq	%rax, -112(%rbp)
	adcq	%r14, %rdi
	addq	%r9, %rsi
	adcq	%r10, %rdi
	movq	%rsi, %rax
	xorl	%r12d, %r12d
	shrdq	$56, %rdi, %rsi
	andq	%rcx, %rax
	sarq	$56, %rdi
	addq	%r11, %rsi
	movq	%rax, -168(%rbp)
	movq	%rax, -104(%rbp)
	movq	%rsi, %rax
	adcq	%r12, %rdi
	addq	%r9, %rax
	movq	%rdi, %rdx
	movq	%rax, %rdi
	adcq	%r10, %rdx
	xorl	%r14d, %r14d
	andq	%rcx, %rdi
	movq	%rdi, -176(%rbp)
	movq	%rdi, -96(%rbp)
	movq	%rcx, %rdi
	andq	-88(%rbp), %rdi
	shrdq	$56, %rdx, %rax
	sarq	$56, %rdx
	addq	%rdi, %rax
	adcq	%r14, %rdx
	addq	%r9, %rax
	adcq	%r10, %rdx
	movq	%rax, %rdi
	shrdq	$56, %rdx, %rax
	andq	%rcx, %rdi
	movq	%rdi, -184(%rbp)
	movq	%rdi, -88(%rbp)
	movq	%rax, %r9
	movq	%rax, %rdx
#APP
# 275 "src/p448/arch_x86_64/x86-64-arith.h" 1
	neg %rax; sbb %rax, %rax;
# 0 "" 2
#NO_APP
	leaq	1(%r9), %rsi
#APP
# 275 "src/p448/arch_x86_64/x86-64-arith.h" 1
	neg %rsi; sbb %rsi, %rsi;
# 0 "" 2
#NO_APP
	andq	%rsi, %rax
	cmpq	$-1, %rax
	je	.L26
	movq	%r9, %rax
	movq	%r8, %rsi
	sarq	$63, %r8
	andq	%rcx, %rax
	movq	-160(%rbp), %r9
	movq	%rax, %rdi
	movq	%rax, %r11
	sarq	$63, %rdi
	addq	%rax, %rsi
	movq	%rdi, %r12
	movq	%r8, %rdi
	movq	%rsi, %r13
	adcq	%r12, %rdi
	andq	%rcx, %rsi
	xorl	%r10d, %r10d
	movq	%rsi, -144(%rbp)
	movq	%r13, %rsi
	movq	-152(%rbp), %r13
	shrdq	$56, %rdi, %rsi
	shrq	$56, %rdi
	addq	%rbx, %rsi
	adcq	%r10, %rdi
	addq	%rax, %rsi
	adcq	%r12, %rdi
	movq	%rsi, %r8
	xorl	%r10d, %r10d
	shrdq	$56, %rdi, %rsi
	andq	%rcx, %r8
	shrq	$56, %rdi
	addq	%r15, %rsi
	movq	%r8, -136(%rbp)
	adcq	%r10, %rdi
	addq	%rax, %rsi
	adcq	%r12, %rdi
	movq	%rsi, %r8
	xorl	%r14d, %r14d
	shrdq	$56, %rdi, %rsi
	andq	%rcx, %r8
	shrq	$56, %rdi
	addq	%r13, %rsi
	movq	%r8, -128(%rbp)
	movq	-168(%rbp), %r13
	adcq	%r14, %rdi
	addq	%rax, %rsi
	adcq	%r12, %rdi
	movq	%rsi, %r8
	xorl	%r10d, %r10d
	shrdq	$56, %rdi, %rsi
	andq	%rcx, %r8
	shrq	$56, %rdi
	addq	%r9, %rsi
	movq	-176(%rbp), %r9
	movq	%r8, -120(%rbp)
	adcq	%r10, %rdi
	andq	$-2, %rax
	xorl	%r10d, %r10d
	addq	%rax, %rsi
	adcq	%r10, %rdi
	movq	%rsi, %rax
	xorl	%r14d, %r14d
	shrdq	$56, %rdi, %rsi
	andq	%rcx, %rax
	shrq	$56, %rdi
	addq	%r13, %rsi
	movq	%rax, -112(%rbp)
	movq	-184(%rbp), %r13
	adcq	%r14, %rdi
	addq	%r11, %rsi
	adcq	%r12, %rdi
	movq	%rsi, %rax
	xorl	%r10d, %r10d
	shrdq	$56, %rdi, %rsi
	andq	%rcx, %rax
	shrq	$56, %rdi
	addq	%r9, %rsi
	movq	%rax, -104(%rbp)
	adcq	%r10, %rdi
	addq	%r11, %rsi
	adcq	%r12, %rdi
	movq	%rsi, %rax
	xorl	%r14d, %r14d
	shrdq	$56, %rdi, %rsi
	andq	%rcx, %rax
	shrq	$56, %rdi
	addq	%r13, %rsi
	movq	%rax, -96(%rbp)
	adcq	%r14, %rdi
	addq	%r11, %rsi
	adcq	%r12, %rdi
	andq	%rsi, %rcx
	shrdq	$56, %rdi, %rsi
	movq	%rcx, -88(%rbp)
	addq	%rdx, %rsi
#APP
# 275 "src/p448/arch_x86_64/x86-64-arith.h" 1
	neg %rsi; sbb %rsi, %rsi;
# 0 "" 2
#NO_APP
	cmpq	$-1, %rsi
	je	.L27
	vmovdqa	-144(%rbp), %ymm0
	vpxor	%xmm2, %xmm2, %xmm2
	vpor	-112(%rbp), %ymm0, %ymm0
	vperm2i128	$33, %ymm2, %ymm0, %ymm1
	vpor	%ymm0, %ymm1, %ymm0
	vperm2i128	$33, %ymm2, %ymm0, %ymm2
	vpalignr	$8, %ymm0, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovq	%xmm0, %rax
#APP
# 275 "src/p448/arch_x86_64/x86-64-arith.h" 1
	neg %rax; sbb %rax, %rax;
# 0 "" 2
#NO_APP
	movq	-56(%rbp), %rbx
	xorq	%fs:40, %rbx
	notq	%rax
	jne	.L28
	vzeroupper
	addq	$160, %rsp
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
	leaq	__PRETTY_FUNCTION__.26714(%rip), %rcx
	leaq	.LC3(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	movl	$336, %edx
	vzeroupper
	call	__assert_fail@PLT
.L28:
	vzeroupper
	call	__stack_chk_fail@PLT
.L27:
	leaq	__PRETTY_FUNCTION__.26714(%rip), %rcx
	leaq	.LC3(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	movl	$348, %edx
	vzeroupper
	call	__assert_fail@PLT
	.cfi_endproc
.LFE4627:
	.size	p448_is_zero, .-p448_is_zero
	.section	.text.unlikely.p448_is_zero
.LCOLDE7:
	.section	.text.p448_is_zero
.LHOTE7:
	.section	.rodata.str1.1
.LC8:
	.string	"red.limb[i] == 0"
	.section	.text.unlikely.p448_serialize,"ax",@progbits
.LCOLDB9:
	.section	.text.p448_serialize,"ax",@progbits
.LHOTB9:
	.p2align 4,,15
	.globl	p448_serialize
	.hidden	p448_serialize
	.type	p448_serialize, @function
p448_serialize:
.LFB4628:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
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
	subq	$96, %rsp
	vmovdqa	(%rsi), %ymm0
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	vmovdqa	%ymm0, -112(%rbp)
	vmovdqa	32(%rsi), %ymm0
	vmovdqa	%ymm0, -80(%rbp)
	vzeroupper
	call	p448_strong_reduce
	movq	-112(%rbp), %rax
	movq	%rax, %rdx
	movb	%al, (%rbx)
	shrq	$8, %rdx
	movb	%dl, 1(%rbx)
	movq	%rax, %rdx
	shrq	$16, %rdx
	movb	%dl, 2(%rbx)
	movq	%rax, %rdx
	shrq	$24, %rdx
	movb	%dl, 3(%rbx)
	movq	%rax, %rdx
	shrq	$32, %rdx
	movb	%dl, 4(%rbx)
	movq	%rax, %rdx
	shrq	$40, %rdx
	movb	%dl, 5(%rbx)
	movq	%rax, %rdx
	shrq	$56, %rax
	shrq	$48, %rdx
	testq	%rax, %rax
	movq	%rax, -112(%rbp)
	movb	%dl, 6(%rbx)
	jne	.L30
	movq	-104(%rbp), %rax
	movq	%rax, %rdx
	movb	%al, 7(%rbx)
	shrq	$8, %rdx
	movb	%dl, 8(%rbx)
	movq	%rax, %rdx
	shrq	$16, %rdx
	movb	%dl, 9(%rbx)
	movq	%rax, %rdx
	shrq	$24, %rdx
	movb	%dl, 10(%rbx)
	movq	%rax, %rdx
	shrq	$32, %rdx
	movb	%dl, 11(%rbx)
	movq	%rax, %rdx
	shrq	$40, %rdx
	movb	%dl, 12(%rbx)
	movq	%rax, %rdx
	shrq	$56, %rax
	shrq	$48, %rdx
	testq	%rax, %rax
	movq	%rax, -104(%rbp)
	movb	%dl, 13(%rbx)
	jne	.L30
	movq	-96(%rbp), %rax
	movq	%rax, %rdx
	movb	%al, 14(%rbx)
	shrq	$8, %rdx
	movb	%dl, 15(%rbx)
	movq	%rax, %rdx
	shrq	$16, %rdx
	movb	%dl, 16(%rbx)
	movq	%rax, %rdx
	shrq	$24, %rdx
	movb	%dl, 17(%rbx)
	movq	%rax, %rdx
	shrq	$32, %rdx
	movb	%dl, 18(%rbx)
	movq	%rax, %rdx
	shrq	$40, %rdx
	movb	%dl, 19(%rbx)
	movq	%rax, %rdx
	shrq	$56, %rax
	shrq	$48, %rdx
	testq	%rax, %rax
	movq	%rax, -96(%rbp)
	movb	%dl, 20(%rbx)
	jne	.L30
	movq	-88(%rbp), %rax
	movq	%rax, %rdx
	movb	%al, 21(%rbx)
	shrq	$8, %rdx
	movb	%dl, 22(%rbx)
	movq	%rax, %rdx
	shrq	$16, %rdx
	movb	%dl, 23(%rbx)
	movq	%rax, %rdx
	shrq	$24, %rdx
	movb	%dl, 24(%rbx)
	movq	%rax, %rdx
	shrq	$32, %rdx
	movb	%dl, 25(%rbx)
	movq	%rax, %rdx
	shrq	$40, %rdx
	movb	%dl, 26(%rbx)
	movq	%rax, %rdx
	shrq	$56, %rax
	shrq	$48, %rdx
	testq	%rax, %rax
	movq	%rax, -88(%rbp)
	movb	%dl, 27(%rbx)
	jne	.L30
	movq	-80(%rbp), %rax
	movq	%rax, %rdx
	movb	%al, 28(%rbx)
	shrq	$8, %rdx
	movb	%dl, 29(%rbx)
	movq	%rax, %rdx
	shrq	$16, %rdx
	movb	%dl, 30(%rbx)
	movq	%rax, %rdx
	shrq	$24, %rdx
	movb	%dl, 31(%rbx)
	movq	%rax, %rdx
	shrq	$32, %rdx
	movb	%dl, 32(%rbx)
	movq	%rax, %rdx
	shrq	$40, %rdx
	movb	%dl, 33(%rbx)
	movq	%rax, %rdx
	shrq	$56, %rax
	shrq	$48, %rdx
	testq	%rax, %rax
	movq	%rax, -80(%rbp)
	movb	%dl, 34(%rbx)
	jne	.L30
	movq	-72(%rbp), %rax
	movq	%rax, %rdx
	movb	%al, 35(%rbx)
	shrq	$8, %rdx
	movb	%dl, 36(%rbx)
	movq	%rax, %rdx
	shrq	$16, %rdx
	movb	%dl, 37(%rbx)
	movq	%rax, %rdx
	shrq	$24, %rdx
	movb	%dl, 38(%rbx)
	movq	%rax, %rdx
	shrq	$32, %rdx
	movb	%dl, 39(%rbx)
	movq	%rax, %rdx
	shrq	$40, %rdx
	movb	%dl, 40(%rbx)
	movq	%rax, %rdx
	shrq	$56, %rax
	shrq	$48, %rdx
	testq	%rax, %rax
	movq	%rax, -72(%rbp)
	movb	%dl, 41(%rbx)
	jne	.L30
	movq	-64(%rbp), %rax
	movq	%rax, %rdx
	movb	%al, 42(%rbx)
	shrq	$8, %rdx
	movb	%dl, 43(%rbx)
	movq	%rax, %rdx
	shrq	$16, %rdx
	movb	%dl, 44(%rbx)
	movq	%rax, %rdx
	shrq	$24, %rdx
	movb	%dl, 45(%rbx)
	movq	%rax, %rdx
	shrq	$32, %rdx
	movb	%dl, 46(%rbx)
	movq	%rax, %rdx
	shrq	$40, %rdx
	movb	%dl, 47(%rbx)
	movq	%rax, %rdx
	shrq	$56, %rax
	shrq	$48, %rdx
	testq	%rax, %rax
	movq	%rax, -64(%rbp)
	movb	%dl, 48(%rbx)
	jne	.L30
	movq	-56(%rbp), %rax
	movq	%rax, %rdx
	movb	%al, 49(%rbx)
	shrq	$8, %rdx
	movb	%dl, 50(%rbx)
	movq	%rax, %rdx
	shrq	$16, %rdx
	movb	%dl, 51(%rbx)
	movq	%rax, %rdx
	shrq	$24, %rdx
	movb	%dl, 52(%rbx)
	movq	%rax, %rdx
	shrq	$32, %rdx
	movb	%dl, 53(%rbx)
	movq	%rax, %rdx
	shrq	$40, %rdx
	movb	%dl, 54(%rbx)
	movq	%rax, %rdx
	shrq	$56, %rax
	shrq	$48, %rdx
	testq	%rax, %rax
	movq	%rax, -56(%rbp)
	movb	%dl, 55(%rbx)
	jne	.L30
	movq	-24(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L35
	addq	$96, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L30:
	.cfi_restore_state
	leaq	__PRETTY_FUNCTION__.26739(%rip), %rcx
	leaq	.LC3(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	movl	$381, %edx
	call	__assert_fail@PLT
.L35:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4628:
	.size	p448_serialize, .-p448_serialize
	.section	.text.unlikely.p448_serialize
.LCOLDE9:
	.section	.text.p448_serialize
.LHOTE9:
	.section	.text.unlikely.p448_deserialize,"ax",@progbits
.LCOLDB10:
	.section	.text.p448_deserialize,"ax",@progbits
.LHOTB10:
	.p2align 4,,15
	.globl	p448_deserialize
	.hidden	p448_deserialize
	.type	p448_deserialize, @function
p448_deserialize:
.LFB4629:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movzbl	2(%rsi), %eax
	movzbl	1(%rsi), %edx
	salq	$16, %rax
	movq	%rax, %rcx
	movq	%rdx, %rax
	movzbl	(%rsi), %edx
	salq	$8, %rax
	orq	%rcx, %rax
	orq	%rdx, %rax
	movzbl	3(%rsi), %edx
	salq	$24, %rdx
	orq	%rdx, %rax
	movzbl	4(%rsi), %edx
	salq	$32, %rdx
	orq	%rdx, %rax
	movzbl	5(%rsi), %edx
	salq	$40, %rdx
	orq	%rdx, %rax
	movzbl	6(%rsi), %edx
	salq	$48, %rdx
	orq	%rdx, %rax
	movq	%rax, (%rdi)
	movzbl	9(%rsi), %eax
	movzbl	8(%rsi), %edx
	salq	$16, %rax
	movq	%rax, %r11
	movq	%rdx, %rax
	movzbl	7(%rsi), %edx
	salq	$8, %rax
	orq	%r11, %rax
	movzbl	10(%rsi), %r11d
	orq	%rdx, %rax
	salq	$24, %r11
	orq	%r11, %rax
	movzbl	11(%rsi), %r11d
	salq	$32, %r11
	orq	%rax, %r11
	movzbl	12(%rsi), %eax
	salq	$40, %rax
	orq	%r11, %rax
	movzbl	13(%rsi), %r11d
	salq	$48, %r11
	orq	%rax, %r11
	movq	%r11, 8(%rdi)
	movzbl	15(%rsi), %eax
	movzbl	16(%rsi), %edx
	salq	$8, %rax
	movq	%rax, %r10
	movq	%rdx, %rax
	movzbl	14(%rsi), %edx
	salq	$16, %rax
	orq	%r10, %rax
	movzbl	17(%rsi), %r10d
	orq	%rdx, %rax
	salq	$24, %r10
	orq	%r10, %rax
	movzbl	18(%rsi), %r10d
	salq	$32, %r10
	orq	%rax, %r10
	movzbl	19(%rsi), %eax
	salq	$40, %rax
	orq	%r10, %rax
	movzbl	20(%rsi), %r10d
	salq	$48, %r10
	orq	%rax, %r10
	movq	%r10, 16(%rdi)
	movzbl	22(%rsi), %eax
	movzbl	23(%rsi), %edx
	salq	$8, %rax
	movq	%rax, %rcx
	movq	%rdx, %rax
	movzbl	21(%rsi), %edx
	salq	$16, %rax
	orq	%rcx, %rax
	movzbl	27(%rsi), %ecx
	orq	%rdx, %rax
	movzbl	24(%rsi), %edx
	salq	$48, %rcx
	salq	$24, %rdx
	orq	%rdx, %rax
	movzbl	25(%rsi), %edx
	salq	$32, %rdx
	orq	%rdx, %rax
	movzbl	26(%rsi), %edx
	salq	$40, %rdx
	orq	%rdx, %rax
	orq	%rcx, %rax
	movq	%rax, 24(%rdi)
	movzbl	29(%rsi), %ecx
	movzbl	30(%rsi), %edx
	salq	$8, %rcx
	salq	$16, %rdx
	orq	%rdx, %rcx
	movzbl	28(%rsi), %edx
	orq	%rdx, %rcx
	movzbl	31(%rsi), %edx
	salq	$24, %rdx
	orq	%rdx, %rcx
	movzbl	32(%rsi), %edx
	salq	$32, %rdx
	orq	%rdx, %rcx
	movzbl	33(%rsi), %edx
	salq	$40, %rdx
	orq	%rdx, %rcx
	movzbl	34(%rsi), %edx
	salq	$48, %rdx
	orq	%rdx, %rcx
	movq	%rcx, 32(%rdi)
	movzbl	36(%rsi), %edx
	movzbl	37(%rsi), %r8d
	salq	$8, %rdx
	movq	%rdx, %r9
	movq	%r8, %rdx
	movzbl	35(%rsi), %r8d
	salq	$16, %rdx
	orq	%r9, %rdx
	movzbl	38(%rsi), %r9d
	orq	%r8, %rdx
	salq	$24, %r9
	orq	%r9, %rdx
	movzbl	39(%rsi), %r9d
	salq	$32, %r9
	orq	%rdx, %r9
	movzbl	40(%rsi), %edx
	salq	$40, %rdx
	orq	%r9, %rdx
	movzbl	41(%rsi), %r9d
	salq	$48, %r9
	orq	%rdx, %r9
	movq	%r9, 40(%rdi)
	movzbl	43(%rsi), %edx
	movzbl	44(%rsi), %r8d
	movq	%rdx, %rbx
	movq	%r8, %rdx
	movzbl	42(%rsi), %r8d
	salq	$8, %rbx
	salq	$16, %rdx
	orq	%rbx, %rdx
	orq	%r8, %rdx
	movzbl	45(%rsi), %r8d
	salq	$24, %r8
	orq	%r8, %rdx
	movzbl	46(%rsi), %r8d
	salq	$32, %r8
	orq	%r8, %rdx
	movzbl	47(%rsi), %r8d
	salq	$40, %r8
	orq	%r8, %rdx
	movzbl	48(%rsi), %r8d
	salq	$48, %r8
	orq	%r8, %rdx
	movq	%rdx, 48(%rdi)
	movzbl	50(%rsi), %edx
	movzbl	51(%rsi), %r8d
	movq	%rdx, %rbx
	movq	%r8, %rdx
	movzbl	49(%rsi), %r8d
	salq	$8, %rbx
	salq	$16, %rdx
	orq	%rbx, %rdx
	orq	%r8, %rdx
	movzbl	52(%rsi), %r8d
	salq	$24, %r8
	orq	%r8, %rdx
	movzbl	53(%rsi), %r8d
	salq	$32, %r8
	orq	%r8, %rdx
	movzbl	54(%rsi), %r8d
	movzbl	55(%rsi), %esi
	salq	$40, %r8
	salq	$48, %rsi
	orq	%r8, %rdx
	orq	%rsi, %rdx
	leaq	1(%rcx), %rsi
	movq	%rdx, 56(%rdi)
	andq	(%rdi), %r11
	andq	%rsi, %r11
	movabsq	$72057594037927935, %rsi
	andq	%r11, %r10
	xorq	%rsi, %rcx
	andq	%r10, %rax
#APP
# 275 "src/p448/arch_x86_64/x86-64-arith.h" 1
	neg %rcx; sbb %rcx, %rcx;
# 0 "" 2
#NO_APP
	notq	%rcx
	orq	%rax, %rcx
	movq	%r9, %rax
	andq	48(%rdi), %rax
	andq	%rdx, %rax
	andq	%rcx, %rax
	xorq	%rsi, %rax
#APP
# 275 "src/p448/arch_x86_64/x86-64-arith.h" 1
	neg %rax; sbb %rax, %rax;
# 0 "" 2
#NO_APP
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4629:
	.size	p448_deserialize, .-p448_deserialize
	.section	.text.unlikely.p448_deserialize
.LCOLDE10:
	.section	.text.p448_deserialize
.LHOTE10:
	.section	.rodata.__PRETTY_FUNCTION__.26739,"a",@progbits
	.align 8
	.type	__PRETTY_FUNCTION__.26739, @object
	.size	__PRETTY_FUNCTION__.26739, 15
__PRETTY_FUNCTION__.26739:
	.string	"p448_serialize"
	.section	.rodata.__PRETTY_FUNCTION__.26714,"a",@progbits
	.align 16
	.type	__PRETTY_FUNCTION__.26714, @object
	.size	__PRETTY_FUNCTION__.26714, 19
__PRETTY_FUNCTION__.26714:
	.string	"p448_strong_reduce"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
