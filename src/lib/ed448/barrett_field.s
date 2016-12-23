	.file	"barrett_field.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"src/barrett_field.c"
.LC1:
	.string	"nwords_mier <= nwords_accum"
	.section	.text.unlikely.widemac.part.0,"ax",@progbits
.LCOLDB2:
.LHOTB2:
	.type	widemac.part.0, @function
widemac.part.0:
.LFB4639:
	.cfi_startproc
	leaq	__PRETTY_FUNCTION__.27344(%rip), %rcx
	pushq	%rax
	.cfi_def_cfa_offset 16
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	movl	$78, %edx
	call	__assert_fail@PLT
	.cfi_endproc
.LFE4639:
	.size	widemac.part.0, .-widemac.part.0
.LCOLDE2:
.LHOTE2:
	.section	.text.unlikely.add_nr_ext_packed,"ax",@progbits
.LCOLDB3:
	.section	.text.add_nr_ext_packed,"ax",@progbits
.LHOTB3:
	.p2align 4,,15
	.globl	add_nr_ext_packed
	.hidden	add_nr_ext_packed
	.type	add_nr_ext_packed, @function
add_nr_ext_packed:
.LFB4629:
	.cfi_startproc
	testl	%r8d, %r8d
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%edx, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
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
	je	.L8
	movq	%rcx, %rbp
	xorl	%r10d, %r10d
	xorl	%eax, %eax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%r9, %rbx
	andq	0(%rbp,%r10,8), %rbx
	movq	(%rsi,%r10,8), %r13
	xorl	%r12d, %r12d
	xorl	%r14d, %r14d
	movq	%rbx, %rcx
	movq	%r12, %rbx
	addq	%r13, %rcx
	adcq	%r14, %rbx
	addq	%rcx, %rax
	adcq	%rbx, %rdx
	movq	%rax, (%rdi,%r10,8)
	addq	$1, %r10
	movq	%rdx, %rax
	xorl	%edx, %edx
	cmpl	%r10d, %r8d
	ja	.L5
.L4:
	cmpl	%r8d, %r15d
	jbe	.L11
	.p2align 4,,10
	.p2align 3
.L7:
	movl	%r8d, %r9d
	xorl	%ebx, %ebx
	movq	(%rsi,%r9,8), %rcx
	addq	%rcx, %rax
	adcq	%rbx, %rdx
	addl	$1, %r8d
	movq	%rax, (%rdi,%r9,8)
	movq	%rdx, %rax
	xorl	%edx, %edx
	cmpl	%r8d, %r15d
	jne	.L7
.L11:
	popq	%rbx
	.cfi_remember_state
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
.L8:
	.cfi_restore_state
	xorl	%eax, %eax
	xorl	%edx, %edx
	jmp	.L4
	.cfi_endproc
.LFE4629:
	.size	add_nr_ext_packed, .-add_nr_ext_packed
	.section	.text.unlikely.add_nr_ext_packed
.LCOLDE3:
	.section	.text.add_nr_ext_packed
.LHOTE3:
	.section	.text.unlikely.sub_nr_ext_packed,"ax",@progbits
.LCOLDB4:
	.section	.text.sub_nr_ext_packed,"ax",@progbits
.LHOTB4:
	.p2align 4,,15
	.globl	sub_nr_ext_packed
	.hidden	sub_nr_ext_packed
	.type	sub_nr_ext_packed, @function
sub_nr_ext_packed:
.LFB4631:
	.cfi_startproc
	testl	%r8d, %r8d
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	%edx, %ebx
	je	.L19
	movq	%rcx, %r10
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L16:
	movq	(%rsi,%rcx,8), %r13
	xorl	%r14d, %r14d
	movq	%r9, %r15
	movq	$0, -8(%rsp)
	addq	%r13, %rax
	adcq	%r14, %rdx
	andq	(%r10,%rcx,8), %r15
	movq	%r15, -16(%rsp)
	subq	-16(%rsp), %rax
	sbbq	-8(%rsp), %rdx
	movq	%rax, (%rdi,%rcx,8)
	addq	$1, %rcx
	movq	%rdx, %rax
	sarq	$63, %rdx
	cmpl	%ecx, %r8d
	ja	.L16
.L15:
	cmpl	%r8d, %ebx
	jbe	.L22
	.p2align 4,,10
	.p2align 3
.L18:
	movl	%r8d, %ecx
	xorl	%r12d, %r12d
	movq	(%rsi,%rcx,8), %r11
	addq	%r11, %rax
	adcq	%r12, %rdx
	addl	$1, %r8d
	movq	%rax, (%rdi,%rcx,8)
	movq	%rdx, %rax
	sarq	$63, %rdx
	cmpl	%r8d, %ebx
	jne	.L18
.L22:
	popq	%rbx
	.cfi_remember_state
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
	xorl	%eax, %eax
	xorl	%edx, %edx
	jmp	.L15
	.cfi_endproc
.LFE4631:
	.size	sub_nr_ext_packed, .-sub_nr_ext_packed
	.section	.text.unlikely.sub_nr_ext_packed
.LCOLDE4:
	.section	.text.sub_nr_ext_packed
.LHOTE4:
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC5:
	.string	"a_carry < ((word_t)1) << prime->p_shift"
	.section	.rodata.str1.1
.LC6:
	.string	"nwords_a >= prime->nwords_p"
.LC7:
	.string	"prime->nwords_p > 0"
.LC8:
	.string	"!carry"
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"nwords_left_in_a == prime->nwords_p-1"
	.section	.text.unlikely.barrett_reduce,"ax",@progbits
