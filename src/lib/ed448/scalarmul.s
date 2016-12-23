	.file	"scalarmul.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"src/scalarmul.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"position <= nbits/(tableBits+1) + 2"
	.section	.text.unlikely.recode_wnaf,"ax",@progbits
.LCOLDB2:
	.section	.text.recode_wnaf,"ax",@progbits
.LHOTB2:
	.p2align 4,,15
	.type	recode_wnaf, @function
recode_wnaf:
.LFB4679:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%ecx, %r15d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%edx, %ecx
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	subl	$1, %ecx
	js	.L12
	movl	$2, %ebp
	movq	%rsi, %r12
	leal	1(%r15), %esi
	shlx	%r15d, %ebp, %ebp
	movl	%edx, %ebx
	movq	%rdi, %r13
	movl	%ebp, %r14d
	xorl	%r11d, %r11d
	xorl	%r10d, %r10d
	notl	%r14d
	.p2align 4,,10
	.p2align 3
.L7:
	movl	%ecx, %eax
	sarl	$6, %eax
	cltq
	movq	(%r12,%rax,8), %rax
	shrq	%cl, %rax
	andl	$1, %eax
	leal	(%rax,%r10,2), %r10d
	cmpl	%ebp, %r10d
	jge	.L3
	cmpl	%r14d, %r10d
	jg	.L4
.L3:
	leal	1(%r10), %r8d
	andl	$1, %r10d
	movl	%ecx, %r9d
	negl	%r10d
	sarl	%r8d
	testb	$1, %r8b
	jne	.L5
	.p2align 4,,10
	.p2align 3
.L6:
	sarl	%r8d
	addl	$1, %r9d
	testb	$1, %r8b
	je	.L6
.L5:
	movl	%r11d, %eax
	addl	$1, %r9d
	xorl	%edx, %edx
	leaq	0(%r13,%rax,8), %rax
	addl	$1, %r11d
	movl	%r9d, (%rax)
	movl	%r8d, 4(%rax)
	movl	%ebx, %eax
	divl	%esi
	addl	$2, %eax
	cmpl	%eax, %r11d
	ja	.L23
.L4:
	subl	$1, %ecx
	cmpl	$-1, %ecx
	jne	.L7
	testl	%r10d, %r10d
	je	.L21
	xorl	%eax, %eax
	testb	$1, %r10b
	jne	.L9
	.p2align 4,,10
	.p2align 3
.L10:
	sarl	%r10d
	addl	$1, %eax
	testb	$1, %r10b
	je	.L10
.L9:
	movl	%r11d, %edx
	addl	$1, %r15d
	addl	$1, %r11d
	leaq	0(%r13,%rdx,8), %rdx
	movl	%eax, (%rdx)
	movl	%r10d, 4(%rdx)
	movl	%ebx, %eax
	xorl	%edx, %edx
	divl	%r15d
	addl	$2, %eax
	cmpl	%eax, %r11d
	ja	.L11
.L21:
	movl	%r11d, %eax
	salq	$3, %rax
.L2:
	addq	%rax, %rdi
	movl	%r11d, %eax
	movl	$-1, (%rdi)
	movl	$0, 4(%rdi)
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
.L12:
	.cfi_restore_state
	xorl	%r11d, %r11d
	xorl	%eax, %eax
	jmp	.L2