.LCOLDB10:
	.section	.text.barrett_reduce,"ax",@progbits
.LHOTB10:
	.p2align 4,,15
	.globl	barrett_reduce
	.hidden	barrett_reduce
	.type	barrett_reduce, @function
barrett_reduce:
.LFB4634:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
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
	movq	%rdx, %rbx
	subq	$200, %rsp
	.cfi_def_cfa_offset 256
	movl	4(%rcx), %eax
	movq	%rdx, 88(%rsp)
	movl	$1, %edx
	movq	%rdi, 40(%rsp)
	movl	%esi, 84(%rsp)
	shlx	%rax, %rdx, %rdx
	cmpq	%rbx, %rdx
	jbe	.L83
	movl	(%rcx), %edx
	cmpl	%edx, 84(%rsp)
	jb	.L84
	testl	%edx, %edx
	je	.L27
	movl	%esi, 80(%rsp)
	movl	80(%rsp), %esi
	movq	%r9, %rbx
	movq	%rcx, 32(%rsp)
	movq	%rdi, %r15
	movq	%r8, %rcx
	.p2align 4,,10
	.p2align 3
.L28:
	leal	-1(%rsi), %edx
	movl	$0, 64(%rsp)
	leaq	(%r15,%rdx,8), %rdi
	movl	%edx, 68(%rsp)
	movl	%esi, %edx
	movq	%rdx, 56(%rsp)
	movq	%rdi, 48(%rsp)
	leaq	(%r15,%rdx,8), %rdi
	movq	%rdi, 72(%rsp)
.L39:
	movq	48(%rsp), %rdi
	movq	(%rdi), %rsi
	shrx	%rax, %rsi, %rdx
	movq	%rdx, %r10
	movl	$1, %edx
	shlx	%rax, %rdx, %rdx
	leaq	-1(%rdx), %rax
	andq	%rsi, %rax
	testb	$1, 64(%rsp)
	movq	%rax, (%rdi)
	movq	32(%rsp), %rax
	movl	4(%rax), %eax
	jne	.L29
	testl	%eax, %eax
	jne	.L85
.L29:
	movq	32(%rsp), %rax
	movq	56(%rsp), %rdx
	movl	8(%rax), %edi
	movq	16(%rax), %r15
	movl	(%rax), %eax
	subq	%rax, %rdx
	movq	%rax, %rbp
	movq	%rdx, %rax
	movq	40(%rsp), %rdx
	cmpl	%ebp, %edi
	leaq	(%rdx,%rax,8), %r8
	ja	.L31
	xorl	%esi, %esi
	xorl	%r9d, %r9d
	testl	%edi, %edi
	je	.L86
	movq	%rbx, 24(%rsp)
	movq	%r9, %rax
	movl	%ebp, %ebx
	movq	%rcx, 16(%rsp)
	movq	%r15, %rbp
	movq	%r10, %r15
	.p2align 4,,10
	.p2align 3
.L65:
	movq	(%r8,%rsi,8), %r11
	movq	%r15, %rdx
	xorl	%r12d, %r12d
	movq	%rax, %r13
	mulx	0(%rbp,%rsi,8), %r9, %r10
	xorl	%r14d, %r14d
	movq	%r12, %rdx
	movq	%r11, %rax
	addq	%r13, %rax
	adcq	%r14, %rdx
	addq	%r9, %rax
	adcq	%r10, %rdx
	movq	%rax, (%r8,%rsi,8)
	addq	$1, %rsi
	cmpl	%esi, %edi
	movq	%rdx, %rax
	ja	.L65
	movl	%ebx, %ebp
	movq	%rdx, %r9
	movq	16(%rsp), %rcx
	cmpl	%ebp, %edi
	movq	24(%rsp), %rbx
	jnb	.L35
	.p2align 4,,10
	.p2align 3
.L36:
	movl	%edi, %esi
	xorl	%ebx, %ebx
	xorl	%edx, %edx
	leaq	(%r8,%rsi,8), %r10
	movq	%r9, %rcx
	movq	(%r10), %rsi
	leaq	(%rsi,%r9), %r15
	addq	%rsi, %r9
	movq	%r15, (%r10)
	movq	%rbx, %r10
	adcq	%rdx, %r10
	addl	$1, %edi
	cmpl	%edi, %ebp
	movq	%r10, %r9
	ja	.L36
	movq	%rsi, (%rsp)
	movq	%rdx, 8(%rsp)
.L35:
	testq	%r9, %r9
	jne	.L87
.L37:
	addl	$1, 64(%rsp)
	movl	64(%rsp), %eax
	cmpl	$2, %eax
	je	.L38
	movq	32(%rsp), %rax
	movl	4(%rax), %eax
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L38:
	movq	32(%rsp), %rdi
	movl	68(%rsp), %edx
	movl	(%rdi), %eax
	cmpl	%edx, %eax
	ja	.L40
	movl	4(%rdi), %eax
	movl	%edx, 80(%rsp)
	movl	%edx, %esi
	movq	40(%rsp), %r15
	jmp	.L28
.L86:
	testl	%ebp, %ebp
	jne	.L36
	jmp	.L37
.L40:
	leal	-1(%rax), %edx
	cmpl	68(%rsp), %edx
	movq	%rdi, %r15
	jne	.L88
	movl	8(%rdi), %r8d
	movq	16(%rdi), %r9
	testl	%r8d, %r8d
	je	.L53
	movq	40(%rsp), %r10
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L43:
	movq	(%r10,%rdx,8), %rsi
	movq	(%r9,%rdx,8), %r11
	xorl	%edi, %edi
	xorl	%r12d, %r12d
	movq	%rdi, %r14
	movq	%rsi, %r13
	addq	%r11, %r13
	adcq	%r12, %r14
	addq	%r13, %rcx
	adcq	%r14, %rbx
	movq	%rcx, (%r10,%rdx,8)
	addq	$1, %rdx
	movq	%rbx, %rcx
	xorl	%ebx, %ebx
	cmpl	%edx, %r8d
	ja	.L43
	cmpl	%r8d, %eax
	movq	40(%rsp), %r9
	jbe	.L44
	.p2align 4,,10
	.p2align 3
.L45:
	movl	%r8d, %edx
	xorl	%edi, %edi
	leaq	(%r9,%rdx,8), %rdx
	movq	(%rdx), %rsi
	addq	%rsi, %rcx
	adcq	%rdi, %rbx
	addl	$1, %r8d
	movq	%rcx, (%rdx)
	movq	%rbx, %rcx
	xorl	%ebx, %ebx
	cmpl	%r8d, %eax
	jne	.L45
.L44:
	movl	4(%r15), %eax
	testl	%eax, %eax
	je	.L46
	movl	$64, %edx
	movq	40(%rsp), %rbx
	subl	%eax, %edx
	shlx	%rdx, %rcx, %rcx
	movl	(%r15), %edx
	subl	$1, %edx
	leaq	(%rbx,%rdx,8), %rdi
	movq	(%rdi), %rsi
	shrx	%rax, %rsi, %rdx
	addq	%rdx, %rcx
	movl	$1, %edx
	shlx	%rax, %rdx, %rax
	subq	$1, %rax
	andq	%rsi, %rax
	movq	%rax, (%rdi)
.L46:
	movl	8(%r15), %edi
	subq	$1, %rcx
	movq	16(%r15), %r9
	movl	(%r15), %r8d
	testl	%edi, %edi
	je	.L54
	movq	40(%rsp), %r10
	xorl	%esi, %esi
	xorl	%eax, %eax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L48:
	movq	(%r10,%rsi,8), %r11
	xorl	%r12d, %r12d
	movq	%rcx, %rbx
	addq	%r11, %rax
	adcq	%r12, %rdx
	andq	(%r9,%rsi,8), %rbx
	xorl	%r14d, %r14d
	subq	%rbx, %rax
	sbbq	%r14, %rdx
	movq	%rax, (%r10,%rsi,8)
	addq	$1, %rsi
	movq	%rdx, %rax
	sarq	$63, %rdx
	cmpl	%esi, %edi
	ja	.L48
.L47:
	cmpl	%edi, %r8d
	jbe	.L80
	movq	40(%rsp), %r9
	.p2align 4,,10
	.p2align 3
.L64:
	movl	%edi, %esi
	xorl	%ebx, %ebx
	leaq	(%r9,%rsi,8), %rsi
	movq	(%rsi), %rcx
	addq	%rcx, %rax
	adcq	%rbx, %rdx
	addl	$1, %edi
	movq	%rax, (%rsi)
	movq	%rdx, %rax
	sarq	$63, %rdx
	cmpl	%edi, %r8d
	jne	.L64
.L80:
	addq	$200, %rsp
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
.L53:
	.cfi_restore_state
	xorl	%ecx, %ecx
	xorl	%ebx, %ebx
	movq	40(%rsp), %r9
	jmp	.L45
.L54:
	xorl	%eax, %eax
	xorl	%edx, %edx
	jmp	.L47