.L23:
	leaq	__PRETTY_FUNCTION__.28150(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	movl	$688, %edx
	call	__assert_fail@PLT
.L11:
	leaq	__PRETTY_FUNCTION__.28150(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	movl	$699, %edx
	call	__assert_fail@PLT
	.cfi_endproc
.LFE4679:
	.size	recode_wnaf, .-recode_wnaf
	.section	.text.unlikely.recode_wnaf
.LCOLDE2:
	.section	.text.recode_wnaf
.LHOTE2:
	.section	.rodata.str1.1
.LC3:
	.string	"!(out[0]&1)"
	.section	.text.unlikely.convert_to_signed_window_form.constprop.3,"ax",@progbits
.LCOLDB4:
	.section	.text.convert_to_signed_window_form.constprop.3,"ax",@progbits
.LHOTB4:
	.p2align 4,,15
	.type	convert_to_signed_window_form.constprop.3, @function
convert_to_signed_window_form.constprop.3:
.LFB4686:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	$7, %r8d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	$7, %edx
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	(%rsi), %r12
	movq	SCALARMUL_FIXED_WINDOW_ADJUSTMENT@GOTPCREL(%rip), %r13
	andl	$1, %r12d
	movq	%r13, %rcx
	negq	%r12
	movq	%r12, %r9
	notq	%r9
	call	add_nr_ext_packed@PLT
	leaq	56(%r13), %rcx
	movl	$7, %edx
	movq	%r12, %r9
	movl	$7, %r8d
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	add_nr_ext_packed@PLT
	movq	(%rbx), %rdx
	testb	$1, %dl
	jne	.L27
	movq	%rdx, %rcx
	movq	8(%rbx), %rdx
	addq	%rbp, %rax
	shrq	%rcx
	salq	$63, %rax
	movq	%rdx, %rsi
	shrq	%rdx
	salq	$63, %rsi
	orq	%rsi, %rcx
	movq	%rcx, (%rbx)
	movq	16(%rbx), %rcx
	movq	%rcx, %rsi
	salq	$63, %rsi
	orq	%rsi, %rdx
	movq	%rdx, 8(%rbx)
	movq	%rcx, %rdx
	movq	24(%rbx), %rcx
	shrq	%rdx
	movq	%rcx, %rsi
	shrq	%rcx
	salq	$63, %rsi
	orq	%rdx, %rsi
	movq	%rsi, 16(%rbx)
	movq	%rcx, %rsi
	movq	32(%rbx), %rcx
	movq	%rcx, %rdx
	shrq	%rcx
	salq	$63, %rdx
	orq	%rdx, %rsi
	movq	%rsi, 24(%rbx)
	movq	%rcx, %rsi
	movq	40(%rbx), %rcx
	movq	%rcx, %rdx
	shrq	%rcx
	salq	$63, %rdx
	orq	%rdx, %rsi
	movq	48(%rbx), %rdx
	movq	%rsi, 32(%rbx)
	movq	%rdx, %rsi
	shrq	%rdx
	salq	$63, %rsi
	orq	%rax, %rdx
	orq	%rsi, %rcx
	movq	%rdx, 48(%rbx)
	movq	%rcx, 40(%rbx)
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
.L27:
	.cfi_restore_state
	leaq	__PRETTY_FUNCTION__.27911(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	movl	$87, %edx
	call	__assert_fail@PLT
	.cfi_endproc
.LFE4686:
	.size	convert_to_signed_window_form.constprop.3, .-convert_to_signed_window_form.constprop.3
	.section	.text.unlikely.convert_to_signed_window_form.constprop.3
.LCOLDE4:
	.section	.text.convert_to_signed_window_form.constprop.3
.LHOTE4:
	.section	.text.unlikely.schedule_scalar_for_combs,"ax",@progbits
.LCOLDB5:
	.section	.text.schedule_scalar_for_combs,"ax",@progbits
.LHOTB5:
	.p2align 4,,15
	.type	schedule_scalar_for_combs, @function
schedule_scalar_for_combs:
.LFB4673:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	movq	%rcx, %r13
	pushq	%rbx
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$40, %rsp
	movl	120(%rcx), %edi
	movl	124(%rcx), %ecx
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movl	128(%r13), %r8d
	movl	%edi, %eax
	imull	%ecx, %eax
	imull	%r8d, %eax
	cmpl	%edx, %eax
	jb	.L44
	testl	%edi, %edi
	sete	%dil
	testl	%ecx, %ecx
	sete	%al
	orb	%al, %dil
	jne	.L44
	testl	%r8d, %r8d
	je	.L44
	leal	63(%rdx), %eax
	shrl	$6, %eax
	cmpl	$6, %eax
	ja	.L56
	subq	$64, %rsp
	testl	%eax, %eax
	movl	$7, %r12d
	movq	%rsp, %r10
	movl	$7, %r14d
	je	.L37
.L31:
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L33:
	movq	(%rsi,%rdi,8), %rcx
	movq	%rcx, (%r10,%rdi,8)
	addq	$1, %rdi
	cmpl	%edi, %eax
	ja	.L33
	andl	$63, %edx
	leal	-1(%rax), %esi
	je	.L34
	movl	%esi, %edi
	movl	$1, %esi
	shlx	%rdx, %rsi, %rdx
	subq	$1, %rdx
	andq	%rdx, %rcx
	movq	%rcx, (%r10,%rdi,8)
.L34:
	cmpl	%r14d, %eax
	jnb	.L38
	.p2align 4,,10
	.p2align 3
.L37:
	movl	%eax, %edx
	addl	$1, %eax
	cmpl	%r14d, %eax
	movq	$0, (%r10,%rdx,8)
	jne	.L37
.L38:
	movq	(%r10), %r11
	leaq	8(%r13), %rcx
	movq	%r10, %rsi
	movl	$7, %r8d
	movl	%r14d, %edx
	movq	%rbx, %rdi
	andl	$1, %r11d
	negq	%r11
	movq	%r11, %r9
	movq	%r11, %r15
	notq	%r9
	call	add_nr_ext_packed@PLT
	leaq	64(%r13), %rcx
	movq	%r15, %r9
	movl	$7, %r8d
	movl	%r14d, %edx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	movq	%rax, -72(%rbp)
	call	add_nr_ext_packed@PLT
	movq	-72(%rbp), %r15
	addq	%rax, %r15
	testb	$1, (%rbx)
	jne	.L57
	leal	-1(%r12), %r8d
	salq	$63, %r15
	movq	%rbx, %rdi
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L41:
	cmpl	%ecx, %r8d
	movl	$1, %eax
	shrx	%rax, (%rdi), %rdx
	jle	.L39
	movl	$63, %eax
	shlx	%rax, 8(%rdi), %rsi
	orq	%rsi, %rdx
.L40:
	addl	$1, %ecx
	movq	%rdx, (%rdi)
	addq	$8, %rdi
	cmpl	%r12d, %ecx
	jne	.L41
	movq	$-1, %rax
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L44:
	xorl	%eax, %eax
.L29:
	movq	-56(%rbp), %rbx
	xorq	%fs:40, %rbx
	jne	.L58
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L56:
	.cfi_restore_state
	leaq	22(,%rax,8), %rcx
	movl	%eax, %r12d
	movl	%eax, %r14d
	andl	$1073741808, %ecx
	subq	%rcx, %rsp
	movq	%rsp, %r10
	jmp	.L31
.L39:
	orq	%r15, %rdx
	jmp	.L40
.L58:
	call	__stack_chk_fail@PLT
.L57:
	leaq	__PRETTY_FUNCTION__.27911(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	movl	$87, %edx
	call	__assert_fail@PLT
	.cfi_endproc
.LFE4673:
	.size	schedule_scalar_for_combs, .-schedule_scalar_for_combs
	.section	.text.unlikely.schedule_scalar_for_combs
.LCOLDE5:
	.section	.text.schedule_scalar_for_combs
.LHOTE5:
	.section	.rodata.str1.1
.LC6:
	.string	"n_extra_doubles < INT_MAX"
	.section	.text.unlikely.montgomery_ladder,"ax",@progbits
.LCOLDB7:
	.section	.text.montgomery_ladder,"ax",@progbits
.LHOTB7:
	.p2align 4,,15
	.globl	montgomery_ladder
	.hidden	montgomery_ladder
	.type	montgomery_ladder, @function
montgomery_ladder:
.LFB4667:
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
	movl	%ecx, %r12d
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	leaq	-400(%rbp), %rbx
	movq	%rdx, %r15
	subq	$384, %rsp
	movq	%rdi, -424(%rbp)
	movq	%rbx, %rdi
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsi, -432(%rbp)
	movl	%r8d, -408(%rbp)
	call	deserialize_montgomery@PLT
	leal	63(%r12), %eax
	leal	-1(%r12), %esi
	shrl	$6, %eax
	andl	$63, %esi
	subl	$1, %eax
	cmpl	$-1, %eax
	je	.L67
	movslq	%eax, %rdx
	movl	%eax, %eax
	movl	%esi, %r14d
	leaq	(%r15,%rdx,8), %r13
	subq	%rax, %rdx
	leaq	-8(%r15,%rdx,8), %rax
	xorl	%r15d, %r15d
	movq	%rax, -416(%rbp)
	.p2align 4,,10
	.p2align 3
.L62:
	movq	0(%r13), %r12
	movq	%r15, %rdx
	.p2align 4,,10
	.p2align 3
.L61:
	shrx	%r14, %r12, %rax
	vmovdqa	-208(%rbp), %ymm3
	movq	%rbx, %rdi
	andl	$1, %eax
	vmovdqa	-336(%rbp), %ymm1
	negq	%rax
	xorl	%eax, %edx
	vpxor	%ymm1, %ymm3, %ymm2
	movl	%edx, -404(%rbp)
	movq	%rax, %r15
	vpbroadcastd	-404(%rbp), %ymm0
	vpand	%ymm2, %ymm0, %ymm2
	vpxor	%ymm2, %ymm3, %ymm3
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqa	%ymm3, -208(%rbp)
	vmovdqa	%ymm1, -336(%rbp)
	vmovdqa	-176(%rbp), %ymm3
	vmovdqa	-304(%rbp), %ymm1
	vpxor	%ymm1, %ymm3, %ymm2
	vpand	%ymm2, %ymm0, %ymm2
	vpxor	%ymm2, %ymm3, %ymm3
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqa	%ymm3, -176(%rbp)
	vmovdqa	%ymm1, -304(%rbp)
	vmovdqa	-144(%rbp), %ymm3
	vmovdqa	-272(%rbp), %ymm1
	vpxor	%ymm1, %ymm3, %ymm2
	vpand	%ymm2, %ymm0, %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpxor	%ymm2, %ymm3, %ymm3
	vmovdqa	-112(%rbp), %ymm2
	vmovdqa	%ymm1, -272(%rbp)
	vmovdqa	-240(%rbp), %ymm1
	vmovdqa	%ymm3, -144(%rbp)
	vpxor	%ymm1, %ymm2, %ymm3
	vpand	%ymm3, %ymm0, %ymm0
	vpxor	%ymm0, %ymm2, %ymm2
	vpxor	%ymm0, %ymm1, %ymm0
	vmovdqa	%ymm2, -112(%rbp)
	vmovdqa	%ymm0, -240(%rbp)
	vzeroupper
	subl	$1, %r14d
	call	montgomery_step@PLT
	cmpl	$-1, %r14d
	movq	%r15, %rdx
	jne	.L61
	subq	$8, %r13
	cmpq	%r13, -416(%rbp)
	movl	$63, %r14d
	jne	.L62
	movl	%r15d, -404(%rbp)
.L60:
	vmovdqa	-208(%rbp), %ymm3
	movl	-408(%rbp), %eax
	vmovdqa	-336(%rbp), %ymm1
	vpbroadcastd	-404(%rbp), %ymm0
	vpxor	%ymm1, %ymm3, %ymm2
	cmpl	$2147483646, %eax
	vpand	%ymm2, %ymm0, %ymm2
	vpxor	%ymm2, %ymm3, %ymm3
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqa	%ymm3, -208(%rbp)
	vmovdqa	%ymm1, -336(%rbp)
	vmovdqa	-176(%rbp), %ymm3
	vmovdqa	-304(%rbp), %ymm1
	vpxor	%ymm1, %ymm3, %ymm2
	vpand	%ymm2, %ymm0, %ymm2
	vpxor	%ymm2, %ymm3, %ymm3
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqa	%ymm3, -176(%rbp)
	vmovdqa	%ymm1, -304(%rbp)
	vmovdqa	-144(%rbp), %ymm3
	vmovdqa	-272(%rbp), %ymm1
	vpxor	%ymm1, %ymm3, %ymm2
	vpand	%ymm2, %ymm0, %ymm2
	vpxor	%ymm2, %ymm1, %ymm1
	vpxor	%ymm2, %ymm3, %ymm3
	vmovdqa	-112(%rbp), %ymm2
	vmovdqa	%ymm1, -272(%rbp)
	vmovdqa	-240(%rbp), %ymm1
	vmovdqa	%ymm3, -144(%rbp)
	vpxor	%ymm1, %ymm2, %ymm3
	vpand	%ymm3, %ymm0, %ymm0
	vpxor	%ymm0, %ymm2, %ymm2
	vpxor	%ymm0, %ymm1, %ymm0
	vmovdqa	%ymm2, -112(%rbp)
	vmovdqa	%ymm0, -240(%rbp)
	ja	.L63
	xorl	%r12d, %r12d
	testl	%eax, %eax
	je	.L78
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L69:
	movq	%rbx, %rdi
	addl	$1, %r12d
	call	montgomery_step@PLT
	cmpl	%r12d, -408(%rbp)
	jne	.L69
.L65:
	movq	-432(%rbp), %rdx
	movq	-424(%rbp), %rdi
	movq	%rbx, %rsi
	call	serialize_montgomery@PLT
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L79
	addq	$384, %rsp
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
.L67:
	.cfi_restore_state
	movl	$0, -404(%rbp)
	jmp	.L60
.L78:
	vzeroupper
	jmp	.L65
.L63:
	leaq	__PRETTY_FUNCTION__.27888(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	movl	$43, %edx
	vzeroupper
	call	__assert_fail@PLT
.L79:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4667:
	.size	montgomery_ladder, .-montgomery_ladder
	.section	.text.unlikely.montgomery_ladder
.LCOLDE7:
	.section	.text.montgomery_ladder
.LHOTE7:
	.section	.text.unlikely.scalarmul,"ax",@progbits
.LCOLDB12:
	.section	.text.scalarmul,"ax",@progbits
.LHOTB12:
	.p2align 4,,15
	.globl	scalarmul
	.hidden	scalarmul
	.type	scalarmul, @function
scalarmul:
.LFB4671:
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
	movq	%rdi, %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	leaq	-784(%rbp), %rdi
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	leaq	-400(%rbp), %rbx
	subq	$864, %rsp
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	convert_to_signed_window_form.constprop.3
	movq	(%r12), %rax
	movq	64(%r12), %rcx
	movq	%rbx, %rdi
	movq	120(%r12), %rdx
	movq	%rax, -400(%rbp)
	movq	8(%r12), %rax
	movq	%rcx, -336(%rbp)
	movq	72(%r12), %rcx
	movq	%rdx, 120(%rbx)
	movq	%rax, -392(%rbp)
	movq	16(%r12), %rax
	movq	%rax, -384(%rbp)
	movq	24(%r12), %rax
	movq	%rax, -376(%rbp)
	movq	32(%r12), %rax
	movq	%rax, -368(%rbp)
	movq	40(%r12), %rax
	movq	%rax, -360(%rbp)
	movq	48(%r12), %rax
	movq	%rax, -352(%rbp)
	movq	56(%r12), %rax
	movq	%rax, -344(%rbp)
	movq	%rcx, 72(%rbx)
	movq	80(%r12), %rcx
	movq	%rcx, 80(%rbx)
	movq	88(%r12), %rcx
	movq	%rcx, 88(%rbx)
	movq	96(%r12), %rcx
	movq	%rcx, 96(%rbx)
	movq	104(%r12), %rcx
	movq	%rcx, 104(%rbx)
	movq	112(%r12), %rcx
	movq	%rcx, 112(%rbx)
	movq	128(%r12), %rcx
	movq	184(%r12), %rdx
	movq	%rcx, -272(%rbp)
	movq	136(%r12), %rcx
	movq	%rdx, 184(%rbx)
	movq	248(%r12), %rdx
	movq	%rcx, 136(%rbx)
	movq	144(%r12), %rcx
	movq	%rcx, 144(%rbx)
	movq	152(%r12), %rcx
	movq	%rcx, 152(%rbx)
	movq	160(%r12), %rcx
	movq	%rcx, 160(%rbx)
	movq	168(%r12), %rcx
	movq	%rcx, 168(%rbx)
	movq	176(%r12), %rcx
	movq	%rcx, 176(%rbx)
	movq	192(%r12), %rcx
	movq	%rcx, -208(%rbp)
	movq	200(%r12), %rcx
	movq	%rdx, 248(%rbx)
	movq	%rcx, 200(%rbx)
	movq	208(%r12), %rcx
	movq	%rcx, 208(%rbx)
	movq	216(%r12), %rcx
	movq	%rcx, 216(%rbx)
	movq	224(%r12), %rcx
	movq	%rcx, 224(%rbx)
	movq	232(%r12), %rcx
	movq	%rcx, 232(%rbx)
	movq	240(%r12), %rcx
	movq	%rcx, 240(%rbx)
	movq	256(%r12), %rcx
	movq	312(%r12), %rdx
	movq	%rcx, -144(%rbp)
	movq	264(%r12), %rcx
	movq	%rdx, 312(%rbx)
	movq	%rcx, 264(%rbx)
	movq	272(%r12), %rcx
	movq	%rcx, 272(%rbx)
	movq	280(%r12), %rcx
	movq	%rcx, 280(%rbx)
	movq	288(%r12), %rcx
	movq	%rcx, 288(%rbx)
	movq	296(%r12), %rcx
	movq	%rcx, 296(%rbx)
	movq	304(%r12), %rcx
	movq	%rcx, 304(%rbx)
	call	double_tw_extensible@PLT
	subq	$4128, %rsp
	movq	%rbx, %rsi
	leaq	31(%rsp), %rax
	andq	$-32, %rax
	movq	%rax, %r14
	movq	%rax, -864(%rbp)
	leaq	-656(%rbp), %rax
	leaq	256(%r14), %rbx
	leaq	4096(%r14), %r15
	movq	%rax, %rdi
	movq	%rax, -856(%rbp)
	call	convert_tw_extensible_to_tw_pniels@PLT
	movq	%r12, %rsi
	movq	%r14, %rdi
	call	convert_tw_extensible_to_tw_pniels@PLT
	.p2align 4,,10
	.p2align 3
.L81:
	movq	-856(%rbp), %rsi
	movq	%r12, %rdi
	call	add_tw_pniels_to_tw_extensible@PLT
	movq	%rbx, %rdi
	movq	%r12, %rsi
	addq	$256, %rbx
	call	convert_tw_extensible_to_tw_pniels@PLT
	cmpq	%r15, %rbx
	jne	.L81
	movl	$61, %eax
	shrx	%rax, -736(%rbp), %rax
	movq	-856(%rbp), %rdi
	vpxor	%xmm8, %xmm8, %xmm8
	movl	$32, %ecx
	vmovdqa	.LC8(%rip), %ymm11
	notl	%eax
	vmovdqa	%ymm8, %ymm9
	vmovdqa	%ymm8, %ymm2
	andl	$15, %eax
	vmovdqa	%ymm8, %ymm3
	vmovdqa	%ymm8, %ymm5
	movl	%eax, -816(%rbp)
	xorl	%eax, %eax
	vmovdqa	%ymm8, %ymm7
	rep stosq
	movq	-864(%rbp), %rax
	vpbroadcastd	-816(%rbp), %ymm0
	vmovdqa	%ymm8, %ymm4
	vmovdqa	%ymm8, %ymm6
	vmovdqa	%ymm8, %ymm10
	.p2align 4,,10
	.p2align 3
.L82:
	vpcmpeqd	%ymm10, %ymm0, %ymm1
	addq	$256, %rax
	vpsubd	%ymm11, %ymm0, %ymm0
	vpand	-256(%rax), %ymm1, %ymm12
	vpor	%ymm12, %ymm6, %ymm6
	vpand	-224(%rax), %ymm1, %ymm12
	vpor	%ymm12, %ymm4, %ymm4
	vpand	-192(%rax), %ymm1, %ymm12
	vpor	%ymm12, %ymm7, %ymm7
	vpand	-160(%rax), %ymm1, %ymm12
	vpor	%ymm12, %ymm5, %ymm5
	vpand	-128(%rax), %ymm1, %ymm12
	vpor	%ymm12, %ymm3, %ymm3
	vpand	-96(%rax), %ymm1, %ymm12
	vpor	%ymm12, %ymm2, %ymm2
	vpand	-64(%rax), %ymm1, %ymm12
	vpand	-32(%rax), %ymm1, %ymm1
	cmpq	%rax, %r15
	vpor	%ymm12, %ymm9, %ymm9
	vpor	%ymm1, %ymm8, %ymm8
	jne	.L82
	vmovdqa	%ymm6, -592(%rbp)
	movabsq	$72057594037927935, %r13
	vmovdqa	.LC9(%rip), %ymm6
	movq	%r13, %rdi
	vmovdqa	%ymm7, -656(%rbp)
	vmovdqa	.LC10(%rip), %ymm7
	vpsubq	%ymm3, %ymm6, %ymm3
	vmovdqa	%ymm3, -720(%rbp)
	movq	-704(%rbp), %rcx
	andq	-696(%rbp), %rdi
	vpsubq	%ymm2, %ymm7, %ymm2
	vmovdqa	%ymm2, -688(%rbp)
	movzbl	-657(%rbp), %esi
	vmovdqa	%ymm11, -816(%rbp)
	addq	%rsi, -688(%rbp)
	movq	%rcx, %rax
	andq	%r13, %rcx
	shrq	$56, %rax
	vmovdqa	%ymm9, -464(%rbp)
	addq	%rdi, %rax
	vmovdqa	%ymm8, -432(%rbp)
	vmovdqa	%ymm5, -624(%rbp)
	vmovdqa	%ymm4, -560(%rbp)
	vmovdqu	-696(%rbp), %xmm0
	movq	%rax, -696(%rbp)
	movq	-712(%rbp), %rax
	vpermq	$27, -688(%rbp), %ymm1
	movq	%rax, %rdi
	vinserti128	$0x1, -680(%rbp), %ymm0, %ymm0
	shrq	$56, %rdi
	andq	%r13, %rax
	addq	%rdi, %rcx
	movq	%rcx, -704(%rbp)
	movq	-720(%rbp), %rcx
	vpand	.LC11(%rip), %ymm1, %ymm1
	movq	%rcx, %rdi
	vpermq	$27, %ymm0, %ymm0
	shrq	$56, %rdi
	andq	%r13, %rcx
	addq	%rdi, %rax
	addq	%rcx, %rsi
	movq	%r12, %rdi
	movq	%rsi, -720(%rbp)
	movq	%rax, -712(%rbp)
	vpsrlq	$56, %ymm0, %ymm0
	movq	-856(%rbp), %rsi
	vpaddq	%ymm1, %ymm0, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	-720(%rbp), %ymm1
	vmovdqa	%ymm0, -688(%rbp)
	vmovdqa	%ymm1, -528(%rbp)
	vmovdqa	%ymm0, -496(%rbp)
	vzeroupper
	movl	$440, %r14d
	call	convert_tw_pniels_to_tw_extensible@PLT
	vpxor	%xmm12, %xmm12, %xmm12
	vmovdqa	-816(%rbp), %ymm11
	.p2align 4,,10
	.p2align 3
.L83:
	movl	$5, %ebx
	.p2align 4,,10
	.p2align 3
.L84:
	movq	%r12, %rdi
	vmovdqa	%ymm12, -848(%rbp)
	vmovdqa	%ymm11, -816(%rbp)
	vzeroupper
	call	double_tw_extensible@PLT
	subl	$1, %ebx
	vmovdqa	-816(%rbp), %ymm11
	vmovdqa	-848(%rbp), %ymm12
	jne	.L84
	movl	%r14d, %ecx
	movl	%r14d, %esi
	sarl	$6, %ecx
	andl	$63, %esi
	movslq	%ecx, %rax
	cmpl	$58, %esi
	movq	-784(%rbp,%rax,8), %rax
	shrx	%rsi, %rax, %rax
	jle	.L87
	cmpl	$383, %r14d
	jg	.L87
	addl	$1, %ecx
	movl	$64, %edx
	movslq	%ecx, %rcx
	subl	%esi, %edx
	movq	-784(%rbp,%rcx,8), %rcx
	movl	%edx, %esi
	shlx	%rsi, %rcx, %rcx
	xorl	%ecx, %eax
.L87:
	andl	$31, %eax
	movq	-856(%rbp), %rdi
	movl	$32, %ecx
	movl	%eax, %esi
	vpxor	%xmm8, %xmm8, %xmm8
	sarl	$4, %esi
	subl	$1, %esi
	xorl	%esi, %eax
	vmovdqa	%ymm8, %ymm9
	vmovdqa	%ymm8, %ymm4
	andl	$15, %eax
	vmovdqa	%ymm8, %ymm5
	vmovdqa	%ymm8, %ymm6
	movl	%eax, -816(%rbp)
	xorl	%eax, %eax
	vmovdqa	%ymm8, %ymm7
	rep stosq
	movq	-864(%rbp), %rax
	vpbroadcastd	-816(%rbp), %ymm1
	vmovdqa	%ymm8, %ymm2
	vmovdqa	%ymm8, %ymm3
	.p2align 4,,10
	.p2align 3
.L88:
	vpcmpeqd	%ymm12, %ymm1, %ymm0
	addq	$256, %rax
	vpsubd	%ymm11, %ymm1, %ymm1
	vpand	-256(%rax), %ymm0, %ymm10
	vpor	%ymm10, %ymm3, %ymm3
	vpand	-224(%rax), %ymm0, %ymm10
	vpor	%ymm10, %ymm2, %ymm2
	vpand	-192(%rax), %ymm0, %ymm10
	vpor	%ymm10, %ymm7, %ymm7
	vpand	-160(%rax), %ymm0, %ymm10
	vpor	%ymm10, %ymm6, %ymm6
	vpand	-128(%rax), %ymm0, %ymm10
	vpor	%ymm10, %ymm5, %ymm5
	vpand	-96(%rax), %ymm0, %ymm10
	vpor	%ymm10, %ymm4, %ymm4
	vpand	-64(%rax), %ymm0, %ymm10
	vpand	-32(%rax), %ymm0, %ymm0
	cmpq	%r15, %rax
	vpor	%ymm10, %ymm9, %ymm9
	vpor	%ymm0, %ymm8, %ymm8
	jne	.L88
	movl	%esi, -816(%rbp)
	vpxor	%ymm7, %ymm3, %ymm1
	vpbroadcastd	-816(%rbp), %ymm0
	vmovdqa	%ymm12, -912(%rbp)
	vpand	%ymm1, %ymm0, %ymm1
	vmovdqa	%ymm11, -848(%rbp)
	vmovdqa	%ymm9, -464(%rbp)
	vmovdqa	%ymm8, -432(%rbp)
	vpxor	%ymm3, %ymm1, %ymm3
	vpxor	%ymm7, %ymm1, %ymm1
	vmovdqa	.LC10(%rip), %ymm7
	vmovdqa	%ymm3, -656(%rbp)
	vmovdqa	%ymm1, -592(%rbp)
	vpxor	%ymm6, %ymm2, %ymm1
	vpand	%ymm1, %ymm0, %ymm1
	vpxor	%ymm2, %ymm1, %ymm2
	vpxor	%ymm6, %ymm1, %ymm1
	vmovdqa	.LC9(%rip), %ymm6
	vmovdqa	%ymm2, -624(%rbp)
	vmovdqa	%ymm1, -560(%rbp)
	vpsubq	%ymm5, %ymm6, %ymm1
	vmovdqa	%ymm1, -720(%rbp)
	vpsubq	%ymm4, %ymm7, %ymm1
	vmovdqa	%ymm1, -688(%rbp)
	movq	-672(%rbp), %rdi
	movq	-664(%rbp), %rsi
	movq	%rdi, %r8
	andq	%r13, %rdi
	shrq	$56, %r8
	movq	%rsi, %rax
	andq	%r13, %rsi
	addq	%r8, %rsi
	shrq	$56, %rax
	movq	%rsi, -664(%rbp)
	movq	-680(%rbp), %rsi
	movq	%rax, %rcx
	addq	-688(%rbp), %rcx
	movq	%rsi, %r8
	andq	%r13, %rsi
	shrq	$56, %r8
	addq	%r8, %rdi
	movq	%rdi, -672(%rbp)
	movq	%rcx, %rdi
	andq	%r13, %rcx
	shrq	$56, %rdi
	addq	%rdi, %rsi
	movq	%rsi, -680(%rbp)
	movq	-696(%rbp), %rsi
	movq	%rsi, %rdi
	andq	%r13, %rsi
	shrq	$56, %rdi
	addq	%rdi, %rcx
	movq	%rcx, -688(%rbp)
	movq	-704(%rbp), %rcx
	movq	%rcx, %rdi
	andq	%r13, %rcx
	shrq	$56, %rdi
	addq	%rdi, %rsi
	movq	%rsi, -696(%rbp)
	movq	-712(%rbp), %rsi
	movq	%rsi, %rdi
	andq	%r13, %rsi
	shrq	$56, %rdi
	addq	%rdi, %rcx
	movq	%rcx, -704(%rbp)
	movq	-720(%rbp), %rcx
	movq	%rcx, %rdi
	andq	%r13, %rcx
	shrq	$56, %rdi
	addq	%rcx, %rax
	addq	%rdi, %rsi
	movq	%rax, -720(%rbp)
	movq	%r12, %rdi
	movq	%rsi, -712(%rbp)
	vpxor	-720(%rbp), %ymm5, %ymm1
	vpand	%ymm0, %ymm1, %ymm1
	vpxor	%ymm5, %ymm1, %ymm5
	vmovdqa	%ymm5, -528(%rbp)
	vpxor	-688(%rbp), %ymm4, %ymm1
	movq	-856(%rbp), %rsi
	vpand	%ymm0, %ymm1, %ymm0
	vpxor	%ymm4, %ymm0, %ymm4
	vmovdqa	%ymm4, -496(%rbp)
	vzeroupper
	subl	$5, %r14d
	call	add_tw_pniels_to_tw_extensible@PLT
	cmpl	$-5, %r14d
	vmovdqa	-848(%rbp), %ymm11
	vmovdqa	-912(%rbp), %ymm12
	jne	.L83
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L101
	vzeroupper
	leaq	-48(%rbp), %rsp
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
.L101:
	.cfi_restore_state
	vzeroupper
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4671:
	.size	scalarmul, .-scalarmul
	.section	.text.unlikely.scalarmul
.LCOLDE12:
	.section	.text.scalarmul
.LHOTE12:
	.section	.text.unlikely.scalarmul_vlook,"ax",@progbits
.LCOLDB13:
	.section	.text.scalarmul_vlook,"ax",@progbits
.LHOTB13:
	.p2align 4,,15
	.globl	scalarmul_vlook
	.hidden	scalarmul_vlook
	.type	scalarmul_vlook, @function
scalarmul_vlook:
.LFB4672:
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
	movq	%rdi, %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	leaq	-784(%rbp), %rdi
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	leaq	-400(%rbp), %rbx
	subq	$768, %rsp
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	convert_to_signed_window_form.constprop.3
	movq	(%r12), %rax
	movq	64(%r12), %rcx
	movq	%rbx, %rdi
	movq	120(%r12), %rdx
	movq	%rax, -400(%rbp)
	movq	8(%r12), %rax
	movq	%rcx, -336(%rbp)
	movq	72(%r12), %rcx
	movq	%rdx, 120(%rbx)
	movq	%rax, -392(%rbp)
	movq	16(%r12), %rax
	movq	%rax, -384(%rbp)
	movq	24(%r12), %rax
	movq	%rax, -376(%rbp)
	movq	32(%r12), %rax
	movq	%rax, -368(%rbp)
	movq	40(%r12), %rax
	movq	%rax, -360(%rbp)
	movq	48(%r12), %rax
	movq	%rax, -352(%rbp)
	movq	56(%r12), %rax
	movq	%rax, -344(%rbp)
	movq	%rcx, 72(%rbx)
	movq	80(%r12), %rcx
	movq	%rcx, 80(%rbx)
	movq	88(%r12), %rcx
	movq	%rcx, 88(%rbx)
	movq	96(%r12), %rcx
	movq	%rcx, 96(%rbx)
	movq	104(%r12), %rcx
	movq	%rcx, 104(%rbx)
	movq	112(%r12), %rcx
	movq	%rcx, 112(%rbx)
	movq	128(%r12), %rcx
	movq	184(%r12), %rdx
	movq	%rcx, -272(%rbp)
	movq	136(%r12), %rcx
	movq	%rdx, 184(%rbx)
	movq	248(%r12), %rdx
	movq	%rcx, 136(%rbx)
	movq	144(%r12), %rcx
	movq	%rcx, 144(%rbx)
	movq	152(%r12), %rcx
	movq	%rcx, 152(%rbx)
	movq	160(%r12), %rcx
	movq	%rcx, 160(%rbx)
	movq	168(%r12), %rcx
	movq	%rcx, 168(%rbx)
	movq	176(%r12), %rcx
	movq	%rcx, 176(%rbx)
	movq	192(%r12), %rcx
	movq	%rcx, -208(%rbp)
	movq	200(%r12), %rcx
	movq	%rdx, 248(%rbx)
	movq	%rcx, 200(%rbx)
	movq	208(%r12), %rcx
	movq	%rcx, 208(%rbx)
	movq	216(%r12), %rcx
	movq	%rcx, 216(%rbx)
	movq	224(%r12), %rcx
	movq	%rcx, 224(%rbx)
	movq	232(%r12), %rcx
	movq	%rcx, 232(%rbx)
	movq	240(%r12), %rcx
	movq	%rcx, 240(%rbx)
	movq	256(%r12), %rcx
	movq	312(%r12), %rdx
	movq	%rcx, -144(%rbp)
	movq	264(%r12), %rcx
	movq	%rdx, 312(%rbx)
	movq	%rcx, 264(%rbx)
	movq	272(%r12), %rcx
	movq	%rcx, 272(%rbx)
	movq	280(%r12), %rcx
	movq	%rcx, 280(%rbx)
	movq	288(%r12), %rcx
	movq	%rcx, 288(%rbx)
	movq	296(%r12), %rcx
	movq	%rcx, 296(%rbx)
	movq	304(%r12), %rcx
	movq	%rcx, 304(%rbx)
	call	double_tw_extensible@PLT
	subq	$4128, %rsp
	movq	%rbx, %rsi
	leaq	31(%rsp), %r14
	andq	$-32, %r14
	movq	%r14, %r15
	movq	%r14, -800(%rbp)
	leaq	-656(%rbp), %r14
	leaq	256(%r15), %rbx
	leaq	4096(%r15), %r13
	movq	%r14, %rdi
	call	convert_tw_extensible_to_tw_pniels@PLT
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	convert_tw_extensible_to_tw_pniels@PLT
	.p2align 4,,10
	.p2align 3
.L103:
	movq	%r14, %rsi
	movq	%r12, %rdi
	call	add_tw_pniels_to_tw_extensible@PLT
	movq	%rbx, %rdi
	movq	%r12, %rsi
	addq	$256, %rbx
	call	convert_tw_extensible_to_tw_pniels@PLT
	cmpq	%r13, %rbx
	jne	.L103
	movl	$61, %eax
	shrx	%rax, -736(%rbp), %rax
	movabsq	$72057594037927935, %rbx
	notl	%eax
	andl	$15, %eax
	salq	$8, %rax
	addq	-800(%rbp), %rax
	movq	(%rax), %rcx
	movq	64(%rax), %rdi
	movq	%rcx, (%r14)
	movq	8(%rax), %rcx
	movq	%rdi, 64(%r14)
	movq	72(%rax), %rdi
	movq	%rcx, 8(%r14)
	movq	16(%rax), %rcx
	movq	%rdi, 72(%r14)
	movq	80(%rax), %rdi
	movq	%rcx, 16(%r14)
	movq	24(%rax), %rcx
	movq	%rdi, 80(%r14)
	movq	88(%rax), %rdi
	movq	%rcx, 24(%r14)
	movq	32(%rax), %rcx
	movq	%rdi, 88(%r14)
	movq	96(%rax), %rdi
	movq	%rcx, 32(%r14)
	movq	40(%rax), %rcx
	movq	%rdi, 96(%r14)
	movq	104(%rax), %rdi
	movq	%rcx, 40(%r14)
	movq	48(%rax), %rcx
	movq	%rdi, 104(%r14)
	movq	112(%rax), %rdi
	movq	%rcx, 48(%r14)
	movq	56(%rax), %rcx
	movq	%rdi, 112(%r14)
	movq	%rcx, 56(%r14)
	movq	120(%rax), %rsi
	movq	128(%rax), %rdi
	movq	%rsi, 120(%r14)
	movq	184(%rax), %rsi
	movq	%rdi, 128(%r14)
	movq	136(%rax), %rdi
	movq	%rsi, 184(%r14)
	leaq	192(%rax), %rsi
	movq	%rdi, 136(%r14)
	movq	144(%rax), %rdi
	movq	%rdi, 144(%r14)
	movq	152(%rax), %rdi
	movq	%rdi, 152(%r14)
	movq	160(%rax), %rdi
	movq	%rdi, 160(%r14)
	movq	168(%rax), %rdi
	movq	%rdi, 168(%r14)
	movq	176(%rax), %rdi
	movq	192(%rax), %rax
	movq	%rdi, 176(%r14)
	movq	%rbx, %rdi
	movq	%rax, 192(%r14)
	movq	8(%rsi), %rax
	movq	%rax, 200(%r14)
	movq	16(%rsi), %rax
	movq	%rax, 208(%r14)
	movq	24(%rsi), %rax
	movq	%rax, 216(%r14)
	movq	32(%rsi), %rax
	movq	%rax, 224(%r14)
	movq	40(%rsi), %rax
	movq	%rax, 232(%r14)
	movq	48(%rsi), %rax
	movq	%rax, 240(%r14)
	movq	56(%rsi), %rax
	vmovdqa	-592(%rbp), %ymm0
	vmovdqa	.LC9(%rip), %ymm6
	vpxor	-656(%rbp), %ymm0, %ymm1
	vmovdqa	%ymm0, -656(%rbp)
	vmovdqa	.LC10(%rip), %ymm7
	movq	%rax, 248(%r14)
	vpxor	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, -592(%rbp)
	vmovdqa	-560(%rbp), %ymm0
	vpxor	-624(%rbp), %ymm0, %ymm1
	vmovdqa	%ymm0, -624(%rbp)
	vpxor	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, -560(%rbp)
	vpsubq	-528(%rbp), %ymm6, %ymm0
	vmovdqa	%ymm0, -720(%rbp)
	movq	-704(%rbp), %rcx
	andq	-696(%rbp), %rdi
	vpsubq	-496(%rbp), %ymm7, %ymm0
	vmovdqa	%ymm0, -688(%rbp)
	movzbl	-657(%rbp), %esi
	addq	%rsi, -688(%rbp)
	movq	%rcx, %rax
	andq	%rbx, %rcx
	shrq	$56, %rax
	addq	%rdi, %rax
	vmovdqu	-696(%rbp), %xmm0
	vpermq	$27, -688(%rbp), %ymm1
	movq	%rax, -696(%rbp)
	movq	-712(%rbp), %rax
	vinserti128	$0x1, -680(%rbp), %ymm0, %ymm0
	movq	%rax, %rdi
	andq	%rbx, %rax
	shrq	$56, %rdi
	vpand	.LC11(%rip), %ymm1, %ymm1
	addq	%rdi, %rcx
	movq	%rcx, -704(%rbp)
	movq	-720(%rbp), %rcx
	vpermq	$27, %ymm0, %ymm0
	movq	%rcx, %rdi
	andq	%rbx, %rcx
	shrq	$56, %rdi
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm1, %ymm0, %ymm0
	vpermq	$27, %ymm0, %ymm0
	addq	%rdi, %rax
	addq	%rcx, %rsi
	movq	%rsi, -720(%rbp)
	movq	%rax, -712(%rbp)
	movq	%r14, %rsi
	movq	%r12, %rdi
	vmovdqa	%ymm0, -688(%rbp)
	vmovdqa	-720(%rbp), %ymm1
	vmovdqa	%ymm0, -496(%rbp)
	vmovdqa	%ymm1, -528(%rbp)
	vzeroupper
	movl	$440, %r13d
	call	convert_tw_pniels_to_tw_extensible@PLT
	.p2align 4,,10
	.p2align 3
.L104:
	movl	$5, %r15d
.L105:
	movq	%r12, %rdi
	call	double_tw_extensible@PLT
	subl	$1, %r15d
	jne	.L105
	movl	%r13d, %ecx
	movl	%r13d, %esi
	sarl	$6, %ecx
	andl	$63, %esi
	movslq	%ecx, %rax
	cmpl	$58, %esi
	movq	-784(%rbp,%rax,8), %rax
	shrx	%rsi, %rax, %rax
	jle	.L108
	cmpl	$383, %r13d
	jg	.L108
	addl	$1, %ecx
	movl	$64, %edi
	movslq	%ecx, %rcx
	subl	%esi, %edi
	movq	-784(%rbp,%rcx,8), %rsi
	shlx	%rdi, %rsi, %rcx
	xorl	%ecx, %eax
.L108:
	andl	$31, %eax
	movl	%eax, %ecx
	sarl	$4, %ecx
	subl	$1, %ecx
	xorl	%ecx, %eax
	andl	$15, %eax
	salq	$8, %rax
	addq	-800(%rbp), %rax
	movq	(%rax), %rsi
	movq	64(%rax), %r8
	movq	120(%rax), %rdi
	movq	%rsi, (%r14)
	movq	8(%rax), %rsi
	movq	%r8, 64(%r14)
	movq	72(%rax), %r8
	movq	%rsi, 8(%r14)
	movq	16(%rax), %rsi
	movq	%r8, 72(%r14)
	movq	80(%rax), %r8
	movq	%rsi, 16(%r14)
	movq	24(%rax), %rsi
	movq	%r8, 80(%r14)
	movq	88(%rax), %r8
	movq	%rsi, 24(%r14)
	movq	32(%rax), %rsi
	movq	%r8, 88(%r14)
	movq	96(%rax), %r8
	movq	%rsi, 32(%r14)
	movq	40(%rax), %rsi
	movq	%r8, 96(%r14)
	movq	104(%rax), %r8
	movq	%rsi, 40(%r14)
	movq	48(%rax), %rsi
	movq	%r8, 104(%r14)
	movq	112(%rax), %r8
	movq	%rsi, 48(%r14)
	movq	56(%rax), %rsi
	movq	%r8, 112(%r14)
	movq	%rsi, 56(%r14)
	movq	%rdi, 120(%r14)
	movq	128(%rax), %r8
	movq	184(%rax), %rdi
	movq	%r8, 128(%r14)
	movq	136(%rax), %r8
	movq	%rdi, 184(%r14)
	leaq	192(%rax), %rdi
	movq	%r8, 136(%r14)
	movq	144(%rax), %r8
	movq	%r8, 144(%r14)
	movq	152(%rax), %r8
	movq	%r8, 152(%r14)
	movq	160(%rax), %r8
	movq	%r8, 160(%r14)
	movq	168(%rax), %r8
	movq	%r8, 168(%r14)
	movq	176(%rax), %r8
	movq	192(%rax), %rax
	movq	%r8, 176(%r14)
	movq	%rax, 192(%r14)
	movq	8(%rdi), %rax
	movq	%rax, 200(%r14)
	movq	16(%rdi), %rax
	movq	%rax, 208(%r14)
	movq	24(%rdi), %rax
	movq	%rax, 216(%r14)
	movq	32(%rdi), %rax
	movq	%rax, 224(%r14)
	movq	40(%rdi), %rax
	movq	%rax, 232(%r14)
	movq	48(%rdi), %rax
	movq	%rax, 240(%r14)
	movq	56(%rdi), %rax
	movq	%rax, 248(%r14)
	movl	%ecx, -788(%rbp)
	vmovdqa	-656(%rbp), %ymm3
	vmovdqa	-592(%rbp), %ymm1
	vpbroadcastd	-788(%rbp), %ymm0
	vpxor	%ymm1, %ymm3, %ymm2
	vmovdqa	.LC9(%rip), %ymm4
	vmovdqa	.LC10(%rip), %ymm5
	vpand	%ymm2, %ymm0, %ymm2
	vpxor	%ymm2, %ymm3, %ymm3
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqa	%ymm3, -656(%rbp)
	vmovdqa	%ymm1, -592(%rbp)
	vmovdqa	-624(%rbp), %ymm3
	vmovdqa	-560(%rbp), %ymm1
	vpxor	%ymm1, %ymm3, %ymm2
	vpand	%ymm2, %ymm0, %ymm2
	vpxor	%ymm2, %ymm3, %ymm3
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqa	-496(%rbp), %ymm2
	vmovdqa	%ymm3, -624(%rbp)
	vmovdqa	-528(%rbp), %ymm3
	vmovdqa	%ymm1, -560(%rbp)
	vpsubq	%ymm3, %ymm4, %ymm1
	vmovdqa	%ymm1, -720(%rbp)
	vpsubq	%ymm2, %ymm5, %ymm1
	vmovdqa	%ymm1, -688(%rbp)
	movq	-672(%rbp), %rdi
	movq	-664(%rbp), %rsi
	movq	%rdi, %r8
	andq	%rbx, %rdi
	shrq	$56, %r8
	movq	%rsi, %rax
	andq	%rbx, %rsi
	addq	%r8, %rsi
	shrq	$56, %rax
	movq	%rsi, -664(%rbp)
	movq	-680(%rbp), %rsi
	movq	%rax, %rcx
	addq	-688(%rbp), %rcx
	movq	%rsi, %r8
	andq	%rbx, %rsi
	shrq	$56, %r8
	addq	%r8, %rdi
	movq	%rdi, -672(%rbp)
	movq	%rcx, %rdi
	andq	%rbx, %rcx
	shrq	$56, %rdi
	addq	%rdi, %rsi
	movq	%rsi, -680(%rbp)
	movq	-696(%rbp), %rsi
	movq	%rsi, %rdi
	andq	%rbx, %rsi
	shrq	$56, %rdi
	addq	%rdi, %rcx
	movq	%rcx, -688(%rbp)
	movq	-704(%rbp), %rcx
	movq	%rcx, %rdi
	andq	%rbx, %rcx
	shrq	$56, %rdi
	addq	%rdi, %rsi
	movq	%rsi, -696(%rbp)
	movq	-712(%rbp), %rsi
	movq	%rsi, %rdi
	andq	%rbx, %rsi
	shrq	$56, %rdi
	addq	%rdi, %rcx
	movq	%rcx, -704(%rbp)
	movq	-720(%rbp), %rcx
	movq	%rcx, %rdi
	andq	%rbx, %rcx
	shrq	$56, %rdi
	addq	%rcx, %rax
	addq	%rdi, %rsi
	movq	%rax, -720(%rbp)
	movq	%r12, %rdi
	movq	%rsi, -712(%rbp)
	movq	%r14, %rsi
	vpxor	-720(%rbp), %ymm3, %ymm1
	vpand	%ymm0, %ymm1, %ymm1
	vpxor	%ymm3, %ymm1, %ymm1
	vmovdqa	%ymm1, -528(%rbp)
	vpxor	-688(%rbp), %ymm2, %ymm1
	vpand	%ymm0, %ymm1, %ymm0
	vpxor	%ymm2, %ymm0, %ymm0
	vmovdqa	%ymm0, -496(%rbp)
	vzeroupper
	subl	$5, %r13d
	call	add_tw_pniels_to_tw_extensible@PLT
	cmpl	$-5, %r13d
	jne	.L104
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L119
	leaq	-48(%rbp), %rsp
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
.L119:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4672:
	.size	scalarmul_vlook, .-scalarmul_vlook
	.section	.text.unlikely.scalarmul_vlook
.LCOLDE13:
	.section	.text.scalarmul_vlook
.LHOTE13:
	.section	.text.unlikely.scalarmul_fixed_base,"ax",@progbits
.LCOLDB14:
	.section	.text.scalarmul_fixed_base,"ax",@progbits
.LHOTB14:
	.p2align 4,,15
	.globl	scalarmul_fixed_base
	.hidden	scalarmul_fixed_base
	.type	scalarmul_fixed_base, @function
scalarmul_fixed_base:
.LFB4674:
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
	leal	63(%rdx), %r14d
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	shrl	$6, %r14d
	subq	$416, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%r14d, %eax
	movq	%rdi, -424(%rbp)
	movq	%fs:40, %rbx
	movq	%rbx, -56(%rbp)
	xorl	%ebx, %ebx
	movl	120(%rcx), %ebx
	salq	$3, %rax
	cmpl	$6, %r14d
	movq	%rcx, -432(%rbp)
	movl	128(%rcx), %r15d
	movl	%ebx, -412(%rbp)
	movl	124(%rcx), %ebx
	ja	.L121
	movl	$56, %eax
	movl	$7, %r14d
.L121:
	addq	$22, %rax
	movq	-432(%rbp), %rcx
	andl	$1073741808, %eax
	subq	%rax, %rsp
	movq	%rsp, %rdi
	call	schedule_scalar_for_combs
	xorl	%edx, %edx
	testq	%rax, %rax
	je	.L122
	testl	%r15d, %r15d
	je	.L123
	leal	-1(%rbx), %r13d
	movl	$1, %eax
	vmovdqa	.LC8(%rip), %ymm6
	sall	$6, %r14d
	movl	$0, -408(%rbp)
	shlx	%r13d, %eax, %eax
	movl	%r13d, -404(%rbp)
	movq	%rsp, %r13
	leal	-1(%rax), %edi
	cltq
	movq	%rax, -440(%rbp)
	leaq	(%rax,%rax,2), %rax
	movl	%edi, -416(%rbp)
	movl	%ebx, %edi
	imull	%r15d, %edi
	salq	$6, %rax
	movq	%rax, -464(%rbp)
	movl	%edi, -444(%rbp)
	.p2align 4,,10
	.p2align 3
.L124:
	movl	-412(%rbp), %eax
	testl	%eax, %eax
	je	.L126
	leal	-1(%r15), %r10d
	subl	-408(%rbp), %r10d
	leaq	-272(%rbp), %rax
	xorl	%r9d, %r9d
	movq	%r13, %r11
	movabsq	$72057594037927935, %r12
	movq	%rax, -368(%rbp)
	movl	%r9d, %r13d
	.p2align 4,,10
	.p2align 3
.L127:
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	$-1, %eax
	testl	%ebx, %ebx
	movl	%r10d, %ecx
	movl	%eax, %r8d
	je	.L135
	.p2align 4,,10
	.p2align 3
.L147:
	cmpl	%ecx, %r14d
	jbe	.L128
	movl	%ecx, %eax
	shrl	$6, %eax
	movq	(%r11,%rax,8), %rax
	shrq	%cl, %rax
	andl	$1, %eax
	shlx	%rsi, %rax, %rax
	orl	%eax, %edx
.L128:
	addl	$1, %esi
	addl	%r15d, %ecx
	cmpl	%esi, %ebx
	jne	.L147
	movzbl	-404(%rbp), %eax
	sarx	%eax, %edx, %eax
	leal	-1(%rax), %r8d
	movl	%edx, %eax
	xorl	%r8d, %eax
.L135:
	movq	-432(%rbp), %rdi
	andl	-416(%rbp), %eax
	movl	$24, %ecx
	movq	(%rdi), %rsi
	movzbl	-404(%rbp), %edi
	movl	%eax, -400(%rbp)
	xorl	%eax, %eax
	vpbroadcastd	-400(%rbp), %ymm1
	shlx	%edi, %r13d, %edx
	movq	-368(%rbp), %rdi
	leaq	(%rdx,%rdx,2), %rdx
	salq	$6, %rdx
	cmpq	$0, -440(%rbp)
	rep stosq
	je	.L158
	vpxor	%xmm8, %xmm8, %xmm8
	leaq	(%rsi,%rdx), %rax
	addq	-464(%rbp), %rdx
	vmovdqa	%ymm8, %ymm7
	vmovdqa	%ymm8, %ymm2
	vmovdqa	%ymm8, %ymm3
	vmovdqa	%ymm8, %ymm4
	addq	%rdx, %rsi
	vmovdqa	%ymm8, %ymm5
	vmovdqa	%ymm8, %ymm10
	.p2align 4,,10
	.p2align 3
.L132:
	vpcmpeqd	%ymm10, %ymm1, %ymm0
	addq	$192, %rax
	vpsubd	%ymm6, %ymm1, %ymm1
	vpand	-192(%rax), %ymm0, %ymm9
	vpor	%ymm9, %ymm5, %ymm5
	vmovdqa	%ymm5, -272(%rbp)
	vpand	-160(%rax), %ymm0, %ymm9
	vpor	%ymm9, %ymm4, %ymm4
	vmovdqa	%ymm4, -240(%rbp)
	vpand	-128(%rax), %ymm0, %ymm9
	vpor	%ymm9, %ymm3, %ymm3
	vmovdqa	%ymm3, -208(%rbp)
	vpand	-96(%rax), %ymm0, %ymm9
	vpor	%ymm9, %ymm2, %ymm2
	vmovdqa	%ymm2, -176(%rbp)
	vpand	-64(%rax), %ymm0, %ymm9
	vpor	%ymm9, %ymm7, %ymm7
	vmovdqa	%ymm7, -144(%rbp)
	vpand	-32(%rax), %ymm0, %ymm0
	cmpq	%rax, %rsi
	vpor	%ymm0, %ymm8, %ymm8
	vmovdqa	%ymm8, -112(%rbp)
	jne	.L132
	vpxor	%ymm3, %ymm5, %ymm0
	movl	%r8d, -400(%rbp)
	vpbroadcastd	-400(%rbp), %ymm1
	vpand	%ymm1, %ymm0, %ymm0
	vpxor	%ymm5, %ymm0, %ymm5
	vpxor	%ymm3, %ymm0, %ymm3
	vpxor	%ymm2, %ymm4, %ymm0
	vpand	%ymm1, %ymm0, %ymm0
	vpxor	%ymm4, %ymm0, %ymm4
	vpxor	%ymm2, %ymm0, %ymm0
.L131:
	vmovdqa	-144(%rbp), %ymm2
	movq	%r11, -456(%rbp)
	vmovdqa	.LC9(%rip), %ymm7
	vmovdqa	%ymm3, -208(%rbp)
	vmovdqa	%ymm0, -176(%rbp)
	vpsubq	%ymm2, %ymm7, %ymm3
	vmovdqa	-112(%rbp), %ymm0
	vmovdqa	.LC10(%rip), %ymm7
	vmovdqa	%ymm3, -336(%rbp)
	vpsubq	%ymm0, %ymm7, %ymm3
	vmovdqa	%ymm3, -304(%rbp)
	movq	-288(%rbp), %rsi
	movq	-280(%rbp), %rcx
	vmovdqa	%ymm5, -272(%rbp)
	vmovdqa	%ymm4, -240(%rbp)
	movq	%rsi, %rdi
	andq	%r12, %rsi
	shrq	$56, %rdi
	movq	%rcx, %rax
	andq	%r12, %rcx
	addq	%rdi, %rcx
	shrq	$56, %rax
	movq	%rcx, -280(%rbp)
	movq	-296(%rbp), %rcx
	movq	%rax, %rdx
	addq	-304(%rbp), %rdx
	movq	%rcx, %rdi
	andq	%r12, %rcx
	shrq	$56, %rdi
	addq	%rdi, %rsi
	movq	%rsi, -288(%rbp)
	movq	%rdx, %rsi
	andq	%r12, %rdx
	shrq	$56, %rsi
	addq	%rsi, %rcx
	movq	%rcx, -296(%rbp)
	movq	-312(%rbp), %rcx
	movq	%rcx, %rsi
	andq	%r12, %rcx
	shrq	$56, %rsi
	addq	%rsi, %rdx
	movq	%rdx, -304(%rbp)
	movq	-320(%rbp), %rdx
	movq	%rdx, %rsi
	andq	%r12, %rdx
	shrq	$56, %rsi
	addq	%rsi, %rcx
	movq	%rcx, -312(%rbp)
	movq	-328(%rbp), %rcx
	movq	%rcx, %rsi
	andq	%r12, %rcx
	shrq	$56, %rsi
	addq	%rsi, %rdx
	movq	%rdx, -320(%rbp)
	movq	-336(%rbp), %rdx
	movq	%rdx, %rsi
	andq	%r12, %rdx
	shrq	$56, %rsi
	addq	%rdx, %rax
	addq	%rsi, %rcx
	movq	%rax, -336(%rbp)
	movl	-408(%rbp), %eax
	movq	%rcx, -328(%rbp)
	vpxor	-336(%rbp), %ymm2, %ymm3
	orl	%r13d, %eax
	vpand	%ymm1, %ymm3, %ymm3
	vpxor	%ymm2, %ymm3, %ymm2
	vmovdqa	%ymm2, -144(%rbp)
	vpxor	-304(%rbp), %ymm0, %ymm2
	vpand	%ymm1, %ymm2, %ymm1
	vpxor	%ymm0, %ymm1, %ymm0
	vmovdqa	%ymm0, -112(%rbp)
	movl	%r10d, -448(%rbp)
	movq	-368(%rbp), %rsi
	vmovdqa	%ymm6, -400(%rbp)
	movq	-424(%rbp), %rdi
	je	.L133
	vzeroupper
	call	add_tw_niels_to_tw_extensible@PLT
	movl	-448(%rbp), %r10d
	movq	-456(%rbp), %r11
	vmovdqa	-400(%rbp), %ymm6
.L134:
	addl	$1, %r13d
	addl	-444(%rbp), %r10d
	cmpl	%r13d, -412(%rbp)
	jne	.L127
	movq	%r11, %r13
.L126:
	addl	$1, -408(%rbp)
	movl	-408(%rbp), %eax
	cmpl	%eax, %r15d
	je	.L159
	movl	-408(%rbp), %edx
	testl	%edx, %edx
	je	.L124
	movq	-424(%rbp), %rdi
	vmovdqa	%ymm6, -368(%rbp)
	vzeroupper
	call	double_tw_extensible@PLT
	vmovdqa	-368(%rbp), %ymm6
	jmp	.L124
	.p2align 4,,10
	.p2align 3
.L133:
	vzeroupper
	call	convert_tw_niels_to_tw_extensible@PLT
	movq	-456(%rbp), %r11
	movl	-448(%rbp), %r10d
	vmovdqa	-400(%rbp), %ymm6
	jmp	.L134
.L158:
	vpxor	%xmm0, %xmm0, %xmm0
	movl	%r8d, -400(%rbp)
	vpbroadcastd	-400(%rbp), %ymm1
	vmovdqa	%ymm0, %ymm4
	vmovdqa	%ymm0, %ymm3
	vmovdqa	%ymm0, %ymm5
	jmp	.L131
.L159:
	vzeroupper
.L123:
	movq	$-1, %rdx
.L122:
	movq	-56(%rbp), %rbx
	xorq	%fs:40, %rbx
	movq	%rdx, %rax
	jne	.L160
	leaq	-48(%rbp), %rsp
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
.L160:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4674:
	.size	scalarmul_fixed_base, .-scalarmul_fixed_base
	.section	.text.unlikely.scalarmul_fixed_base
.LCOLDE14:
	.section	.text.scalarmul_fixed_base
.LHOTE14:
	.section	.rodata.str1.1
.LC15:
	.string	"ii < (int)table->s"
	.section	.text.unlikely.linear_combo_combs_vt,"ax",@progbits
.LCOLDB16:
	.section	.text.linear_combo_combs_vt,"ax",@progbits
.LHOTB16:
	.p2align 4,,15
	.globl	linear_combo_combs_vt
	.hidden	linear_combo_combs_vt
	.type	linear_combo_combs_vt, @function
linear_combo_combs_vt:
.LFB4675:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leal	63(%rdx), %r11d
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	shrl	$6, %r11d
	pushq	%rbx
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, %r12
	subq	$104, %rsp
	movq	16(%rbp), %rax
	movl	128(%rcx), %ebx
	movq	%fs:40, %rdi
	movq	%rdi, -56(%rbp)
	xorl	%edi, %edi
	cmpl	$6, %r11d
	movq	%rcx, -128(%rbp)
	movq	%rax, -120(%rbp)
	movl	128(%rax), %eax
	movl	%ebx, -100(%rbp)
	movl	%eax, -104(%rbp)
	jbe	.L185
	movl	%r11d, %ecx
	movl	%r11d, %r15d
	salq	$3, %rcx
.L162:
	leal	63(%r9), %r10d
	shrl	$6, %r10d
	movl	%r10d, %eax
	movl	%r10d, %r14d
	salq	$3, %rax
	cmpl	$6, %r10d
	ja	.L163
	movl	$56, %eax
	movl	$7, %r14d
.L163:
	addq	$22, %rcx
	addq	$22, %rax
	movl	%r9d, -132(%rbp)
	andl	$1073741808, %ecx
	andl	$1073741808, %eax
	movq	%r8, -112(%rbp)
	subq	%rcx, %rsp
	movq	-128(%rbp), %rcx
	movq	%rsp, %r13
	subq	%rax, %rsp
	movq	%r13, %rdi
	call	schedule_scalar_for_combs
	testq	%rax, %rax
	movq	-112(%rbp), %r8
	movl	-132(%rbp), %r9d
	je	.L166
	movq	-120(%rbp), %rcx
	movl	%r9d, %edx
	movq	%r8, %rsi
	movq	%rsp, %rdi
	call	schedule_scalar_for_combs
	testq	%rax, %rax
	jne	.L202
.L166:
	xorl	%eax, %eax
.L165:
	movq	-56(%rbp), %rbx
	xorq	%fs:40, %rbx
	jne	.L203
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L185:
	.cfi_restore_state
	movl	$56, %ecx
	movl	$7, %r15d
	jmp	.L162
.L202:
	movl	-100(%rbp), %edi
	movl	-104(%rbp), %eax
	movl	%r15d, -96(%rbp)
	movl	%r14d, -92(%rbp)
	movq	%r13, -80(%rbp)
	movq	%rsp, -72(%rbp)
	cmpl	%eax, %edi
	cmovnb	%edi, %eax
	movq	%r12, %rdi
	movl	%eax, -112(%rbp)
	call	set_identity_tw_extensible@PLT
	movl	-112(%rbp), %edx
	testl	%edx, %edx
	je	.L167
	movl	$0, -100(%rbp)
.L168:
	movl	$1, -104(%rbp)
	xorl	%r14d, %r14d
.L169:
	testq	%r14, %r14
	je	.L170
	movq	-120(%rbp), %r13
	movl	128(%r13), %eax
	movl	%eax, %ebx
	subl	-112(%rbp), %ebx
	addl	-100(%rbp), %ebx
	js	.L171
.L182:
	cmpl	%ebx, %eax
	jle	.L172
	movl	120(%r13), %eax
	xorl	%r15d, %r15d
	testl	%eax, %eax
	je	.L171
	.p2align 4,,10
	.p2align 3
.L191:
	movl	124(%r13), %esi
	testl	%esi, %esi
	je	.L179
	movl	128(%r13), %r8d
	movl	%esi, %ecx
	movl	$6, %eax
	shlx	%eax, -96(%rbp,%r14,4), %r9d
	xorl	%edi, %edi
	imull	%r8d, %ecx
	movl	%ecx, %edx
	leal	-1(%r8), %ecx
	imull	%r15d, %edx
	movl	%ecx, %eax
	subl	%ebx, %eax
	leal	(%rdx,%rax), %ecx
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L175:
	cmpl	%r9d, %ecx
	jnb	.L174
	movq	-80(%rbp,%r14,8), %r10
	movl	%ecx, %eax
	shrl	$6, %eax
	movq	(%r10,%rax,8), %rax
	shrq	%cl, %rax
	andl	$1, %eax
	shlx	%rdx, %rax, %rax
	orl	%eax, %edi
.L174:
	addl	$1, %edx
	addl	%r8d, %ecx
	cmpl	%edx, %esi
	jne	.L175
	subl	$1, %esi
	movl	$1, %edx
	sarx	%esi, %edi, %eax
	shlx	%esi, %edx, %edx
	shlx	%esi, %r15d, %esi
	subl	$1, %eax
	subl	$1, %edx
	xorl	%eax, %edi
	andl	%edx, %edi
	leal	(%rdi,%rsi), %edx
	leaq	(%rdx,%rdx,2), %rsi
	salq	$6, %rsi
	addq	0(%r13), %rsi
	testl	%eax, %eax
	jne	.L183
	movq	%r12, %rdi
	call	add_tw_niels_to_tw_extensible@PLT
.L177:
	addl	$1, %r15d
	cmpl	%r15d, 120(%r13)
	ja	.L191
.L171:
	cmpl	$2, -104(%rbp)
	jne	.L180
	addl	$1, -100(%rbp)
	movl	-100(%rbp), %eax
	cmpl	%eax, -112(%rbp)
	je	.L167
	movq	%r12, %rdi
	call	double_tw_extensible@PLT
	jmp	.L168
.L179:
	movl	$-1, %eax
	shlx	%eax, %r15d, %eax
	subl	$1, %eax
	leaq	(%rax,%rax,2), %rsi
	salq	$6, %rsi
	addq	0(%r13), %rsi
	.p2align 4,,10
	.p2align 3
.L183:
	movq	%r12, %rdi
	call	sub_tw_niels_from_tw_extensible@PLT
	jmp	.L177
.L170:
	movq	-128(%rbp), %r13
	movl	128(%r13), %eax
	movl	%eax, %ebx
	subl	-112(%rbp), %ebx
	addl	-100(%rbp), %ebx
	jns	.L182
.L180:
	addq	$1, %r14
	addl	$1, -104(%rbp)
	jmp	.L169
.L167:
	movq	$-1, %rax
	jmp	.L165
.L203:
	call	__stack_chk_fail@PLT
.L172:
	leaq	__PRETTY_FUNCTION__.28044(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC15(%rip), %rdi
	movl	$374, %edx
	call	__assert_fail@PLT
	.cfi_endproc
.LFE4675:
	.size	linear_combo_combs_vt, .-linear_combo_combs_vt
	.section	.text.unlikely.linear_combo_combs_vt
.LCOLDE16:
	.section	.text.linear_combo_combs_vt
.LHOTE16:
	.section	.text.unlikely.precompute_fixed_base,"ax",@progbits
.LCOLDB17:
	.section	.text.precompute_fixed_base,"ax",@progbits
.LHOTB17:
	.p2align 4,,15
	.globl	precompute_fixed_base
	.hidden	precompute_fixed_base
	.type	precompute_fixed_base, @function
precompute_fixed_base:
.LFB4676:
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
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%edx, %ebx
	subq	$1120, %rsp
	movl	%edx, -1112(%rbp)
	movq	%rdi, -1120(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	testl	%ecx, %ecx
	movl	%ecx, -1064(%rbp)
	movq	%r9, -1128(%rbp)
	sete	%dl
	testl	%ebx, %ebx
	sete	%al
	orb	%al, %dl
	jne	.L205
	testl	%r8d, %r8d
	movl	%r8d, %r12d
	je	.L205
	movl	%ecx, %r13d
	imull	%ebx, %r13d
	imull	%r8d, %r13d
	cmpl	$445, %r13d
	ja	.L206
.L205:
	movq	-1120(%rbp), %rax
	leaq	136(%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L207:
	movb	$0, (%rax)
	addq	$1, %rax
	cmpq	%rax, %rdx
	jne	.L207
.L283:
	xorl	%eax, %eax
.L208:
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L287
	leaq	-48(%rbp), %rsp
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
.L206:
	.cfi_restore_state
	movq	%rdi, %rax
	movl	-1064(%rbp), %edi
	leaq	-1048(%rbp), %r14
	movl	%ebx, 120(%rax)
	movl	%r8d, 128(%rax)
	leaq	-720(%rbp), %rbx
	movl	%edi, 124(%rax)
	movq	(%rsi), %rax
	movq	64(%rsi), %rcx
	movq	%rax, -720(%rbp)
	movq	8(%rsi), %rax
	movq	%rcx, -656(%rbp)
	movq	72(%rsi), %rcx
	movq	%rax, -712(%rbp)
	movq	16(%rsi), %rax
	movq	%rax, -704(%rbp)
	movq	24(%rsi), %rax
	movq	%rax, -696(%rbp)
	movq	32(%rsi), %rax
	movq	%rax, -688(%rbp)
	movq	40(%rsi), %rax
	movq	%rax, -680(%rbp)
	movq	48(%rsi), %rax
	movq	%rax, -672(%rbp)
	movq	56(%rsi), %rax
	movq	%rax, -664(%rbp)
	movq	%rcx, 72(%rbx)
	movq	80(%rsi), %rcx
	movq	%rcx, 80(%rbx)
	movq	88(%rsi), %rcx
	movq	%rcx, 88(%rbx)
	movq	96(%rsi), %rcx
	movq	%rcx, 96(%rbx)
	movq	104(%rsi), %rcx
	movq	%rcx, 104(%rbx)
	movq	112(%rsi), %rcx
	movq	120(%rsi), %rdx
	movq	%rcx, 112(%rbx)
	movq	128(%rsi), %rcx
	movq	%rdx, 120(%rbx)
	movq	184(%rsi), %rdx
	movq	%rcx, -592(%rbp)
	movq	136(%rsi), %rcx
	movq	%rdx, 184(%rbx)
	movq	%rcx, 136(%rbx)
	movq	144(%rsi), %rcx
	movq	%rcx, 144(%rbx)
	movq	152(%rsi), %rcx
	movq	%rcx, 152(%rbx)
	movq	160(%rsi), %rcx
	movq	%rcx, 160(%rbx)
	movq	168(%rsi), %rcx
	movq	%rcx, 168(%rbx)
	movq	176(%rsi), %rcx
	movq	%rcx, 176(%rbx)
	movq	192(%rsi), %rcx
	movq	%rcx, -528(%rbp)
	movq	200(%rsi), %rcx
	movq	%rcx, 200(%rbx)
	movq	208(%rsi), %rcx
	movq	%rcx, 208(%rbx)
	movq	216(%rsi), %rcx
	movq	%rcx, 216(%rbx)
	movq	224(%rsi), %rcx
	movq	%rcx, 224(%rbx)
	movq	232(%rsi), %rcx
	movq	%rcx, 232(%rbx)
	movq	240(%rsi), %rcx
	movq	248(%rsi), %rdx
	movq	$0, -1048(%rbp)
	movq	%rcx, 240(%rbx)
	movq	256(%rsi), %rcx
	movq	%rdx, 248(%rbx)
	movq	312(%rsi), %rdx
	movq	%rcx, -464(%rbp)
	movq	264(%rsi), %rcx
	movq	%rdx, 312(%rbx)
	leal	-1(%rdi), %edx
	movq	%r14, %rdi
	movq	%rcx, 264(%rbx)
	movq	272(%rsi), %rcx
	movl	%edx, -1060(%rbp)
	salq	$8, %rdx
	movq	%rcx, 272(%rbx)
	movq	280(%rsi), %rcx
	movq	%rcx, 280(%rbx)
	movq	288(%rsi), %rcx
	movq	%rcx, 288(%rbx)
	movq	296(%rsi), %rcx
	movq	%rcx, 296(%rbx)
	movq	304(%rsi), %rcx
	movl	$32, %esi
	movq	%rcx, 304(%rbx)
	call	posix_memalign@PLT
	testl	%eax, %eax
	jne	.L254
	movq	-1048(%rbp), %rax
	testq	%rax, %rax
	movq	%rax, -1104(%rbp)
	sete	%r15b
.L209:
	movzbl	-1060(%rbp), %ecx
	movl	$32, %esi
	movq	%r14, %rdi
	shlx	%ecx, -1112(%rbp), %eax
	movq	$0, -1048(%rbp)
	movl	%eax, -1136(%rbp)
	movq	%rax, -1152(%rbp)
	salq	$6, %rax
	movq	%rax, %rdx
	movq	%rax, -1072(%rbp)
	call	posix_memalign@PLT
	testl	%eax, %eax
	movq	-1072(%rbp), %rcx
	jne	.L255
	movq	-1048(%rbp), %rax
	testq	%rax, %rax
	movq	%rax, -1096(%rbp)
	sete	%al
	orl	%eax, %r15d
.L210:
	movq	%rcx, %rdx
	movl	$32, %esi
	movq	%r14, %rdi
	movq	$0, -1048(%rbp)
	call	posix_memalign@PLT
	xorl	%ecx, %ecx
	testl	%eax, %eax
	movq	%rcx, %rax
	cmove	-1048(%rbp), %rax
	movq	%rax, -1144(%rbp)
	movq	-1128(%rbp), %rax
	testq	%rax, %rax
	je	.L212
	movq	-1120(%rbp), %rcx
	movq	%rax, -1088(%rbp)
	movl	$0, 132(%rcx)
.L213:
	testb	%r15b, %r15b
	movq	%rax, (%rcx)
	jne	.L215
	cmpq	$0, -1144(%rbp)
	je	.L215
	testq	%rax, %rax
	je	.L215
	movl	%r13d, %r15d
	movl	$255, %esi
	shrl	$6, %r15d
	leal	1(%r15), %r9d
	leaq	8(,%r15,8), %rdx
	leaq	22(,%r9,8), %rax
	movl	%r9d, -1108(%rbp)
	andl	$2147483632, %eax
	subq	%rax, %rsp
	movl	$3, %eax
	shrx	%rax, %rsp, %r8
	leaq	0(,%r8,8), %r14
	movq	%r8, -1080(%rbp)
	movq	%r14, %rdi
	call	memset@PLT
	movl	$1, %r10d
	movl	%r13d, %ecx
	movl	-1108(%rbp), %r9d
	movq	%r10, %rax
	movq	curve_prime_order@GOTPCREL(%rip), %r13
	xorl	%edx, %edx
	salq	%cl, %rax
	addq	%rax, (%r14,%r15,8)
	movq	%r14, %rdi
	movl	%r9d, %esi
	movq	%r10, -1072(%rbp)
	movq	%r13, %rcx
	call	barrett_reduce@PLT
	movq	-1080(%rbp), %r8
	movq	-1120(%rbp), %rdi
	movq	$-1, %r9
	movq	%r14, %rsi
	movq	0(,%r8,8), %rcx
	movq	%rcx, %rax
	andl	$1, %eax
	cmpq	$1, %rax
	sbbq	%rdx, %rdx
	andl	$7, %edx
	leaq	8(%rdi,%rdx,8), %r15
	leaq	0(,%rax,8), %rdx
	salq	$6, %rax
	subq	%rdx, %rax
	leaq	8(%rdi,%rax), %rax
	movq	%r15, %rdi
	movq	%rcx, (%rax)
	movq	8(,%r8,8), %rdx
	movq	16(%r13), %rcx
	movq	%rdx, 8(%rax)
	movq	16(,%r8,8), %rdx
	movq	%rdx, 16(%rax)
	movq	24(,%r8,8), %rdx
	movq	%rdx, 24(%rax)
	movq	32(,%r8,8), %rdx
	movq	%rdx, 32(%rax)
	movq	40(,%r8,8), %rdx
	movq	%rdx, 40(%rax)
	movq	48(,%r8,8), %rdx
	movl	8(%r13), %r8d
	movq	%rdx, 48(%rax)
	movl	$7, %edx
	call	sub_nr_ext_packed@PLT
	movl	4(%r13), %edx
	testl	%edx, %edx
	je	.L225
	movl	0(%r13), %eax
	movq	-1072(%rbp), %r10
	subl	$1, %eax
	shlx	%rdx, %r10, %r10
	addq	%r10, (%r15,%rax,8)
.L225:
	movzbl	-1060(%rbp), %ecx
	movl	$1, %eax
	leaq	-976(%rbp), %r13
	subl	$1, %r12d
	movl	$0, -1132(%rbp)
	shlx	%ecx, %eax, %eax
	subl	$1, %eax
	movl	%eax, -1108(%rbp)
	leaq	-400(%rbp), %rax
	movq	%rax, -1072(%rbp)
	movl	-1112(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -1156(%rbp)
.L241:
	movq	-1104(%rbp), %rax
	xorl	%r14d, %r14d
	movq	%r13, -1080(%rbp)
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L233:
	testl	%r14d, %r14d
	je	.L226
	movq	-1080(%rbp), %r13
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	convert_tw_extensible_to_tw_pniels@PLT
	movq	-1072(%rbp), %rdi
	movq	%r13, %rsi
	call	add_tw_pniels_to_tw_extensible@PLT
.L227:
	cmpl	-1060(%rbp), %r14d
	je	.L288
	movq	%rbx, %rdi
	call	double_tw_extensible@PLT
	cmpl	-1060(%rbp), %r14d
	jnb	.L231
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	convert_tw_extensible_to_tw_pniels@PLT
.L231:
	xorl	%r13d, %r13d
	testl	%r12d, %r12d
	je	.L235
	.p2align 4,,10
	.p2align 3
.L265:
	movq	%rbx, %rdi
	addl	$1, %r13d
	call	double_tw_extensible@PLT
	cmpl	%r13d, %r12d
	jne	.L265
.L235:
	addl	$1, %r14d
	addq	$256, %r15
	cmpl	%r14d, -1064(%rbp)
	jne	.L233
.L282:
	addl	$1, -1132(%rbp)
	movzbl	-1060(%rbp), %ecx
	xorl	%r15d, %r15d
	movl	-1132(%rbp), %eax
	movq	-1080(%rbp), %r13
	shlx	%ecx, %eax, %r14d
	leal	-1(%r14), %eax
	movl	%eax, -1080(%rbp)
	.p2align 4,,10
	.p2align 3
.L230:
	movq	-1072(%rbp), %rsi
	movl	%r15d, %ecx
	movq	%r13, %rdi
	shrl	%ecx
	xorl	%r15d, %ecx
	movl	%ecx, %r14d
	call	convert_tw_extensible_to_tw_pniels@PLT
	movl	-1080(%rbp), %eax
	movq	0(%r13), %rsi
	xorl	%r14d, %eax
	cltq
	leaq	(%rax,%rax,2), %rdx
	salq	$6, %rax
	salq	$6, %rdx
	addq	-1088(%rbp), %rdx
	movq	%rsi, (%rdx)
	movq	8(%r13), %rsi
	movq	%rsi, 8(%rdx)
	movq	16(%r13), %rsi
	movq	%rsi, 16(%rdx)
	movq	24(%r13), %rsi
	movq	%rsi, 24(%rdx)
	movq	32(%r13), %rsi
	movq	%rsi, 32(%rdx)
	movq	40(%r13), %rsi
	movq	%rsi, 40(%rdx)
	movq	48(%r13), %rsi
	movq	%rsi, 48(%rdx)
	movq	56(%r13), %rsi
	movq	%rsi, 56(%rdx)
	movq	64(%r13), %r8
	leaq	128(%rdx), %rsi
	movq	%r8, 64(%rdx)
	movq	72(%r13), %r8
	movq	%r8, 72(%rdx)
	movq	80(%r13), %r8
	movq	%r8, 80(%rdx)
	movq	88(%r13), %r8
	movq	%r8, 88(%rdx)
	movq	96(%r13), %r8
	movq	%r8, 96(%rdx)
	movq	104(%r13), %r8
	movq	%r8, 104(%rdx)
	movq	112(%r13), %r8
	movq	%r8, 112(%rdx)
	movq	120(%r13), %rdi
	addq	-1096(%rbp), %rax
	movq	%rdi, 120(%rdx)
	movq	128(%r13), %r8
	movq	%r8, 128(%rdx)
	movq	136(%r13), %rdx
	movq	%rdx, 8(%rsi)
	movq	144(%r13), %rdx
	movq	%rdx, 16(%rsi)
	movq	152(%r13), %rdx
	movq	%rdx, 24(%rsi)
	movq	160(%r13), %rdx
	movq	%rdx, 32(%rsi)
	movq	168(%r13), %rdx
	movq	%rdx, 40(%rsi)
	movq	176(%r13), %rdx
	movq	%rdx, 48(%rsi)
	movq	184(%r13), %rdx
	movq	%rdx, 56(%rsi)
	movq	192(%r13), %rsi
	movq	%rsi, (%rax)
	movq	200(%r13), %rsi
	movq	%rsi, 8(%rax)
	movq	208(%r13), %rsi
	movq	%rsi, 16(%rax)
	movq	216(%r13), %rsi
	movq	%rsi, 24(%rax)
	movq	224(%r13), %rsi
	movq	%rsi, 32(%rax)
	movq	232(%r13), %rsi
	movq	%rsi, 40(%rax)
	movq	240(%r13), %rsi
	movq	%rsi, 48(%rax)
	cmpl	-1108(%rbp), %r15d
	movq	248(%r13), %rdx
	movq	%rdx, 56(%rax)
	je	.L236
	addl	$1, %r15d
	movl	%r15d, %eax
	shrl	%eax
	xorl	%r14d, %eax
	xorl	%r15d, %eax
	cmpl	$1, %eax
	jle	.L260
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L238:
	sarl	%eax
	addl	$1, %edx
	cmpl	$1, %eax
	jne	.L238
	movl	%edx, %eax
	salq	$8, %rax
.L237:
	movq	-1104(%rbp), %rcx
	btl	%edx, %r14d
	movq	-1072(%rbp), %rdi
	leaq	(%rcx,%rax), %rsi
	jnc	.L239
	call	add_tw_pniels_to_tw_extensible@PLT
	jmp	.L230
.L254:
	movl	$1, %r15d
	movq	$0, -1104(%rbp)
	jmp	.L209
	.p2align 4,,10
	.p2align 3
.L239:
	call	sub_tw_pniels_from_tw_extensible@PLT
	jmp	.L230
.L236:
	movl	-1132(%rbp), %ecx
	cmpl	%ecx, -1112(%rbp)
	jne	.L241
	movl	-1136(%rbp), %ebx
	movq	-1096(%rbp), %rsi
	movq	-1144(%rbp), %rdi
	movl	%ebx, %edx
	call	p448_simultaneous_invert@PLT
	testl	%ebx, %ebx
	je	.L246
	movl	-1136(%rbp), %eax
	movq	-1088(%rbp), %rcx
	leaq	-1040(%rbp), %r13
	movq	-1144(%rbp), %rbx
	subl	$1, %eax
	movq	%rcx, %r14
	leaq	3(%rax,%rax,2), %r12
	salq	$6, %r12
	addq	%rcx, %r12
.L245:
	movq	%rbx, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
	movq	%r13, %rdi
	leaq	64(%r14), %r15
	call	p448_strong_reduce@PLT
	movq	0(%r13), %rax
	movq	%rbx, %rdx
	movq	%r15, %rsi
	movq	%r13, %rdi
	leaq	128(%r14), %r15
	addq	$192, %r14
	movq	%rax, -192(%r14)
	movq	8(%r13), %rax
	movq	%rax, -184(%r14)
	movq	16(%r13), %rax
	movq	%rax, -176(%r14)
	movq	24(%r13), %rax
	movq	%rax, -168(%r14)
	movq	32(%r13), %rax
	movq	%rax, -160(%r14)
	movq	40(%r13), %rax
	movq	%rax, -152(%r14)
	movq	48(%r13), %rax
	movq	%rax, -144(%r14)
	movq	56(%r13), %rax
	movq	%rax, -136(%r14)
	call	p448_mul@PLT
	movq	%r13, %rdi
	call	p448_strong_reduce@PLT
	movq	0(%r13), %rax
	movq	%rbx, %rdx
	movq	%r15, %rsi
	movq	%r13, %rdi
	addq	$64, %rbx
	movq	%rax, -128(%r14)
	movq	8(%r13), %rax
	movq	%rax, -120(%r14)
	movq	16(%r13), %rax
	movq	%rax, -112(%r14)
	movq	24(%r13), %rax
	movq	%rax, -104(%r14)
	movq	32(%r13), %rax
	movq	%rax, -96(%r14)
	movq	40(%r13), %rax
	movq	%rax, -88(%r14)
	movq	48(%r13), %rax
	movq	%rax, -80(%r14)
	movq	56(%r13), %rax
	movq	%rax, -72(%r14)
	call	p448_mul@PLT
	movq	%r13, %rdi
	call	p448_strong_reduce@PLT
	movq	0(%r13), %rax
	movq	%rax, -64(%r14)
	movq	8(%r13), %rax
	movq	%rax, -56(%r14)
	movq	16(%r13), %rax
	movq	%rax, -48(%r14)
	movq	24(%r13), %rax
	movq	%rax, -40(%r14)
	movq	32(%r13), %rax
	movq	%rax, -32(%r14)
	movq	40(%r13), %rax
	movq	%rax, -24(%r14)
	movq	48(%r13), %rax
	movq	%rax, -16(%r14)
	movq	56(%r13), %rax
	movq	%rax, -8(%r14)
	cmpq	%r12, %r14
	jne	.L245
.L246:
	movq	-1144(%rbp), %r15
	movq	%r15, %rdi
	call	p448_is_zero@PLT
	movq	-1104(%rbp), %rdi
	notq	%rax
	movq	%rax, %rbx
	call	free@PLT
	movq	-1096(%rbp), %rdi
	call	free@PLT
	movq	%r15, %rdi
	call	free@PLT
	testq	%rbx, %rbx
	je	.L244
	movq	%rbx, %rax
	jmp	.L208
.L260:
	xorl	%eax, %eax
	xorl	%edx, %edx
	jmp	.L237
.L215:
	movq	-1104(%rbp), %rdi
	call	free@PLT
	movq	-1096(%rbp), %rdi
	call	free@PLT
	movq	-1144(%rbp), %rdi
	call	free@PLT
	movq	-1120(%rbp), %rax
	leaq	136(%rax), %rdx
	.p2align 4,,10
	.p2align 3
.L218:
	movb	$0, (%rax)
	addq	$1, %rax
	cmpq	%rax, %rdx
	jne	.L218
	movq	-1152(%rbp), %rax
	movq	-1088(%rbp), %rbx
	leaq	(%rax,%rax,2), %rcx
	movq	%rbx, %rax
	salq	$6, %rcx
	testq	%rcx, %rcx
	leaq	(%rbx,%rcx), %rdx
	je	.L223
.L263:
	movb	$0, (%rax)
	addq	$1, %rax
	cmpq	%rdx, %rax
	jne	.L263
.L223:
	cmpq	$0, -1128(%rbp)
	jne	.L283
	movq	-1088(%rbp), %rdi
	call	free@PLT
	jmp	.L283
	.p2align 4,,10
	.p2align 3
.L255:
	movl	$1, %r15d
	movq	$0, -1096(%rbp)
	jmp	.L210
.L212:
	movq	-1152(%rbp), %rax
	movl	$32, %esi
	movq	%r14, %rdi
	movq	$0, -1048(%rbp)
	leaq	(%rax,%rax,2), %rdx
	salq	$6, %rdx
	call	posix_memalign@PLT
	testl	%eax, %eax
	movq	-1128(%rbp), %rax
	cmove	-1048(%rbp), %rax
	movq	%rax, -1088(%rbp)
	movq	-1120(%rbp), %rax
	movl	$1, 132(%rax)
	movq	%rax, %rcx
	movq	-1088(%rbp), %rax
	jmp	.L213
.L288:
	movl	-1156(%rbp), %ecx
	cmpl	%ecx, -1132(%rbp)
	je	.L282
	movq	%rbx, %rdi
	call	double_tw_extensible@PLT
	jmp	.L231
.L226:
	movq	-1072(%rbp), %rdi
	movq	(%rbx), %rax
	movq	64(%rbx), %rcx
	movq	120(%rbx), %rdx
	movq	%rax, (%rdi)
	movq	8(%rbx), %rax
	movq	%rcx, 64(%rdi)
	movq	72(%rbx), %rcx
	movq	%rax, 8(%rdi)
	movq	16(%rbx), %rax
	movq	%rax, 16(%rdi)
	movq	24(%rbx), %rax
	movq	%rax, 24(%rdi)
	movq	32(%rbx), %rax
	movq	%rax, 32(%rdi)
	movq	40(%rbx), %rax
	movq	%rax, 40(%rdi)
	movq	48(%rbx), %rax
	movq	%rax, 48(%rdi)
	movq	56(%rbx), %rax
	movq	%rax, 56(%rdi)
	leaq	64(%rdi), %rax
	movq	%rcx, 8(%rax)
	movq	80(%rbx), %rcx
	movq	%rcx, 16(%rax)
	movq	88(%rbx), %rcx
	movq	%rcx, 24(%rax)
	movq	96(%rbx), %rcx
	movq	%rcx, 32(%rax)
	movq	104(%rbx), %rcx
	movq	%rcx, 40(%rax)
	movq	112(%rbx), %rcx
	movq	%rcx, 48(%rax)
	movq	%rdx, 56(%rax)
	leaq	128(%rdi), %rax
	movq	128(%rbx), %rcx
	movq	184(%rbx), %rdx
	movq	%rcx, 128(%rdi)
	movq	136(%rbx), %rcx
	movq	%rdx, 56(%rax)
	movq	248(%rbx), %rdx
	movq	%rcx, 8(%rax)
	movq	144(%rbx), %rcx
	movq	%rcx, 16(%rax)
	movq	152(%rbx), %rcx
	movq	%rcx, 24(%rax)
	movq	160(%rbx), %rcx
	movq	%rcx, 32(%rax)
	movq	168(%rbx), %rcx
	movq	%rcx, 40(%rax)
	movq	176(%rbx), %rcx
	movq	%rcx, 48(%rax)
	movq	192(%rbx), %rcx
	leaq	192(%rdi), %rax
	movq	%rcx, 192(%rdi)
	movq	200(%rbx), %rcx
	movq	%rdx, 56(%rax)
	movq	%rcx, 8(%rax)
	movq	208(%rbx), %rcx
	movq	%rcx, 16(%rax)
	movq	216(%rbx), %rcx
	movq	%rcx, 24(%rax)
	movq	224(%rbx), %rcx
	movq	%rcx, 32(%rax)
	movq	232(%rbx), %rcx
	movq	%rcx, 40(%rax)
	movq	240(%rbx), %rcx
	movq	%rcx, 48(%rax)
	movq	256(%rbx), %rcx
	leaq	256(%rdi), %rax
	movq	312(%rbx), %rdx
	movq	%rcx, 256(%rdi)
	movq	264(%rbx), %rcx
	movq	%rdx, 56(%rax)
	movq	%rcx, 8(%rax)
	movq	272(%rbx), %rcx
	movq	%rcx, 16(%rax)
	movq	280(%rbx), %rcx
	movq	%rcx, 24(%rax)
	movq	288(%rbx), %rcx
	movq	%rcx, 32(%rax)
	movq	296(%rbx), %rcx
	movq	%rcx, 40(%rax)
	movq	304(%rbx), %rcx
	movq	%rcx, 48(%rax)
	jmp	.L227
.L287:
	call	__stack_chk_fail@PLT
.L244:
	movq	-1152(%rbp), %rax
	movq	-1088(%rbp), %rcx
	leaq	(%rax,%rax,2), %rax
	movq	%rcx, %rdx
	salq	$6, %rax
	addq	%rax, %rcx
	testq	%rax, %rax
	je	.L251
.L264:
	movb	$0, (%rdx)
	addq	$1, %rdx
	cmpq	%rcx, %rdx
	jne	.L264
.L251:
	cmpq	$0, -1128(%rbp)
	jne	.L249
	movq	-1088(%rbp), %rdi
	call	free@PLT
.L249:
	movq	-1120(%rbp), %rax
	leaq	136(%rax), %rdx
.L252:
	movb	$0, (%rax)
	addq	$1, %rax
	cmpq	%rax, %rdx
	jne	.L252
	jmp	.L283
	.cfi_endproc
.LFE4676:
	.size	precompute_fixed_base, .-precompute_fixed_base
	.section	.text.unlikely.precompute_fixed_base
.LCOLDE17:
	.section	.text.precompute_fixed_base
.LHOTE17:
	.section	.text.unlikely.destroy_fixed_base,"ax",@progbits
.LCOLDB18:
	.section	.text.destroy_fixed_base,"ax",@progbits
.LHOTB18:
	.p2align 4,,15
	.globl	destroy_fixed_base
	.hidden	destroy_fixed_base
	.type	destroy_fixed_base, @function
destroy_fixed_base:
.LFB4677:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	(%rdi), %rax
	movq	%rdi, %rbx
	testq	%rax, %rax
	je	.L293
	movl	124(%rdi), %ecx
	leal	-1(%rcx), %edx
	shlx	%edx, 120(%rdi), %edx
	leaq	(%rdx,%rdx,2), %rdx
	salq	$6, %rdx
	testq	%rdx, %rdx
	je	.L293
	addq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L294:
	movb	$0, (%rax)
	addq	$1, %rax
	cmpq	%rdx, %rax
	jne	.L294
.L293:
	movl	132(%rbx), %eax
	testl	%eax, %eax
	jne	.L303
.L292:
	leaq	136(%rbx), %rax
	movq	%rbx, %rdi
	.p2align 4,,10
	.p2align 3
.L295:
	movb	$0, (%rdi)
	addq	$1, %rdi
	cmpq	%rax, %rdi
	jne	.L295
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L303:
	.cfi_restore_state
	movq	(%rbx), %rdi
	call	free@PLT
	jmp	.L292
	.cfi_endproc
.LFE4677:
	.size	destroy_fixed_base, .-destroy_fixed_base
	.section	.text.unlikely.destroy_fixed_base
.LCOLDE18:
	.section	.text.destroy_fixed_base
.LHOTE18:
	.section	.text.unlikely.precompute_fixed_base_wnaf,"ax",@progbits
.LCOLDB19:
	.section	.text.precompute_fixed_base_wnaf,"ax",@progbits
.LHOTB19:
	.p2align 4,,15
	.globl	precompute_fixed_base_wnaf
	.hidden	precompute_fixed_base_wnaf
	.type	precompute_fixed_base_wnaf, @function
precompute_fixed_base_wnaf:
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
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	movl	%edx, %r13d
	pushq	%r12
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movl	$64, %r12d
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	leaq	-984(%rbp), %rbx
	shlx	%r13, %r12, %r12
	movq	%rdi, %r14
	subq	$992, %rsp
	movq	%rsi, %r15
	movq	%r12, %rdx
	movl	$32, %esi
	movq	%rbx, %rdi
	movq	$0, -984(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	posix_memalign@PLT
	testl	%eax, %eax
	jne	.L305
	movq	-984(%rbp), %rax
	movq	%r12, %rdx
	movl	$32, %esi
	movq	%rbx, %rdi
	movq	$0, -984(%rbp)
	movq	%rax, -1016(%rbp)
	call	posix_memalign@PLT
	testl	%eax, %eax
	jne	.L306
	cmpq	$0, -1016(%rbp)
	movq	-984(%rbp), %rcx
	movq	%rcx, -1024(%rbp)
	je	.L317
	testq	%rcx, %rcx
	je	.L317
	leaq	-400(%rbp), %rax
	movq	64(%r15), %rsi
	movq	120(%r15), %rdx
	leaq	-656(%rbp), %r12
	movq	%rax, %rcx
	movq	%rax, -1008(%rbp)
	movq	(%r15), %rax
	movq	%rsi, -336(%rbp)
	movq	72(%r15), %rsi
	movq	%r12, %rdi
	movq	%rax, -400(%rbp)
	movq	8(%r15), %rax
	movq	%rax, -392(%rbp)
	movq	16(%r15), %rax
	movq	%rax, -384(%rbp)
	movq	24(%r15), %rax
	movq	%rax, -376(%rbp)
	movq	32(%r15), %rax
	movq	%rax, -368(%rbp)
	movq	40(%r15), %rax
	movq	%rax, -360(%rbp)
	movq	48(%r15), %rax
	movq	%rax, -352(%rbp)
	movq	56(%r15), %rax
	movq	%rax, -344(%rbp)
	movq	%rsi, 72(%rcx)
	movq	80(%r15), %rsi
	movq	%rsi, 80(%rcx)
	movq	88(%r15), %rsi
	movq	%rsi, 88(%rcx)
	movq	96(%r15), %rsi
	movq	%rsi, 96(%rcx)
	movq	104(%r15), %rsi
	movq	%rsi, 104(%rcx)
	movq	112(%r15), %rsi
	movq	%rsi, 112(%rcx)
	movq	%rdx, 120(%rcx)
	movq	128(%r15), %rsi
	movq	184(%r15), %rdx
	movq	%rsi, -272(%rbp)
	movq	136(%r15), %rsi
	movq	%rdx, 184(%rcx)
	movq	248(%r15), %rdx
	movq	%rsi, 136(%rcx)
	movq	144(%r15), %rsi
	movq	%rsi, 144(%rcx)
	movq	152(%r15), %rsi
	movq	%rsi, 152(%rcx)
	movq	160(%r15), %rsi
	movq	%rsi, 160(%rcx)
	movq	168(%r15), %rsi
	movq	%rsi, 168(%rcx)
	movq	176(%r15), %rsi
	movq	%rsi, 176(%rcx)
	movq	192(%r15), %rsi
	movq	%rsi, -208(%rbp)
	movq	200(%r15), %rsi
	movq	%rdx, 248(%rcx)
	movq	%rsi, 200(%rcx)
	movq	208(%r15), %rsi
	movq	%rsi, 208(%rcx)
	movq	216(%r15), %rsi
	movq	%rsi, 216(%rcx)
	movq	224(%r15), %rsi
	movq	%rsi, 224(%rcx)
	movq	232(%r15), %rsi
	movq	%rsi, 232(%rcx)
	movq	240(%r15), %rsi
	movq	%rsi, 240(%rcx)
	movq	256(%r15), %rsi
	movq	312(%r15), %rdx
	movq	%rsi, -144(%rbp)
	movq	264(%r15), %rsi
	movq	%rdx, 312(%rcx)
	movq	%rsi, 264(%rcx)
	movq	272(%r15), %rsi
	movq	%rsi, 272(%rcx)
	movq	280(%r15), %rsi
	movq	%rsi, 280(%rcx)
	movq	288(%r15), %rsi
	movq	%rsi, 288(%rcx)
	movq	296(%r15), %rsi
	movq	%rsi, 296(%rcx)
	movq	304(%r15), %rsi
	movq	%rsi, 304(%rcx)
	movq	%rcx, %rsi
	call	convert_tw_extensible_to_tw_pniels@PLT
	movq	-464(%rbp), %rdx
	movq	-1016(%rbp), %rax
	testl	%r13d, %r13d
	leaq	64(%r12), %r8
	movq	%rdx, (%rax)
	movq	-456(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-448(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-440(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-432(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	-424(%rbp), %rdx
	movq	%rdx, 40(%rax)
	movq	-416(%rbp), %rdx
	movq	%rdx, 48(%rax)
	movq	-408(%rbp), %rdx
	movq	%rdx, 56(%rax)
	movq	-656(%rbp), %rdx
	movq	%rdx, (%r14)
	movq	-648(%rbp), %rdx
	movq	%rdx, 8(%r14)
	movq	-640(%rbp), %rdx
	movq	%rdx, 16(%r14)
	movq	-632(%rbp), %rdx
	movq	%rdx, 24(%r14)
	movq	-624(%rbp), %rdx
	movq	%rdx, 32(%r14)
	movq	-616(%rbp), %rdx
	movq	%rdx, 40(%r14)
	movq	-608(%rbp), %rdx
	movq	%rdx, 48(%r14)
	movq	-600(%rbp), %rdx
	movq	%rdx, 56(%r14)
	movq	-592(%rbp), %rsi
	movq	-528(%rbp), %rdi
	movq	%rsi, 64(%r14)
	movq	72(%r12), %rsi
	movq	%rdi, 128(%r14)
	movq	136(%r12), %rdi
	movq	%rsi, 72(%r14)
	movq	80(%r12), %rsi
	movq	%rdi, 136(%r14)
	movq	144(%r12), %rdi
	movq	%rsi, 80(%r14)
	movq	88(%r12), %rsi
	movq	%rdi, 144(%r14)
	movq	152(%r12), %rdi
	movq	%rsi, 88(%r14)
	movq	96(%r12), %rsi
	movq	%rdi, 152(%r14)
	movq	160(%r12), %rdi
	movq	%rsi, 96(%r14)
	movq	104(%r12), %rsi
	movq	%rdi, 160(%r14)
	movq	168(%r12), %rdi
	movq	%rsi, 104(%r14)
	movq	112(%r12), %rsi
	movq	%rdi, 168(%r14)
	movq	176(%r12), %rdi
	movq	%rsi, 112(%r14)
	movq	120(%r12), %rsi
	movq	%rdi, 176(%r14)
	movq	184(%r12), %rdi
	movq	%rsi, 120(%r14)
	movq	%rdi, 184(%r14)
	jne	.L331
	movq	-1024(%rbp), %rdi
	movq	%rax, %rsi
	movl	$1, %edx
	call	p448_simultaneous_invert@PLT
	movl	$1, -1000(%rbp)
.L312:
	movq	-1024(%rbp), %r15
	leaq	-976(%rbp), %r12
	movq	%r14, %r13
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L316:
	movq	%r15, %rdx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	p448_mul@PLT
	movq	%r12, %rdi
	leaq	64(%r13), %rbx
	addl	$1, %r14d
	call	p448_strong_reduce@PLT
	movq	(%r12), %rdx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	leaq	128(%r13), %rbx
	addq	$192, %r13
	movq	%rdx, -192(%r13)
	movq	8(%r12), %rdx
	movq	%rdx, -184(%r13)
	movq	16(%r12), %rdx
	movq	%rdx, -176(%r13)
	movq	24(%r12), %rdx
	movq	%rdx, -168(%r13)
	movq	32(%r12), %rdx
	movq	%rdx, -160(%r13)
	movq	40(%r12), %rdx
	movq	%rdx, -152(%r13)
	movq	48(%r12), %rdx
	movq	%rdx, -144(%r13)
	movq	56(%r12), %rdx
	movq	%rdx, -136(%r13)
	movq	%r15, %rdx
	call	p448_mul@PLT
	movq	%r12, %rdi
	call	p448_strong_reduce@PLT
	movq	(%r12), %rdx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	movq	%rdx, -128(%r13)
	movq	8(%r12), %rdx
	movq	%rdx, -120(%r13)
	movq	16(%r12), %rdx
	movq	%rdx, -112(%r13)
	movq	24(%r12), %rdx
	movq	%rdx, -104(%r13)
	movq	32(%r12), %rdx
	movq	%rdx, -96(%r13)
	movq	40(%r12), %rdx
	movq	%rdx, -88(%r13)
	movq	48(%r12), %rdx
	movq	%rdx, -80(%r13)
	movq	56(%r12), %rdx
	movq	%rdx, -72(%r13)
	movq	%r15, %rdx
	addq	$64, %r15
	call	p448_mul@PLT
	movq	%r12, %rdi
	call	p448_strong_reduce@PLT
	movq	(%r12), %rdx
	movq	%rdx, -64(%r13)
	movq	8(%r12), %rdx
	movq	%rdx, -56(%r13)
	movq	16(%r12), %rdx
	movq	%rdx, -48(%r13)
	movq	24(%r12), %rdx
	movq	%rdx, -40(%r13)
	movq	32(%r12), %rdx
	movq	%rdx, -32(%r13)
	movq	40(%r12), %rdx
	movq	%rdx, -24(%r13)
	movq	48(%r12), %rdx
	movq	%rdx, -16(%r13)
	movq	56(%r12), %rdx
	movq	%rdx, -8(%r13)
	cmpl	-1000(%rbp), %r14d
	jl	.L316
.L313:
	movq	-1016(%rbp), %rdi
	call	free@PLT
	movq	-1024(%rbp), %rdi
	call	free@PLT
	movq	$-1, %rax
.L309:
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L332
	addq	$992, %rsp
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
.L305:
	.cfi_restore_state
	movq	%r12, %rdx
	movl	$32, %esi
	movq	%rbx, %rdi
	movq	$0, -984(%rbp)
	call	posix_memalign@PLT
	testl	%eax, %eax
	je	.L333
	movq	$0, -1016(%rbp)
.L306:
	movq	$0, -1024(%rbp)
.L317:
	movq	-1016(%rbp), %rdi
	call	free@PLT
	movq	-1024(%rbp), %rdi
	call	free@PLT
	xorl	%eax, %eax
	jmp	.L309
	.p2align 4,,10
	.p2align 3
.L331:
	movq	-1008(%rbp), %rbx
	movq	%r8, -1000(%rbp)
	movq	%rbx, %rdi
	call	double_tw_extensible@PLT
	leaq	-912(%rbp), %rax
	movq	%rbx, %rsi
	movq	%rax, %rdi
	movq	%rax, -1032(%rbp)
	call	convert_tw_extensible_to_tw_pniels@PLT
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	add_tw_pniels_to_tw_extensible@PLT
	movq	%r12, %rdi
	movq	%rbx, %rsi
	call	convert_tw_extensible_to_tw_pniels@PLT
	movq	-1016(%rbp), %rax
	movq	-464(%rbp), %r9
	movq	%r9, 64(%rax)
	movq	200(%r12), %r9
	movq	%r9, 72(%rax)
	movq	208(%r12), %r9
	movq	%r9, 80(%rax)
	movq	216(%r12), %r9
	movq	%r9, 88(%rax)
	movq	224(%r12), %r9
	movq	%r9, 96(%rax)
	movq	232(%r12), %r9
	movq	%r9, 104(%rax)
	movq	240(%r12), %r9
	movq	%r9, 112(%rax)
	movq	248(%r12), %rdi
	movq	%rdi, 120(%rax)
	movq	-656(%rbp), %rdi
	movq	%rdi, 192(%r14)
	movq	-648(%rbp), %rdi
	movq	%rdi, 200(%r14)
	movq	-640(%rbp), %rdi
	movq	%rdi, 208(%r14)
	movq	-632(%rbp), %rdi
	movq	%rdi, 216(%r14)
	movq	-624(%rbp), %rdi
	movq	%rdi, 224(%r14)
	movq	-616(%rbp), %rdi
	movq	%rdi, 232(%r14)
	movq	-608(%rbp), %rdi
	movq	%rdi, 240(%r14)
	movq	-600(%rbp), %rdi
	movq	%rdi, 248(%r14)
	movq	-1000(%rbp), %r8
	movq	-592(%rbp), %rdi
	movq	184(%r12), %rdx
	movq	%rdi, 256(%r14)
	movq	8(%r8), %rdi
	movq	%rdi, 264(%r14)
	movq	16(%r8), %rdi
	movq	%rdi, 272(%r14)
	movq	24(%r8), %rdi
	movq	%rdi, 280(%r14)
	movq	32(%r8), %rdi
	movq	%rdi, 288(%r14)
	movq	40(%r8), %rdi
	movq	%rdi, 296(%r14)
	movq	48(%r8), %rdi
	movq	%rdi, 304(%r14)
	movq	56(%r8), %rdi
	movq	%rdi, 312(%r14)
	movq	-528(%rbp), %rdi
	movq	%rdi, 320(%r14)
	movq	136(%r12), %rdi
	movq	%rdi, 328(%r14)
	movq	144(%r12), %rdi
	movq	%rdi, 336(%r14)
	movq	152(%r12), %rdi
	movq	%rdi, 344(%r14)
	movq	160(%r12), %rdi
	movq	%rdi, 352(%r14)
	movq	168(%r12), %rdi
	movq	%rdi, 360(%r14)
	movq	176(%r12), %rdi
	movq	%rdi, 368(%r14)
	movq	%rdx, 376(%r14)
	movl	$1, %edx
	shlx	%r13d, %edx, %eax
	cmpl	$2, %eax
	movl	%eax, -1000(%rbp)
	jle	.L334
	movq	-1016(%rbp), %rax
	leaq	384(%r14), %r13
	leaq	128(%rax), %r15
	movl	-1000(%rbp), %eax
	leal	-3(%rax), %esi
	leaq	(%rsi,%rsi,2), %rsi
	salq	$6, %rsi
	leaq	576(%r14,%rsi), %rbx
	.p2align 4,,10
	.p2align 3
.L314:
	movq	-1032(%rbp), %rsi
	movq	-1008(%rbp), %rdi
	addq	$192, %r13
	addq	$64, %r15
	call	add_tw_pniels_to_tw_extensible@PLT
	movq	-1008(%rbp), %rsi
	movq	%r12, %rdi
	call	convert_tw_extensible_to_tw_pniels@PLT
	movq	192(%r12), %rdi
	movq	%rdi, -64(%r15)
	movq	200(%r12), %rdi
	movq	%rdi, -56(%r15)
	movq	208(%r12), %rdi
	movq	%rdi, -48(%r15)
	movq	216(%r12), %rdi
	movq	%rdi, -40(%r15)
	movq	224(%r12), %rdi
	movq	%rdi, -32(%r15)
	movq	232(%r12), %rdi
	movq	%rdi, -24(%r15)
	movq	240(%r12), %rdi
	movq	%rdi, -16(%r15)
	movq	248(%r12), %rsi
	movq	%rsi, -8(%r15)
	movq	(%r12), %rsi
	movq	%rsi, -192(%r13)
	movq	8(%r12), %rsi
	movq	%rsi, -184(%r13)
	movq	16(%r12), %rsi
	movq	%rsi, -176(%r13)
	movq	24(%r12), %rsi
	movq	%rsi, -168(%r13)
	movq	32(%r12), %rsi
	movq	%rsi, -160(%r13)
	movq	40(%r12), %rsi
	movq	%rsi, -152(%r13)
	movq	48(%r12), %rsi
	movq	%rsi, -144(%r13)
	movq	56(%r12), %rsi
	movq	%rsi, -136(%r13)
	movq	64(%r12), %r9
	movq	120(%r12), %rdi
	movq	%r9, -128(%r13)
	movq	72(%r12), %r9
	movq	%rdi, -72(%r13)
	movq	184(%r12), %rdi
	movq	%r9, -120(%r13)
	movq	80(%r12), %r9
	movq	%rdi, -8(%r13)
	movq	%r9, -112(%r13)
	movq	88(%r12), %r9
	movq	%r9, -104(%r13)
	movq	96(%r12), %r9
	movq	%r9, -96(%r13)
	movq	104(%r12), %r9
	movq	%r9, -88(%r13)
	movq	112(%r12), %r9
	movq	%r9, -80(%r13)
	movq	128(%r12), %r9
	movq	%r9, -64(%r13)
	movq	136(%r12), %r9
	movq	%r9, -56(%r13)
	movq	144(%r12), %r9
	movq	%r9, -48(%r13)
	movq	152(%r12), %r9
	movq	%r9, -40(%r13)
	movq	160(%r12), %r9
	movq	%r9, -32(%r13)
	movq	168(%r12), %r9
	movq	%r9, -24(%r13)
	movq	176(%r12), %r9
	movq	%r9, -16(%r13)
	cmpq	%rbx, %r13
	jne	.L314
	movl	-1000(%rbp), %edx
	movq	-1016(%rbp), %rsi
	movq	-1024(%rbp), %rdi
	call	p448_simultaneous_invert@PLT
	jmp	.L312
.L334:
	movq	-1016(%rbp), %rsi
	movq	-1024(%rbp), %rdi
	movl	%eax, %ebx
	movl	%eax, %edx
	call	p448_simultaneous_invert@PLT
	testl	%ebx, %ebx
	jle	.L313
	jmp	.L312
	.p2align 4,,10
	.p2align 3
.L332:
	call	__stack_chk_fail@PLT
.L333:
	movq	-984(%rbp), %rax
	movq	$0, -1016(%rbp)
	movq	%rax, -1024(%rbp)
	jmp	.L317
	.cfi_endproc
.LFE4678:
	.size	precompute_fixed_base_wnaf, .-precompute_fixed_base_wnaf
	.section	.text.unlikely.precompute_fixed_base_wnaf
.LCOLDE19:
	.section	.text.precompute_fixed_base_wnaf
.LHOTE19:
	.section	.rodata.str1.1
.LC20:
	.string	"control[0].addend > 0"
.LC21:
	.string	"control[0].power >= 0"
.LC22:
	.string	"control[conti].addend"
.LC23:
	.string	"conti <= control_bits"
	.section	.text.unlikely.scalarmul_vt,"ax",@progbits
.LCOLDB24:
	.section	.text.scalarmul_vt,"ax",@progbits
.LHOTB24:
	.p2align 4,,15
	.globl	scalarmul_vt
	.hidden	scalarmul_vt
	.type	scalarmul_vt, @function
scalarmul_vt:
.LFB4681:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movl	%edx, %ecx
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
	movl	%edx, %r10d
	pushq	%rbx
	shrl	$2, %r10d
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, %rbx
	subq	$320, %rsp
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	leal	3(%r10), %eax
	movq	%rsp, -368(%rbp)
	leaq	18(,%rax,8), %rax
	shrq	$4, %rax
	salq	$4, %rax
	subq	%rax, %rsp
	movl	$2, %eax
	subl	$1, %ecx
	shrx	%rax, %rsp, %rax
	movq	%rax, -360(%rbp)
	leaq	0(,%rax,4), %r12
	js	.L358
	leal	2(%r10), %r9d
	xorl	%r8d, %r8d
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L340:
	movl	%ecx, %eax
	sarl	$6, %eax
	cltq
	movq	(%rsi,%rax,8), %rax
	shrq	%cl, %rax
	andl	$1, %eax
	leal	(%rax,%rdi,2), %edi
	leal	16(%rdi), %eax
	cmpl	$31, %eax
	jbe	.L337
	leal	1(%rdi), %eax
	andl	$1, %edi
	movl	%ecx, %edx
	negl	%edi
	sarl	%eax
	testb	$1, %al
	jne	.L338
	.p2align 4,,10
	.p2align 3
.L339:
	sarl	%eax
	addl	$1, %edx
	testb	$1, %al
	je	.L339
.L338:
	movl	%r8d, %r11d
	addl	$1, %r8d
	addl	$1, %edx
	leaq	(%r12,%r11,8), %r11
	cmpl	%r9d, %r8d
	movl	%edx, (%r11)
	movl	%eax, 4(%r11)
	ja	.L374
.L337:
	subl	$1, %ecx
	cmpl	$-1, %ecx
	jne	.L340
	testl	%edi, %edi
	je	.L371
	xorl	%eax, %eax
	testb	$1, %dil
	jne	.L342
	.p2align 4,,10
	.p2align 3
.L343:
	sarl	%edi
	addl	$1, %eax
	testb	$1, %dil
	je	.L343
.L342:
	movl	%r8d, %edx
	addl	$2, %r10d
	addl	$1, %r8d
	leaq	(%r12,%rdx,8), %rdx
	cmpl	%r10d, %r8d
	movl	%eax, (%rdx)
	movl	%edi, 4(%rdx)
	ja	.L344
.L371:
	movl	%r8d, %eax
	movl	%r8d, -348(%rbp)
	salq	$3, %rax
.L336:
	subq	$2080, %rsp
	addq	%r12, %rax
	movq	%rbx, %rsi
	leaq	31(%rsp), %r14
	movl	$-1, (%rax)
	movl	$0, 4(%rax)
	leaq	-336(%rbp), %r15
	andq	$-32, %r14
	movq	%r14, %rdi
	leaq	512(%r14), %r13
	call	convert_tw_extensible_to_tw_pniels@PLT
	movq	%rbx, %rdi
	call	double_tw_extensible@PLT
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	convert_tw_extensible_to_tw_pniels@PLT
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	add_tw_pniels_to_tw_extensible@PLT
	leaq	256(%r14), %rdi
	movq	%rbx, %rsi
	call	convert_tw_extensible_to_tw_pniels@PLT
	leaq	2048(%r14), %rax
	movq	%rax, -344(%rbp)
	.p2align 4,,10
	.p2align 3
.L345:
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	add_tw_pniels_to_tw_extensible@PLT
	movq	%r13, %rdi
	movq	%rbx, %rsi
	addq	$256, %r13
	call	convert_tw_extensible_to_tw_pniels@PLT
	cmpq	%r13, -344(%rbp)
	jne	.L345
	movl	-348(%rbp), %eax
	testl	%eax, %eax
	jle	.L346
	movq	-360(%rbp), %rax
	movl	4(,%rax,4), %eax
	testl	%eax, %eax
	jle	.L375
	movq	-360(%rbp), %rcx
	movl	0(,%rcx,4), %r15d
	testl	%r15d, %r15d
	js	.L376
	sarl	%eax
	movq	%rbx, %rdi
	subl	$1, %r15d
	movslq	%eax, %rsi
	movl	$1, %r13d
	salq	$8, %rsi
	addq	%r14, %rsi
	call	convert_tw_pniels_to_tw_extensible@PLT
	cmpl	$-1, %r15d
	jne	.L363
	jmp	.L372
	.p2align 4,,10
	.p2align 3
.L351:
	subl	$1, %r15d
	cmpl	$-1, %r15d
	je	.L372
.L363:
	movq	%rbx, %rdi
	call	double_tw_extensible@PLT
	movslq	%r13d, %rax
	leaq	(%r12,%rax,8), %rax
	cmpl	%r15d, (%rax)
	jne	.L351
	movl	4(%rax), %eax
	cmpl	$0, %eax
	je	.L377
	jle	.L353
	sarl	%eax
	movq	%rbx, %rdi
	movslq	%eax, %rsi
	salq	$8, %rsi
	addq	%r14, %rsi
	call	add_tw_pniels_to_tw_extensible@PLT
.L354:
	addl	$1, %r13d
	cmpl	-348(%rbp), %r13d
	jle	.L351
	leaq	__PRETTY_FUNCTION__.28176(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC23(%rip), %rdi
	movl	$769, %edx
	call	__assert_fail@PLT
	.p2align 4,,10
	.p2align 3
.L353:
	negl	%eax
	movq	%rbx, %rdi
	sarl	%eax
	movslq	%eax, %rsi
	salq	$8, %rsi
	addq	%r14, %rsi
	call	sub_tw_pniels_from_tw_extensible@PLT
	jmp	.L354
.L346:
	movq	%rbx, %rdi
	call	set_identity_tw_extensible@PLT
.L372:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	movq	-368(%rbp), %rsp
	jne	.L378
	leaq	-48(%rbp), %rsp
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
.L358:
	.cfi_restore_state
	movl	$0, -348(%rbp)
	xorl	%eax, %eax
	jmp	.L336
.L378:
	call	__stack_chk_fail@PLT
.L377:
	leaq	__PRETTY_FUNCTION__.28176(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC22(%rip), %rdi
	movl	$761, %edx
	call	__assert_fail@PLT
.L376:
	leaq	__PRETTY_FUNCTION__.28176(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC21(%rip), %rdi
	movl	$749, %edx
	call	__assert_fail@PLT
.L375:
	leaq	__PRETTY_FUNCTION__.28176(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC20(%rip), %rdi
	movl	$748, %edx
	call	__assert_fail@PLT
.L344:
	leaq	__PRETTY_FUNCTION__.28150(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	movl	$699, %edx
	call	__assert_fail@PLT
.L374:
	leaq	__PRETTY_FUNCTION__.28150(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	movl	$688, %edx
	call	__assert_fail@PLT
	.cfi_endproc
.LFE4681:
	.size	scalarmul_vt, .-scalarmul_vt
	.section	.text.unlikely.scalarmul_vt
.LCOLDE24:
	.section	.text.scalarmul_vt
.LHOTE24:
	.section	.text.unlikely.scalarmul_fixed_base_wnaf_vt,"ax",@progbits
.LCOLDB25:
	.section	.text.scalarmul_fixed_base_wnaf_vt,"ax",@progbits
.LHOTB25:
	.p2align 4,,15
	.globl	scalarmul_fixed_base_wnaf_vt
	.hidden	scalarmul_fixed_base_wnaf_vt
	.type	scalarmul_fixed_base_wnaf_vt, @function
scalarmul_fixed_base_wnaf_vt:
.LFB4682:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	movq	%rdi, %r12
	pushq	%rbx
	movl	%edx, %edi
	subq	$56, %rsp
	.cfi_offset 3, -56
	movq	%rcx, -72(%rbp)
	leal	1(%r8), %ecx
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movl	%edx, %eax
	xorl	%edx, %edx
	movq	%rsp, -88(%rbp)
	divl	%ecx
	movl	%edi, %edx
	movl	%r8d, %ecx
	addl	$3, %eax
	leaq	18(,%rax,8), %rax
	shrq	$4, %rax
	salq	$4, %rax
	subq	%rax, %rsp
	movl	$2, %eax
	shrx	%rax, %rsp, %rbx
	leaq	0(,%rbx,4), %r15
	movq	%r15, %rdi
	call	recode_wnaf
	testl	%eax, %eax
	movl	%eax, -76(%rbp)
	jle	.L380
	movl	4(,%rbx,4), %eax
	testl	%eax, %eax
	jle	.L409
	movl	0(,%rbx,4), %edx
	testl	%edx, %edx
	js	.L410
	sarl	%eax
	movq	%r12, %rdi
	movq	%r15, %r14
	cltq
	movl	$1, %r13d
	leaq	(%rax,%rax,2), %rsi
	salq	$6, %rsi
	addq	-72(%rbp), %rsi
	call	convert_tw_niels_to_tw_extensible@PLT
	movl	8(,%rbx,4), %eax
	testl	%eax, %eax
	js	.L411
	.p2align 4,,10
	.p2align 3
.L404:
	movl	(%r14), %ebx
	subl	%eax, %ebx
	je	.L391
	.p2align 4,,10
	.p2align 3
.L401:
	movq	%r12, %rdi
	call	double_tw_extensible@PLT
	subl	$1, %ebx
	jne	.L401
.L391:
	movslq	%r13d, %rax
	leaq	(%r15,%rax,8), %rbx
	movl	4(%rbx), %eax
	cmpl	$0, %eax
	je	.L412
	jle	.L392
	sarl	%eax
	movq	%r12, %rdi
	cltq
	leaq	(%rax,%rax,2), %rsi
	salq	$6, %rsi
	addq	-72(%rbp), %rsi
	call	add_tw_niels_to_tw_extensible@PLT
	movl	8(%rbx), %eax
	leal	1(%r13), %edx
	testl	%eax, %eax
	js	.L384
.L394:
	addq	$8, %r14
	cmpl	%edx, -76(%rbp)
	jl	.L413
	movslq	%edx, %r13
	jmp	.L404
	.p2align 4,,10
	.p2align 3
.L392:
	negl	%eax
	movq	%r12, %rdi
	sarl	%eax
	cltq
	leaq	(%rax,%rax,2), %rsi
	salq	$6, %rsi
	addq	-72(%rbp), %rsi
	call	sub_tw_niels_from_tw_extensible@PLT
	movl	8(%rbx), %eax
	leal	1(%r13), %edx
	testl	%eax, %eax
	jns	.L394
.L384:
	movl	(%r15,%r13,8), %ebx
	testl	%ebx, %ebx
	je	.L397
	.p2align 4,,10
	.p2align 3
.L400:
	movq	%r12, %rdi
	call	double_tw_extensible@PLT
	subl	$1, %ebx
	jne	.L400
.L397:
	movq	-88(%rbp), %rsp
.L379:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L414
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L380:
	.cfi_restore_state
	movq	%r12, %rdi
	call	set_identity_tw_extensible@PLT
	movq	-88(%rbp), %rsp
	jmp	.L379
.L411:
	xorl	%r13d, %r13d
	jmp	.L384
.L412:
	leaq	__PRETTY_FUNCTION__.28191(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC22(%rip), %rdi
	movl	$802, %edx
	call	__assert_fail@PLT
.L414:
	call	__stack_chk_fail@PLT
.L413:
	leaq	__PRETTY_FUNCTION__.28191(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC23(%rip), %rdi
	movl	$797, %edx
	call	__assert_fail@PLT
.L410:
	leaq	__PRETTY_FUNCTION__.28191(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC21(%rip), %rdi
	movl	$788, %edx
	call	__assert_fail@PLT
.L409:
	leaq	__PRETTY_FUNCTION__.28191(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC20(%rip), %rdi
	movl	$787, %edx
	call	__assert_fail@PLT
	.cfi_endproc
.LFE4682:
	.size	scalarmul_fixed_base_wnaf_vt, .-scalarmul_fixed_base_wnaf_vt
	.section	.text.unlikely.scalarmul_fixed_base_wnaf_vt
.LCOLDE25:
	.section	.text.scalarmul_fixed_base_wnaf_vt
.LHOTE25:
	.section	.rodata.str1.1
.LC26:
	.string	"control_var[contv].addend"
.LC27:
	.string	"control_pre[contp].addend"
.LC28:
	.string	"contv == ncb_var"
.LC29:
	.string	"contp == ncb_pre"
	.section	.text.unlikely.linear_combo_var_fixed_vt,"ax",@progbits
.LCOLDB30:
	.section	.text.linear_combo_var_fixed_vt,"ax",@progbits
.LHOTB30:
	.p2align 4,,15
	.globl	linear_combo_var_fixed_vt
	.hidden	linear_combo_var_fixed_vt
	.type	linear_combo_var_fixed_vt, @function
linear_combo_var_fixed_vt:
.LFB4683:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movl	%r8d, %r11d
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
	movq	%rdi, %r13
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	movl	%edx, %edi
	movl	$-858993459, %edx
	movq	%rcx, %r15
	subq	$352, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	(%r10), %r8d
	movq	%r9, -352(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movl	%edi, %eax
	movq	%rsp, -376(%rbp)
	mull	%edx
	leal	1(%r8), %ecx
	shrl	$2, %edx
	leal	3(%rdx), %eax
	movl	%edx, %r12d
	xorl	%edx, %edx
	leaq	18(,%rax,8), %rax
	shrq	$4, %rax
	salq	$4, %rax
	subq	%rax, %rsp
	movl	$2, %eax
	shrx	%rax, %rsp, %rax
	movq	%rax, -368(%rbp)
	leaq	0(,%rax,4), %r14
	movl	%r11d, %eax
	divl	%ecx
	movl	%edi, %ecx
	addl	$3, %eax
	leaq	18(,%rax,8), %rax
	shrq	$4, %rax
	salq	$4, %rax
	subq	%rax, %rsp
	movl	$2, %eax
	shrx	%rax, %rsp, %rax
	movq	%rax, -360(%rbp)
	salq	$2, %rax
	subl	$1, %ecx
	movq	%rax, -344(%rbp)
	js	.L444
	leal	2(%r12), %r9d
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L420:
	movl	%ecx, %eax
	sarl	$6, %eax
	cltq
	movq	(%rsi,%rax,8), %rax
	shrq	%cl, %rax
	andl	$1, %eax
	leal	(%rax,%rdi,2), %edi
	leal	32(%rdi), %eax
	cmpl	$63, %eax
	jbe	.L417
	leal	1(%rdi), %eax
	andl	$1, %edi
	movl	%ecx, %edx
	negl	%edi
	sarl	%eax
	testb	$1, %al
	jne	.L418
	.p2align 4,,10
	.p2align 3
.L419:
	sarl	%eax
	addl	$1, %edx
	testb	$1, %al
	je	.L419
.L418:
	movl	%ebx, %r10d
	addl	$1, %ebx
	addl	$1, %edx
	leaq	(%r14,%r10,8), %r10
	cmpl	%r9d, %ebx
	movl	%edx, (%r10)
	movl	%eax, 4(%r10)
	ja	.L463
.L417:
	subl	$1, %ecx
	cmpl	$-1, %ecx
	jne	.L420
	testl	%edi, %edi
	je	.L462
	xorl	%eax, %eax
	testb	$1, %dil
	jne	.L422
	.p2align 4,,10
	.p2align 3
.L423:
	sarl	%edi
	addl	$1, %eax
	testb	$1, %dil
	je	.L423
.L422:
	movl	%ebx, %edx
	addl	$2, %r12d
	addl	$1, %ebx
	leaq	(%r14,%rdx,8), %rdx
	cmpl	%r12d, %ebx
	movl	%eax, (%rdx)
	movl	%edi, 4(%rdx)
	ja	.L424
.L462:
	movl	%ebx, %eax
	movl	%ebx, -380(%rbp)
	salq	$3, %rax
.L416:
	movq	-344(%rbp), %rdi
	addq	%r14, %rax
	movl	%r8d, %ecx
	movl	%r11d, %edx
	movq	%r15, %rsi
	movl	$-1, (%rax)
	movl	$0, 4(%rax)
	leaq	-336(%rbp), %r15
	call	recode_wnaf
	subq	$4128, %rsp
	movl	%eax, -384(%rbp)
	movq	%r13, %rsi
	leaq	31(%rsp), %rax
	andq	$-32, %rax
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	convert_tw_extensible_to_tw_pniels@PLT
	movq	%r13, %rdi
	leaq	512(%rbx), %r12
	call	double_tw_extensible@PLT
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	convert_tw_extensible_to_tw_pniels@PLT
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	add_tw_pniels_to_tw_extensible@PLT
	leaq	256(%rbx), %rdi
	movq	%r13, %rsi
	call	convert_tw_extensible_to_tw_pniels@PLT
	leaq	4096(%rbx), %rax
	movq	%r14, -392(%rbp)
	movq	%rax, %r14
	.p2align 4,,10
	.p2align 3
.L425:
	movq	%r15, %rsi
	movq	%r13, %rdi
	call	add_tw_pniels_to_tw_extensible@PLT
	movq	%r12, %rdi
	movq	%r13, %rsi
	addq	$256, %r12
	call	convert_tw_extensible_to_tw_pniels@PLT
	cmpq	%r12, %r14
	jne	.L425
	movq	-368(%rbp), %rax
	movq	-392(%rbp), %r14
	movl	0(,%rax,4), %r12d
	movq	-360(%rbp), %rax
	movl	0(,%rax,4), %r15d
	cmpl	%r15d, %r12d
	jg	.L464
	testl	%r12d, %r12d
	js	.L428
	cmpl	%r15d, %r12d
	jne	.L428
	movq	-368(%rbp), %rax
	movq	%r13, %rdi
	movl	%r12d, %r15d
	movl	$1, %r12d
	movl	4(,%rax,4), %esi
	sarl	%esi
	movslq	%esi, %rsi
	salq	$8, %rsi
	addq	%rbx, %rsi
	call	convert_tw_pniels_to_tw_extensible@PLT
	movq	-360(%rbp), %rax
	movq	%r13, %rdi
	movl	4(,%rax,4), %eax
	sarl	%eax
	cltq
	leaq	(%rax,%rax,2), %rsi
	salq	$6, %rsi
	addq	-352(%rbp), %rsi
	call	add_tw_niels_to_tw_extensible@PLT
	movl	$1, %eax
	jmp	.L429
.L428:
	movl	4(,%rax,4), %eax
	movq	%r13, %rdi
	movl	$1, %r12d
	sarl	%eax
	cltq
	leaq	(%rax,%rax,2), %rsi
	salq	$6, %rsi
	addq	-352(%rbp), %rsi
	call	convert_tw_niels_to_tw_extensible@PLT
	xorl	%eax, %eax
	testl	%r15d, %r15d
	js	.L465
.L429:
	subl	$1, %r15d
	cmpl	$-1, %r15d
	je	.L431
	movq	%rbx, -360(%rbp)
	movl	%eax, %ebx
	jmp	.L440
	.p2align 4,,10
	.p2align 3
.L432:
	movq	-344(%rbp), %rax
	movslq	%r12d, %rdx
	leaq	(%rax,%rdx,8), %rdx
	cmpl	%r15d, (%rdx)
	je	.L466
	subl	$1, %r15d
	cmpl	$-1, %r15d
	je	.L467
.L440:
	movq	%r13, %rdi
	call	double_tw_extensible@PLT
	movslq	%ebx, %rdx
	leaq	(%r14,%rdx,8), %rdx
	cmpl	%r15d, (%rdx)
	jne	.L432
	movl	4(%rdx), %edx
	cmpl	$0, %edx
	je	.L468
	jle	.L434
	movl	%edx, %esi
	movq	%r13, %rdi
	sarl	%esi
	movslq	%esi, %rsi
	salq	$8, %rsi
	addq	-360(%rbp), %rsi
	call	add_tw_pniels_to_tw_extensible@PLT
.L435:
	addl	$1, %ebx
	jmp	.L432
	.p2align 4,,10
	.p2align 3
.L466:
	movl	4(%rdx), %edx
	cmpl	$0, %edx
	je	.L469
	jle	.L438
	sarl	%edx
	movq	%r13, %rdi
	movslq	%edx, %rdx
	leaq	(%rdx,%rdx,2), %rsi
	salq	$6, %rsi
	addq	-352(%rbp), %rsi
	call	add_tw_niels_to_tw_extensible@PLT
.L439:
	subl	$1, %r15d
	addl	$1, %r12d
	cmpl	$-1, %r15d
	jne	.L440
.L467:
	movl	%ebx, %eax
.L431:
	movl	-380(%rbp), %ebx
	cmpl	%ebx, %eax
	jne	.L470
	cmpl	%r12d, -384(%rbp)
	jne	.L471
	movq	-376(%rbp), %rsp
.L415:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L472
	leaq	-48(%rbp), %rsp
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
.L434:
	.cfi_restore_state
	negl	%edx
	movq	%r13, %rdi
	movl	%edx, %esi
	sarl	%esi
	movslq	%esi, %rsi
	salq	$8, %rsi
	addq	-360(%rbp), %rsi
	call	sub_tw_pniels_from_tw_extensible@PLT
	jmp	.L435
	.p2align 4,,10
	.p2align 3
.L438:
	negl	%edx
	movq	%r13, %rdi
	sarl	%edx
	movslq	%edx, %rdx
	leaq	(%rdx,%rdx,2), %rsi
	salq	$6, %rsi
	addq	-352(%rbp), %rsi
	call	sub_tw_niels_from_tw_extensible@PLT
	jmp	.L439
.L464:
	movq	-368(%rbp), %rax
	movl	%r12d, %r15d
	movq	%r13, %rdi
	xorl	%r12d, %r12d
	movl	4(,%rax,4), %esi
	sarl	%esi
	movslq	%esi, %rsi
	salq	$8, %rsi
	addq	%rbx, %rsi
	call	convert_tw_pniels_to_tw_extensible@PLT
	testl	%r15d, %r15d
	movl	$1, %eax
	jns	.L429
.L465:
	movq	%r13, %rdi
	call	set_identity_tw_extensible@PLT
	movq	-376(%rbp), %rsp
	jmp	.L415
.L444:
	movl	$0, -380(%rbp)
	xorl	%eax, %eax
	jmp	.L416
.L469:
	leaq	__PRETTY_FUNCTION__.28221(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC27(%rip), %rdi
	movl	$873, %edx
	call	__assert_fail@PLT
.L471:
	leaq	__PRETTY_FUNCTION__.28221(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC29(%rip), %rdi
	movl	$885, %edx
	call	__assert_fail@PLT
.L424:
	leaq	__PRETTY_FUNCTION__.28150(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	movl	$699, %edx
	call	__assert_fail@PLT
.L468:
	leaq	__PRETTY_FUNCTION__.28221(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	movl	$862, %edx
	call	__assert_fail@PLT
.L470:
	leaq	__PRETTY_FUNCTION__.28221(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	movl	$884, %edx
	call	__assert_fail@PLT
.L463:
	leaq	__PRETTY_FUNCTION__.28150(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	movl	$688, %edx
	call	__assert_fail@PLT
.L472:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4683:
	.size	linear_combo_var_fixed_vt, .-linear_combo_var_fixed_vt
	.section	.text.unlikely.linear_combo_var_fixed_vt
.LCOLDE30:
	.section	.text.linear_combo_var_fixed_vt
.LHOTE30:
	.section	.rodata.__PRETTY_FUNCTION__.28221,"a",@progbits
	.align 16
	.type	__PRETTY_FUNCTION__.28221, @object
	.size	__PRETTY_FUNCTION__.28221, 26
__PRETTY_FUNCTION__.28221:
	.string	"linear_combo_var_fixed_vt"
	.section	.rodata.__PRETTY_FUNCTION__.28191,"a",@progbits
	.align 16
	.type	__PRETTY_FUNCTION__.28191, @object
	.size	__PRETTY_FUNCTION__.28191, 29
__PRETTY_FUNCTION__.28191:
	.string	"scalarmul_fixed_base_wnaf_vt"
	.section	.rodata.__PRETTY_FUNCTION__.28150,"a",@progbits
	.align 8
	.type	__PRETTY_FUNCTION__.28150, @object
	.size	__PRETTY_FUNCTION__.28150, 12
__PRETTY_FUNCTION__.28150:
	.string	"recode_wnaf"
	.section	.rodata.__PRETTY_FUNCTION__.28176,"a",@progbits
	.align 8
	.type	__PRETTY_FUNCTION__.28176, @object
	.size	__PRETTY_FUNCTION__.28176, 13
__PRETTY_FUNCTION__.28176:
	.string	"scalarmul_vt"
	.section	.rodata.__PRETTY_FUNCTION__.28044,"a",@progbits
	.align 16
	.type	__PRETTY_FUNCTION__.28044, @object
	.size	__PRETTY_FUNCTION__.28044, 22
__PRETTY_FUNCTION__.28044:
	.string	"linear_combo_combs_vt"
	.section	.rodata.__PRETTY_FUNCTION__.27911,"a",@progbits
	.align 16
	.type	__PRETTY_FUNCTION__.27911, @object
	.size	__PRETTY_FUNCTION__.27911, 30
__PRETTY_FUNCTION__.27911:
	.string	"convert_to_signed_window_form"
	.section	.rodata.__PRETTY_FUNCTION__.27888,"a",@progbits
	.align 16
	.type	__PRETTY_FUNCTION__.27888, @object
	.size	__PRETTY_FUNCTION__.27888, 18
__PRETTY_FUNCTION__.27888:
	.string	"montgomery_ladder"
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC8:
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.align 32
.LC9:
	.quad	144115188075855870
	.quad	144115188075855870
	.quad	144115188075855870
	.quad	144115188075855870
	.align 32
.LC10:
	.quad	144115188075855868
	.quad	144115188075855870
	.quad	144115188075855870
	.quad	144115188075855870
	.align 32
.LC11:
	.quad	72057594037927935
	.quad	72057594037927935
	.quad	72057594037927935
	.quad	72057594037927935
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