.L83:
	leaq	__PRETTY_FUNCTION__.27378(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	movl	$145, %edx
	call	__assert_fail@PLT
.L88:
	leaq	__PRETTY_FUNCTION__.27378(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC9(%rip), %rdi
	movl	$179, %edx
	call	__assert_fail@PLT
.L87:
	leaq	__PRETTY_FUNCTION__.27378(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	movl	$174, %edx
	call	__assert_fail@PLT
.L31:
	call	widemac.part.0
.L85:
	movl	$64, %edi
	movl	80(%rsp), %edx
	subl	%eax, %edi
	cmpl	%edx, 84(%rsp)
	movl	%edi, %eax
	jbe	.L30
	movq	72(%rsp), %rdi
	movq	(%rdi), %rdx
	movq	$0, (%rdi)
	shlx	%rax, %rdx, %rax
	movq	%rdx, 16(%rsp)
	movq	%r10, %rdx
	orq	%rax, %rdx
	movq	%rdx, %r10
	jmp	.L29
.L27:
	leaq	__PRETTY_FUNCTION__.27378(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	movl	$147, %edx
	call	__assert_fail@PLT
.L84:
	leaq	__PRETTY_FUNCTION__.27378(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	movl	$146, %edx
	call	__assert_fail@PLT
.L30:
	shlx	%rax, 88(%rsp), %rax
	movq	%r10, %rdi
	orq	%rax, %rdi
	movq	%rdi, %r10
	jmp	.L29
	.cfi_endproc
.LFE4634:
	.size	barrett_reduce, .-barrett_reduce
	.section	.text.unlikely.barrett_reduce
.LCOLDE10:
	.section	.text.barrett_reduce
.LHOTE10:
	.section	.rodata.str1.1
.LC11:
	.string	"!a[i]"
.LC12:
	.string	"!(carry>>WORD_BITS)"
	.section	.text.unlikely.barrett_negate,"ax",@progbits
.LCOLDB13:
	.section	.text.barrett_negate,"ax",@progbits
.LHOTB13:
	.p2align 4,,15
	.globl	barrett_negate
	.hidden	barrett_negate
	.type	barrett_negate, @function
barrett_negate:
.LFB4633:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %rcx
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%esi, %r15d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %rbp
	xorl	%edx, %edx
	movq	%rdi, %rbx
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	%r11, 16(%rsp)
	movq	%r12, 24(%rsp)
	movq	%r9, (%rsp)
	movq	%r10, 8(%rsp)
	call	barrett_reduce
	movl	8(%rbp), %ecx
	xorl	%esi, %esi
	xorl	%edi, %edi
	xorl	%eax, %eax
	testl	%ecx, %ecx
	je	.L90
	.p2align 4,,10
	.p2align 3
.L91:
	movq	16(%rbp), %rcx
	movl	%eax, %edx
	xorl	%r10d, %r10d
	movq	(%rcx,%rdx,8), %r9
	leaq	(%rbx,%rdx,8), %rdx
	movq	(%rdx), %r11
	subq	%r9, %rsi
	sbbq	%r10, %rdi
	xorl	%r12d, %r12d
	subq	%r11, %rsi
	sbbq	%r12, %rdi
	movq	%rsi, (%rdx)
	addl	$1, %eax
	movq	%rdi, %rsi
	sarq	$63, %rdi
	cmpl	%eax, 8(%rbp)
	ja	.L91
.L90:
	movl	0(%rbp), %r9d
	cmpl	%r9d, %eax
	jnb	.L111
	.p2align 4,,10
	.p2align 3
.L104:
	movl	%eax, %edx
	xorl	%r14d, %r14d
	leaq	(%rbx,%rdx,8), %rdx
	movq	(%rdx), %r13
	subq	%r13, %rsi
	movq	%rsi, (%rdx)
	movl	0(%rbp), %r8d
	sbbq	%r14, %rdi
	movq	%rdi, %rcx
	movq	%rdi, %rdx
	sarq	$63, %rcx
	leal	-1(%r8), %r9d
	cmpl	%eax, %r9d
	ja	.L95
	movq	%rsi, %rdx
	movq	%rdi, %rcx
.L95:
	addl	$1, %eax
	movq	%rdx, %rsi
	movq	%rcx, %rdi
	cmpl	%eax, %r8d
	ja	.L104
.L93:
	movl	4(%rbp), %edx
	movl	$1, %ecx
	xorl	%r12d, %r12d
	shlx	%rdx, %rcx, %r11
	addq	%r11, %rsi
	adcq	%r12, %rdi
	cmpl	%eax, %r15d
	movq	%rsi, (%rbx,%r9,8)
	jbe	.L97
	.p2align 4,,10
	.p2align 3
.L101:
	movl	%eax, %edx
	cmpq	$0, (%rbx,%rdx,8)
	jne	.L112
	addl	$1, %eax
	cmpl	%eax, %r15d
	ja	.L101
.L97:
	movq	%rdi, %rdx
	sarq	$63, %rdx
	orq	%rdi, %rdx
	jne	.L113
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
.L111:
	.cfi_restore_state
	subl	$1, %r9d
	jmp	.L93
.L112:
	leaq	__PRETTY_FUNCTION__.27366(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC11(%rip), %rdi
	movl	$129, %edx
	call	__assert_fail@PLT
.L113:
	leaq	__PRETTY_FUNCTION__.27366(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC12(%rip), %rdi
	movl	$132, %edx
	call	__assert_fail@PLT
	.cfi_endproc
.LFE4633:
	.size	barrett_negate, .-barrett_negate
	.section	.text.unlikely.barrett_negate
.LCOLDE13:
	.section	.text.barrett_negate
.LHOTE13:
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"nwords_accum >= prime->nwords_p"
	.section	.rodata.str1.1
.LC15:
	.string	"nwords_tmp > 0"
.LC16:
	.string	"tmp[nwords_tmp-1] == 0"
.LC17:
	.string	"tmp[i] == 0"
	.section	.text.unlikely.barrett_mul_or_mac,"ax",@progbits
.LCOLDB18:
	.section	.text.barrett_mul_or_mac,"ax",@progbits
.LHOTB18:
	.p2align 4,,15
	.globl	barrett_mul_or_mac
	.hidden	barrett_mul_or_mac
	.type	barrett_mul_or_mac, @function
barrett_mul_or_mac:
.LFB4635:
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
	pushq	%rbx
	subq	$216, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	16(%rbp), %rax
	movq	%rdi, -216(%rbp)
	movq	%fs:40, %rdi
	movq	%rdi, -56(%rbp)
	xorl	%edi, %edi
	movl	%esi, -204(%rbp)
	movq	%r8, -80(%rbp)
	movq	%rax, -96(%rbp)
	movl	(%rax), %eax
	cmpl	%esi, %eax
	ja	.L178
	cmpl	%ecx, %eax
	movl	%ecx, %r12d
	cmovb	%ecx, %eax
	addl	$1, %eax
	movl	%eax, %r8d
	je	.L179
	cmpl	%r8d, %esi
	movq	%rdx, %r15
	jbe	.L117
	cmpq	$0, 24(%rbp)
	cmovne	%esi, %r8d
.L117:
	movl	%r8d, %eax
	leal	-1(%r8), %ecx
	xorl	%esi, %esi
	leaq	22(,%rax,8), %rax
	movq	%r10, -160(%rbp)
	movq	%r11, -152(%rbp)
	leaq	8(,%rcx,8), %rdx
	movl	%r9d, -68(%rbp)
	movl	%r8d, -112(%rbp)
	shrq	$4, %rax
	movq	%rcx, -88(%rbp)
	salq	$4, %rax
	subq	%rax, %rsp
	movq	%rsp, %rdi
	movq	%rsp, %rbx
	call	memset@PLT
	movl	-68(%rbp), %r9d
	movq	-88(%rbp), %rcx
	movl	-112(%rbp), %r8d
	movq	-160(%rbp), %r10
	movq	-152(%rbp), %r11
	subl	$1, %r9d
	movl	%r9d, -68(%rbp)
	js	.L136
	leaq	(%rsp,%rcx,8), %rax
	cmpq	$0, (%rax)
	movq	%rax, -168(%rbp)
	jne	.L123
	leal	-2(%r8), %eax
	movq	-80(%rbp), %rdi
	movq	%r15, -200(%rbp)
	movl	%r8d, -80(%rbp)
	movl	%r12d, %r15d
	movq	%r10, -112(%rbp)
	movl	%eax, %ecx
	movl	%eax, -72(%rbp)
	movslq	-68(%rbp), %rax
	movq	%rsp, %r12
	movq	%r11, -104(%rbp)
	leaq	(%rdi,%rax,8), %rax
	movq	%rax, -88(%rbp)
	movl	%ecx, %eax
	leaq	8(,%rax,8), %rdx
	leal	-3(%r8), %eax
	cmpl	$-1, %eax
	movl	$8, %eax
	cmovge	%rdx, %rax
	movq	%rax, %rdi
	movq	%rax, -192(%rbp)
	movslq	%ecx, %rax
	salq	$3, %rax
	leaq	16(%rax), %rdx
	addq	$8, %rax
	subq	%rdi, %rax
	subq	%rdi, %rdx
	addq	%rsp, %rax
	leaq	(%rsp,%rdx), %rcx
	movq	%rax, -184(%rbp)
	movq	%rcx, -176(%rbp)
	.p2align 4,,10
	.p2align 3
.L124:
	movl	-72(%rbp), %edi
	testl	%edi, %edi
	js	.L128
	movq	-192(%rbp), %rdx
	movq	-184(%rbp), %rsi
	movq	-176(%rbp), %rdi
	call	memmove@PLT
.L128:
	cmpl	%r15d, -80(%rbp)
	movq	-88(%rbp), %rax
	movq	$0, (%r12)
	movq	(%rax), %rdi
	jb	.L180
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	testl	%r15d, %r15d
	movl	-80(%rbp), %ebx
	je	.L133
	movl	%r15d, %r11d
	movq	-200(%rbp), %r15
	movq	%r14, -152(%rbp)
	movq	%rcx, %rax
	movq	%r13, -160(%rbp)
	movq	%r12, %r14
	.p2align 4,,10
	.p2align 3
.L160:
	movq	(%r14,%rsi,8), %r8
	movq	%rdi, %rdx
	xorl	%r9d, %r9d
	movq	%rax, %r12
	mulx	(%r15,%rsi,8), %rcx, %rbx
	xorl	%r13d, %r13d
	movq	%r9, %rdx
	movq	%r8, %rax
	addq	%r12, %rax
	adcq	%r13, %rdx
	addq	%rcx, %rax
	adcq	%rbx, %rdx
	movq	%rax, (%r14,%rsi,8)
	addq	$1, %rsi
	cmpl	%esi, %r11d
	movq	%rdx, %rax
	ja	.L160
	movl	-80(%rbp), %eax
	movq	%r12, -144(%rbp)
	movq	%rdx, %rcx
	movq	%r13, -136(%rbp)
	movq	%r14, %r12
	movl	%r11d, %r15d
	movq	%r8, -128(%rbp)
	movq	%r9, -120(%rbp)
	cmpl	%r11d, %eax
	movq	-160(%rbp), %r13
	movq	-152(%rbp), %r14
	jbe	.L132
	movl	%r11d, %esi
	movl	%eax, %ebx
	.p2align 4,,10
	.p2align 3
.L133:
	movl	%esi, %eax
	xorl	%r11d, %r11d
	xorl	%r14d, %r14d
	leaq	(%r12,%rax,8), %rdx
	movq	%rcx, %r10
	movq	(%rdx), %rax
	leaq	(%rax,%rcx), %rdi
	movq	%rax, %r13
	movq	%rcx, %rax
	addq	%r13, %rax
	movq	%rdi, (%rdx)
	movq	%r11, %rdx
	adcq	%r14, %rdx
	addl	$1, %esi
	cmpl	%esi, %ebx
	movq	%rdx, %rcx
	ja	.L133
	movq	%r10, -112(%rbp)
	movq	%r11, -104(%rbp)
.L132:
	testq	%rcx, %rcx
	jne	.L181
	movq	-96(%rbp), %rcx
	movl	-80(%rbp), %esi
	xorl	%edx, %edx
	movq	%r12, %rdi
	call	barrett_reduce
	subl	$1, -68(%rbp)
	movl	-68(%rbp), %eax
	cmpl	$-1, %eax
	je	.L182
	movq	-168(%rbp), %rax
	subq	$8, -88(%rbp)
	cmpq	$0, (%rax)
	je	.L124
.L123:
	leaq	__PRETTY_FUNCTION__.27398(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC16(%rip), %rdi
	movl	$227, %edx
	call	__assert_fail@PLT
	.p2align 4,,10
	.p2align 3
.L182:
	movl	-80(%rbp), %r8d
	movq	%r12, %rbx
.L136:
	cmpq	$0, 24(%rbp)
	je	.L121
	movl	-204(%rbp), %r14d
	testl	%r14d, %r14d
	je	.L152
	movq	-216(%rbp), %r13
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L138:
	movq	(%rbx,%rcx,8), %rsi
	movq	0(%r13,%rcx,8), %r9
	xorl	%edi, %edi
	xorl	%r10d, %r10d
	movq	%rdi, %r12
	movq	%rsi, %r11
	addq	%r9, %r11
	adcq	%r10, %r12
	addq	%r11, %rax
	adcq	%r12, %rdx
	movq	%rax, (%rbx,%rcx,8)
	addq	$1, %rcx
	movq	%rdx, %rax
	xorl	%edx, %edx
	cmpl	%ecx, %r14d
	ja	.L138
	movq	%rax, %rdx
.L137:
	movq	-96(%rbp), %rcx
	movl	%r8d, %esi
	movq	%rbx, %rdi
	movl	%r8d, -68(%rbp)
	call	barrett_reduce
	movl	-68(%rbp), %r8d
.L121:
	movl	-204(%rbp), %edi
	movl	$0, %eax
	testl	%edi, %edi
	je	.L146
	movq	-216(%rbp), %rsi
	jmp	.L140
	.p2align 4,,10
	.p2align 3
.L183:
	cmpl	%eax, %edi
	jbe	.L175
.L140:
	movl	%eax, %edx
	addl	$1, %eax
	movq	(%rbx,%rdx,8), %rcx
	cmpl	%eax, %r8d
	movq	%rcx, (%rsi,%rdx,8)
	ja	.L183
	cmpl	%eax, %r8d
	jbe	.L184
	.p2align 4,,10
	.p2align 3
.L146:
	movl	%eax, %edx
	cmpq	$0, (%rbx,%rdx,8)
	jne	.L185
	addl	$1, %eax
.L175:
	cmpl	%eax, %r8d
	ja	.L146
.L184:
	movl	-204(%rbp), %ebx
	cmpl	%eax, %ebx
	jbe	.L114
	movq	-216(%rbp), %rcx
	movl	%ebx, %esi
	.p2align 4,,10
	.p2align 3
.L159:
	movl	%eax, %edx
	addl	$1, %eax
	cmpl	%eax, %esi
	movq	$0, (%rcx,%rdx,8)
	jne	.L159
.L114:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L186
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
.L152:
	.cfi_restore_state
	xorl	%edx, %edx
	jmp	.L137
.L179:
	leaq	__PRETTY_FUNCTION__.27398(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC15(%rip), %rdi
	movl	$213, %edx
	call	__assert_fail@PLT
.L185:
	leaq	__PRETTY_FUNCTION__.27398(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC17(%rip), %rdi
	movl	$255, %edx
	call	__assert_fail@PLT
.L178:
	leaq	__PRETTY_FUNCTION__.27398(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC14(%rip), %rdi
	movl	$208, %edx
	call	__assert_fail@PLT
.L186:
	call	__stack_chk_fail@PLT
.L181:
	leaq	__PRETTY_FUNCTION__.27398(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	movl	$239, %edx
	call	__assert_fail@PLT
.L180:
	call	widemac.part.0
	.cfi_endproc
.LFE4635:
	.size	barrett_mul_or_mac, .-barrett_mul_or_mac
	.section	.text.unlikely.barrett_mul_or_mac
.LCOLDE18:
	.section	.text.barrett_mul_or_mac
.LHOTE18:
	.section	.text.unlikely.barrett_deserialize,"ax",@progbits
.LCOLDB19:
	.section	.text.barrett_deserialize,"ax",@progbits
.LHOTB19:
	.p2align 4,,15
	.globl	barrett_deserialize
	.hidden	barrett_deserialize
	.type	barrett_deserialize, @function
barrett_deserialize:
.LFB4636:
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
	movl	(%rdx), %eax
	movl	4(%rdx), %r8d
	sall	$3, %eax
	testl	%r8d, %r8d
	je	.L214
	movl	$64, %ecx
	subl	%r8d, %ecx
	shrl	$3, %ecx
	subl	%ecx, %eax
.L214:
	testl	%eax, %eax
	movl	%eax, %r8d
	je	.L213
	xorl	%eax, %eax
	xorl	%r14d, %r14d
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L199:
	movq	%r14, %r13
	xorl	%r14d, %r14d
	cmpq	%r8, %rax
	jnb	.L205
	leaq	1(%rax), %rbp
	movzbl	(%rsi,%rax), %ecx
	cmpq	%r8, %rbp
	jnb	.L211
	movzbl	1(%rsi,%rax), %ebp
	salq	$8, %rbp
	orq	%rbp, %rcx
	leaq	2(%rax), %rbp
	cmpq	%r8, %rbp
	jnb	.L211
	movzbl	2(%rsi,%rax), %ebp
	salq	$16, %rbp
	orq	%rbp, %rcx
	leaq	3(%rax), %rbp
	cmpq	%r8, %rbp
	jnb	.L211
	movzbl	3(%rsi,%rax), %ebp
	salq	$24, %rbp
	orq	%rbp, %rcx
	leaq	4(%rax), %rbp
	cmpq	%r8, %rbp
	jnb	.L211
	movzbl	4(%rsi,%rax), %ebp
	salq	$32, %rbp
	orq	%rbp, %rcx
	leaq	5(%rax), %rbp
	cmpq	%rbp, %r8
	jbe	.L211
	movzbl	5(%rsi,%rax), %ebp
	salq	$40, %rbp
	orq	%rbp, %rcx
	leaq	6(%rax), %rbp
	cmpq	%rbp, %r8
	jbe	.L211
	movzbl	6(%rsi,%rax), %ebp
	salq	$48, %rbp
	orq	%rbp, %rcx
	leaq	7(%rax), %rbp
	cmpq	%rbp, %r8
	jbe	.L211
	movzbl	7(%rsi,%rax), %ebp
	salq	$56, %rbp
	orq	%rbp, %rcx
.L211:
	movq	%rcx, %r9
	xorl	%r10d, %r10d
.L190:
	addq	%r9, %r13
	movq	%rcx, (%rdi,%rax)
	adcq	%r10, %r14
	cmpl	%ebx, 8(%rdx)
	jbe	.L198
	movq	16(%rdx), %rcx
	xorl	%r12d, %r12d
	movq	(%rcx,%rax), %r11
	addq	%r11, %r13
	adcq	%r12, %r14
.L198:
	leal	1(%rbx), %eax
	movq	%rax, %rbx
	salq	$3, %rax
	cmpq	%r8, %rax
	jb	.L199
	movl	4(%rdx), %ecx
	testl	%ecx, %ecx
	jne	.L215
	movq	%r14, %r13
	xorl	%r14d, %r14d
.L212:
	negq	%r13
	adcq	$0, %r14
	negq	%r14
	movq	%r14, %rax
	sarq	$63, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	notq	%rax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L205:
	.cfi_restore_state
	xorl	%r9d, %r9d
	xorl	%r10d, %r10d
	xorl	%ecx, %ecx
	jmp	.L190
	.p2align 4,,10
	.p2align 3
.L215:
	shrdq	%r14, %r13
	xorl	%edx, %edx
	shrx	%rcx, %r14, %r14
	andl	$64, %ecx
	cmovne	%r14, %r13
	cmovne	%rdx, %r14
	jmp	.L212
.L213:
	popq	%rbx
	.cfi_def_cfa_offset 40
	movq	$-1, %rax
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
.LFE4636:
	.size	barrett_deserialize, .-barrett_deserialize
	.section	.text.unlikely.barrett_deserialize
.LCOLDE19:
	.section	.text.barrett_deserialize
.LHOTE19:
	.section	.rodata.str1.1
.LC20:
	.string	"!tmp[i]"
	.section	.text.unlikely.barrett_deserialize_and_reduce,"ax",@progbits
.LCOLDB21:
	.section	.text.barrett_deserialize_and_reduce,"ax",@progbits
.LHOTB21:
	.p2align 4,,15
	.globl	barrett_deserialize_and_reduce
	.hidden	barrett_deserialize_and_reduce
	.type	barrett_deserialize_and_reduce, @function
barrett_deserialize_and_reduce:
.LFB4637:
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
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_offset 3, -56
	movl	%edx, %ebx
	movq	%rcx, %r15
	subq	$40, %rsp
	movl	(%rcx), %r14d
	movq	%rdi, -72(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	leaq	7(%rbx), %rax
	shrq	$3, %rax
	cmpl	%r14d, %eax
	cmovnb	%eax, %r14d
	xorl	%esi, %esi
	movl	%r14d, %edx
	salq	$3, %rdx
	leaq	22(%rdx), %rax
	shrq	$4, %rax
	salq	$4, %rax
	subq	%rax, %rsp
	movq	%rsp, %rdi
	movq	%rsp, %r13
	call	memset@PLT
	cmpq	$0, %rbx
	movq	-72(%rbp), %r8
	je	.L218
	movl	$0, %eax
	movl	$0, %esi
	ja	.L238
	xorl	%edx, %edx
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L220:
	movq	%rdx, 0(%r13,%rdi,8)
	leal	1(%rsi), %edi
	leaq	0(,%rdi,8), %rax
	movq	%rdi, %rsi
	cmpq	%rax, %rbx
	jbe	.L218
.L231:
	leaq	1(%rax), %rcx
	movzbl	(%r12,%rax), %edx
	cmpq	%rcx, %rbx
	jbe	.L220
	movzbl	1(%r12,%rax), %ecx
	salq	$8, %rcx
	orq	%rcx, %rdx
	leaq	2(%rax), %rcx
	cmpq	%rcx, %rbx
	jbe	.L220
	movzbl	2(%r12,%rax), %ecx
	salq	$16, %rcx
	orq	%rcx, %rdx
	leaq	3(%rax), %rcx
	cmpq	%rcx, %rbx
	jbe	.L220
	movzbl	3(%r12,%rax), %ecx
	salq	$24, %rcx
	orq	%rcx, %rdx
	leaq	4(%rax), %rcx
	cmpq	%rcx, %rbx
	jbe	.L220
	movzbl	4(%r12,%rax), %ecx
	salq	$32, %rcx
	orq	%rcx, %rdx
	leaq	5(%rax), %rcx
	cmpq	%rcx, %rbx
	jbe	.L220
	movzbl	5(%r12,%rax), %ecx
	salq	$40, %rcx
	orq	%rcx, %rdx
	leaq	6(%rax), %rcx
	cmpq	%rcx, %rbx
	jbe	.L220
	movzbl	6(%r12,%rax), %ecx
	salq	$48, %rcx
	orq	%rcx, %rdx
	leaq	7(%rax), %rcx
	cmpq	%rcx, %rbx
	jbe	.L220
	movzbl	7(%r12,%rax), %eax
	salq	$56, %rax
	orq	%rax, %rdx
	jmp	.L220
	.p2align 4,,10
	.p2align 3
.L218:
	xorl	%edx, %edx
	movq	%r15, %rcx
	movl	%r14d, %esi
	movq	%r13, %rdi
	movq	%r8, -72(%rbp)
	call	barrett_reduce
	movl	(%r15), %edx
	xorl	%eax, %eax
	testl	%edx, %edx
	je	.L237
	movq	-72(%rbp), %r8
	.p2align 4,,10
	.p2align 3
.L222:
	movl	%eax, %edx
	addl	$1, %eax
	movq	0(%r13,%rdx,8), %rcx
	movq	%rcx, (%r8,%rdx,8)
	cmpl	%eax, (%r15)
	ja	.L222
	cmpl	%r14d, %eax
	jnb	.L239
	.p2align 4,,10
	.p2align 3
.L227:
	movl	%eax, %edx
	cmpq	$0, 0(%r13,%rdx,8)
	jne	.L240
	addl	$1, %eax
.L237:
	cmpl	%r14d, %eax
	jb	.L227
.L239:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L241
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
.L238:
	.cfi_restore_state
	xorl	%edi, %edi
	jmp	.L231
.L240:
	leaq	__PRETTY_FUNCTION__.27461(%rip), %rcx
	leaq	.LC0(%rip), %rsi
	leaq	.LC20(%rip), %rdi
	movl	$333, %edx
	call	__assert_fail@PLT
.L241:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4637:
	.size	barrett_deserialize_and_reduce, .-barrett_deserialize_and_reduce
	.section	.text.unlikely.barrett_deserialize_and_reduce
.LCOLDE21:
	.section	.text.barrett_deserialize_and_reduce
.LHOTE21:
	.section	.text.unlikely.barrett_serialize,"ax",@progbits
.LCOLDB22:
	.section	.text.barrett_serialize,"ax",@progbits
.LHOTB22:
	.p2align 4,,15
	.globl	barrett_serialize
	.hidden	barrett_serialize
	.type	barrett_serialize, @function
barrett_serialize:
.LFB4638:
	.cfi_startproc
	movl	%edx, %r9d
	xorl	%eax, %eax
	xorl	%r8d, %r8d
	testq	%r9, %r9
	je	.L248
	.p2align 4,,10
	.p2align 3
.L246:
	leaq	(%rsi,%rax), %rdx
	movq	(%rdx), %rcx
	movb	%cl, (%rdi,%rax)
	movl	$8, %ecx
	shrx	%rcx, (%rdx), %rcx
	movb	%cl, 1(%rdi,%rax)
	movl	$16, %ecx
	shrx	%rcx, (%rdx), %rcx
	movb	%cl, 2(%rdi,%rax)
	movl	$24, %ecx
	shrx	%rcx, (%rdx), %rcx
	movb	%cl, 3(%rdi,%rax)
	movl	$32, %ecx
	shrx	%rcx, (%rdx), %rcx
	movb	%cl, 4(%rdi,%rax)
	movl	$40, %ecx
	shrx	%rcx, (%rdx), %rcx
	movb	%cl, 5(%rdi,%rax)
	movl	$48, %ecx
	shrx	%rcx, (%rdx), %rcx
	movb	%cl, 6(%rdi,%rax)
	movq	(%rdx), %rdx
	shrq	$56, %rdx
	movb	%dl, 7(%rdi,%rax)
	leal	1(%r8), %eax
	movq	%rax, %r8
	salq	$3, %rax
	cmpq	%r9, %rax
	jb	.L246
.L248:
	rep ret
	.cfi_endproc
.LFE4638:
	.size	barrett_serialize, .-barrett_serialize
	.section	.text.unlikely.barrett_serialize
.LCOLDE22:
	.section	.text.barrett_serialize
.LHOTE22:
	.section	.rodata.__PRETTY_FUNCTION__.27461,"a",@progbits
	.align 16
	.type	__PRETTY_FUNCTION__.27461, @object
	.size	__PRETTY_FUNCTION__.27461, 31
__PRETTY_FUNCTION__.27461:
	.string	"barrett_deserialize_and_reduce"
	.section	.rodata.__PRETTY_FUNCTION__.27398,"a",@progbits
	.align 16
	.type	__PRETTY_FUNCTION__.27398, @object
	.size	__PRETTY_FUNCTION__.27398, 19
__PRETTY_FUNCTION__.27398:
	.string	"barrett_mul_or_mac"
	.section	.rodata.__PRETTY_FUNCTION__.27344,"a",@progbits
	.align 8
	.type	__PRETTY_FUNCTION__.27344, @object
	.size	__PRETTY_FUNCTION__.27344, 8
__PRETTY_FUNCTION__.27344:
	.string	"widemac"
	.section	.rodata.__PRETTY_FUNCTION__.27378,"a",@progbits
	.align 8
	.type	__PRETTY_FUNCTION__.27378, @object
	.size	__PRETTY_FUNCTION__.27378, 15
__PRETTY_FUNCTION__.27378:
	.string	"barrett_reduce"
	.section	.rodata.__PRETTY_FUNCTION__.27366,"a",@progbits
	.align 8
	.type	__PRETTY_FUNCTION__.27366, @object
	.size	__PRETTY_FUNCTION__.27366, 15
__PRETTY_FUNCTION__.27366:
	.string	"barrett_negate"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
