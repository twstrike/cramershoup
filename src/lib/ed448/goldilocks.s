	.file	"goldilocks.c"
	.section	.text.unlikely.goldilocks_shared_secret_core,"ax",@progbits
.LCOLDB1:
	.section	.text.goldilocks_shared_secret_core,"ax",@progbits
.LHOTB1:
	.p2align 4,,15
	.type	goldilocks_shared_secret_core, @function
goldilocks_shared_secret_core:
.LFB4688:
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
	leaq	-752(%rbp), %r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	movq	%rsi, %r14
	leaq	-688(%rbp), %r15
	movq	%rdx, %rsi
	movq	%rcx, %r12
	subq	$832, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, -832(%rbp)
	movq	%r13, %rdi
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_deserialize@PLT
	leaq	56(%r14), %rsi
	movq	%r15, %rdi
	movq	%rax, -848(%rbp)
	call	p448_deserialize@PLT
	leaq	-624(%rbp), %rcx
	movq	%r15, %rdx
	movq	%r13, %rsi
	movq	%rax, %rbx
	movq	%rcx, %rdi
	movq	%rcx, -840(%rbp)
	call	p448_mul@PLT
	vmovdqa	-688(%rbp), %ymm0
	movabsq	$72057594037927935, %rax
	leaq	-816(%rbp), %r9
	movq	%rax, %rdi
	vpaddq	-752(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -688(%rbp)
	movq	-672(%rbp), %rsi
	vmovdqa	-656(%rbp), %ymm0
	andq	-664(%rbp), %rdi
	movq	%r9, -824(%rbp)
	vpaddq	-720(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -656(%rbp)
	movzbl	-625(%rbp), %ecx
	addq	%rcx, -656(%rbp)
	movq	%rsi, %rdx
	andq	%rax, %rsi
	shrq	$56, %rdx
	addq	%rdi, %rdx
	vmovdqu	-664(%rbp), %xmm0
	movq	%rdx, -664(%rbp)
	movq	-680(%rbp), %rdx
	vinserti128	$0x1, -648(%rbp), %ymm0, %ymm2
	vpermq	$27, -656(%rbp), %ymm0
	movq	%rdx, %rdi
	shrq	$56, %rdi
	andq	%rax, %rdx
	addq	%rdi, %rsi
	movq	%rsi, -672(%rbp)
	movq	-688(%rbp), %rsi
	vpand	.LC0(%rip), %ymm0, %ymm1
	movq	%rsi, %rdi
	andq	%rsi, %rax
	movq	%r14, %rsi
	vpermq	$27, %ymm2, %ymm0
	shrq	$56, %rdi
	addq	%rdi, %rdx
	addq	%rcx, %rax
	movq	%r9, %rdi
	movq	%rdx, -680(%rbp)
	movq	curve_prime_order@GOTPCREL(%rip), %rdx
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	movq	%rax, -688(%rbp)
	vmovdqa	%ymm0, -656(%rbp)
	vzeroupper
	call	barrett_deserialize@PLT
	andq	%rax, %rbx
	testq	%r12, %r12
	movq	-824(%rbp), %r9
	je	.L2
	leaq	56(%r12), %rcx
	leaq	-560(%rbp), %r12
	movq	%r9, %rsi
	movl	$446, %edx
	movq	%r12, %rdi
	call	scalarmul_fixed_base@PLT
	movq	%rax, %rsi
	andq	-848(%rbp), %rsi
	movq	%r13, %rdi
	movq	%rsi, -824(%rbp)
	movq	%r12, %rsi
	call	untwist_and_double_and_serialize@PLT
.L3:
	leaq	-176(%rbp), %rcx
	movq	%r13, %rsi
	movq	%rcx, %rdi
	movq	%rcx, -856(%rbp)
	call	p448_serialize@PLT
	movq	%r12, %rdi
	call	sha512_init@PLT
	movzbl	-824(%rbp), %eax
	leaq	-240(%rbp), %rsi
	movq	%r12, %rdi
	vmovdqu	112(%r14), %xmm0
	vinserti128	$0x1, 128(%r14), %ymm0, %ymm1
	andl	%ebx, %eax
	notl	%eax
	movl	%eax, %edx
	movb	%al, -848(%rbp)
	andl	$110, %edx
	vpbroadcastb	-848(%rbp), %ymm0
	movb	%dl, -240(%rbp)
	movl	%eax, %edx
	andl	$111, %edx
	vpand	%ymm0, %ymm1, %ymm0
	movb	%dl, -239(%rbp)
	movl	%eax, %edx
	andl	$115, %edx
	movb	%dl, -238(%rbp)
	movl	%eax, %edx
	andl	$104, %edx
	vextracti128	$0x1, %ymm0, -216(%rbp)
	movb	%dl, -237(%rbp)
	movl	%eax, %edx
	andl	$97, %edx
	movb	%dl, -236(%rbp)
	movl	%eax, %edx
	andl	$114, %edx
	movb	%dl, -235(%rbp)
	movl	%eax, %edx
	andl	$101, %edx
	movb	%dl, -234(%rbp)
	movl	%eax, %edx
	andl	$100, %edx
	movb	%dl, -233(%rbp)
	movl	$40, %edx
	vmovups	%xmm0, -232(%rbp)
	vzeroupper
	leaq	-112(%rbp), %r13
	call	sha512_update@PLT
	movq	%r15, %rsi
	movq	%r13, %rdi
	call	p448_serialize@PLT
	movl	$56, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	sha512_update@PLT
	movq	-840(%rbp), %rsi
	movq	%r13, %rdi
	call	p448_serialize@PLT
	movl	$56, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	sha512_update@PLT
	movq	-856(%rbp), %rcx
	movl	$56, %edx
	movq	%r12, %rdi
	movq	%rcx, %rsi
	call	sha512_update@PLT
	movq	-832(%rbp), %rsi
	movq	%r12, %rdi
	call	sha512_final@PLT
	movl	-824(%rbp), %eax
	movl	%ebx, %edx
	notl	%ebx
	andl	$44802, %edx
	andl	$44801, %ebx
	notl	%eax
	andl	%edx, %eax
	orl	%ebx, %eax
	movq	-56(%rbp), %rbx
	xorq	%fs:40, %rbx
	jne	.L8
	addq	$832, %rsp
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
.L2:
	.cfi_restore_state
	movl	$1, %r8d
	movl	$446, %ecx
	movq	%r9, %rdx
	movq	%r13, %rsi
	movq	%r13, %rdi
	leaq	-560(%rbp), %r12
	call	montgomery_ladder@PLT
	andq	-848(%rbp), %rax
	movq	%rax, -824(%rbp)
	jmp	.L3
.L8:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4688:
	.size	goldilocks_shared_secret_core, .-goldilocks_shared_secret_core
	.section	.text.unlikely.goldilocks_shared_secret_core
.LCOLDE1:
	.section	.text.goldilocks_shared_secret_core
.LHOTE1:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"derivepk"
	.section	.text.unlikely.goldilocks_derive_private_key.part.0,"ax",@progbits
.LCOLDB3:
	.section	.text.goldilocks_derive_private_key.part.0,"ax",@progbits
.LHOTB3:
	.p2align 4,,15
	.type	goldilocks_derive_private_key.part.0, @function
goldilocks_derive_private_key.part.0:
.LFB4697:
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
	leaq	-672(%rbp), %r13
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	movq	%rdi, %rbx
	movq	%rsi, %r12
	leaq	-128(%rbp), %r14
	subq	$776, %rsp
	movq	(%rsi), %rdx
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rdx, 112(%rdi)
	movq	8(%rsi), %rdx
	movq	%rdx, 120(%rdi)
	movq	16(%rsi), %rdx
	movq	%rdx, 128(%rdi)
	movq	24(%rsi), %rdx
	movq	%rdx, 136(%rdi)
	movq	%r13, %rdi
	call	sha512_init@PLT
	leaq	.LC2(%rip), %rsi
	movq	%r13, %rdi
	movl	$8, %edx
	call	sha512_update@PLT
	movl	$32, %edx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	sha512_update@PLT
	movq	%r13, %rdi
	movq	%r14, %rsi
	leaq	-816(%rbp), %r12
	call	sha512_final@PLT
	movq	curve_prime_order@GOTPCREL(%rip), %rcx
	movq	%r12, %rdi
	movl	$64, %edx
	movq	%r14, %rsi
	leaq	-464(%rbp), %r13
	call	barrett_deserialize_and_reduce@PLT
	movq	%r12, %rsi
	movl	$56, %edx
	movq	%rbx, %rdi
	call	barrett_serialize@PLT
	leaq	15424+goldilocks_global(%rip), %rcx
	movq	%r12, %rsi
	leaq	-752(%rbp), %r12
	movl	$446, %edx
	movq	%r13, %rdi
	call	scalarmul_fixed_base@PLT
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	untwist_and_double_and_serialize@PLT
	leaq	56(%rbx), %rdi
	movq	%r12, %rsi
	call	p448_serialize@PLT
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L13
	addq	$776, %rsp
	xorl	%eax, %eax
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
.L13:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4697:
	.size	goldilocks_derive_private_key.part.0, .-goldilocks_derive_private_key.part.0
	.section	.text.unlikely.goldilocks_derive_private_key.part.0
.LCOLDE3:
	.section	.text.goldilocks_derive_private_key.part.0
.LHOTE3:
	.section	.rodata.str1.1
.LC4:
	.string	"initializing"
.LC5:
	.string	"initialized"
.LC6:
	.string	"src/goldilocks.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC7:
	.string	"validate_affine(goldilocks_base_point)"
	.section	.rodata.str1.1
.LC8:
	.string	"/dev/urandom"
.LC9:
	.string	"failed to initialize"
	.section	.text.unlikely.goldilocks_init,"ax",@progbits
.LCOLDB10:
	.section	.text.goldilocks_init,"ax",@progbits
.LHOTB10:
	.p2align 4,,15
	.globl	goldilocks_init
	.type	goldilocks_init, @function
goldilocks_init:
.LFB4683:
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
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	leaq	.LC4(%rip), %rbx
	subq	$680, %rsp
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	lock cmpxchgq	%rbx, goldilocks_global(%rip)
	leaq	.LC5(%rip), %r12
	cmpq	%r12, %rax
	je	.L20
	movq	%rax, %rdx
	movl	$44801, %eax
	testq	%rdx, %rdx
	je	.L31
.L15:
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L32
	addq	$680, %rsp
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
	.p2align 4,,10
	.p2align 3
.L20:
	.cfi_restore_state
	movl	$44805, %eax
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L31:
	leaq	8+goldilocks_global(%rip), %rdi
	xorl	%esi, %esi
	call	pthread_mutex_init@PLT
	testl	%eax, %eax
	jne	.L16
	movq	goldilocks_base_point@GOTPCREL(%rip), %r14
	movq	%r14, %rdi
	call	validate_affine@PLT
	testq	%rax, %rax
	je	.L33
	leaq	-720(%rbp), %r13
	movq	%r14, %rsi
	leaq	-400(%rbp), %r14
	movq	%r13, %rdi
	call	convert_affine_to_extensible@PLT
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	twist_even@PLT
	leaq	64+goldilocks_global(%rip), %r9
	leaq	15424+goldilocks_global(%rip), %rdi
	movl	$18, %r8d
	movl	$5, %ecx
	movl	$5, %edx
	movq	%r14, %rsi
	call	precompute_fixed_base@PLT
	leaq	15584+goldilocks_global(%rip), %rdi
	movl	$5, %edx
	movq	%r14, %rsi
	movq	%rax, %r13
	call	precompute_fixed_base_wnaf@PLT
	leaq	.LC8(%rip), %rsi
	leaq	21728+goldilocks_global(%rip), %rdi
	xorl	%ecx, %ecx
	movl	$10000, %edx
	andq	%rax, %r13
	call	crandom_init_from_file@PLT
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	testq	%r13, %rax
	jne	.L34
.L16:
	leaq	.LC9(%rip), %rdx
	movq	%rbx, %rax
	lock cmpxchgq	%rdx, goldilocks_global(%rip)
	je	.L35
.L18:
	call	abort@PLT
.L34:
	movq	%rbx, %rax
	lock cmpxchgq	%r12, goldilocks_global(%rip)
	jne	.L18
	xorl	%eax, %eax
	jmp	.L15
.L32:
	call	__stack_chk_fail@PLT
.L33:
	leaq	__PRETTY_FUNCTION__.29398(%rip), %rcx
	leaq	.LC6(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	movl	$106, %edx
	call	__assert_fail@PLT
.L35:
	orl	$-1, %eax
	jmp	.L15
	.cfi_endproc
.LFE4683:
	.size	goldilocks_init, .-goldilocks_init
	.section	.text.unlikely.goldilocks_init
.LCOLDE10:
	.section	.text.goldilocks_init
.LHOTE10:
	.section	.text.unlikely.goldilocks_derive_private_key,"ax",@progbits
.LCOLDB11:
	.section	.text.goldilocks_derive_private_key,"ax",@progbits
.LHOTB11:
	.p2align 4,,15
	.globl	goldilocks_derive_private_key
	.type	goldilocks_derive_private_key, @function
goldilocks_derive_private_key:
.LFB4684:
	.cfi_startproc
	movq	goldilocks_global(%rip), %rdx
	leaq	.LC5(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L38
	jmp	goldilocks_derive_private_key.part.0
	.p2align 4,,10
	.p2align 3
.L38:
	movl	$44805, %eax
	ret
	.cfi_endproc
.LFE4684:
	.size	goldilocks_derive_private_key, .-goldilocks_derive_private_key
	.section	.text.unlikely.goldilocks_derive_private_key
.LCOLDE11:
	.section	.text.goldilocks_derive_private_key
.LHOTE11:
	.section	.text.unlikely.goldilocks_underive_private_key,"ax",@progbits
.LCOLDB12:
	.section	.text.goldilocks_underive_private_key,"ax",@progbits
.LHOTB12:
	.p2align 4,,15
	.globl	goldilocks_underive_private_key
	.type	goldilocks_underive_private_key, @function
goldilocks_underive_private_key:
.LFB4685:
	.cfi_startproc
	movq	112(%rsi), %rdx
	movq	%rdx, (%rdi)
	movq	120(%rsi), %rdx
	movq	%rdx, 8(%rdi)
	movq	128(%rsi), %rdx
	movq	%rdx, 16(%rdi)
	movq	136(%rsi), %rax
	movq	%rax, 24(%rdi)
	ret
	.cfi_endproc
.LFE4685:
	.size	goldilocks_underive_private_key, .-goldilocks_underive_private_key
	.section	.text.unlikely.goldilocks_underive_private_key
.LCOLDE12:
	.section	.text.goldilocks_underive_private_key
.LHOTE12:
	.section	.text.unlikely.goldilocks_private_to_public,"ax",@progbits
.LCOLDB13:
	.section	.text.goldilocks_private_to_public,"ax",@progbits
.LHOTB13:
	.p2align 4,,15
	.globl	goldilocks_private_to_public
	.type	goldilocks_private_to_public, @function
goldilocks_private_to_public:
.LFB4687:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	addq	$56, %rsi
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x70,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	leaq	-144(%rbp), %rbx
	movq	%rdi, %r12
	subq	$120, %rsp
	movq	%rbx, %rdi
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_deserialize@PLT
	testq	%rax, %rax
	movl	$44801, %edx
	jne	.L48
.L41:
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	movl	%edx, %eax
	jne	.L49
	addq	$120, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L48:
	.cfi_restore_state
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	p448_serialize@PLT
	xorl	%edx, %edx
	jmp	.L41
.L49:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4687:
	.size	goldilocks_private_to_public, .-goldilocks_private_to_public
	.section	.text.unlikely.goldilocks_private_to_public
.LCOLDE13:
	.section	.text.goldilocks_private_to_public
.LHOTE13:
	.section	.text.unlikely.goldilocks_keygen,"ax",@progbits
.LCOLDB14:
	.section	.text.goldilocks_keygen,"ax",@progbits
.LHOTB14:
	.p2align 4,,15
	.globl	goldilocks_keygen
	.type	goldilocks_keygen, @function
goldilocks_keygen:
.LFB4686:
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
	movl	$44805, %ebx
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	movq	goldilocks_global(%rip), %rdx
	leaq	.LC5(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L52
	movq	%rdi, %rbp
	leaq	8+goldilocks_global(%rip), %rdi
	movq	%rsi, %r12
	call	pthread_mutex_lock@PLT
	testl	%eax, %eax
	movl	%eax, %ebx
	je	.L65
.L52:
	movq	40(%rsp), %rcx
	xorq	%fs:40, %rcx
	movl	%ebx, %eax
	jne	.L66
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
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
.L65:
	.cfi_restore_state
	leaq	21728+goldilocks_global(%rip), %rdi
	movl	$32, %edx
	movq	%rsp, %rsi
	call	crandom_generate@PLT
	leaq	8+goldilocks_global(%rip), %rdi
	movl	%eax, %r14d
	call	pthread_mutex_unlock@PLT
	testl	%eax, %eax
	jne	.L67
	movq	%rsp, %rsi
	movq	%rbp, %rdi
	call	goldilocks_derive_private_key@PLT
	testl	%r14d, %r14d
	movl	%eax, %r13d
	movq	%rbp, %rsi
	movq	%r12, %rdi
	jne	.L54
	call	goldilocks_private_to_public@PLT
	testl	%r13d, %r13d
	jne	.L55
	testl	%eax, %eax
	je	.L52
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L54:
	call	goldilocks_private_to_public@PLT
.L55:
	movl	$44804, %ebx
	jmp	.L52
.L66:
	call	__stack_chk_fail@PLT
.L67:
	call	abort@PLT
	.cfi_endproc
.LFE4686:
	.size	goldilocks_keygen, .-goldilocks_keygen
	.section	.text.unlikely.goldilocks_keygen
.LCOLDE14:
	.section	.text.goldilocks_keygen
.LHOTE14:
	.section	.text.unlikely.goldilocks_shared_secret,"ax",@progbits
.LCOLDB15:
	.section	.text.goldilocks_shared_secret,"ax",@progbits
.LHOTB15:
	.p2align 4,,15
	.globl	goldilocks_shared_secret
	.type	goldilocks_shared_secret, @function
goldilocks_shared_secret:
.LFB4689:
	.cfi_startproc
	xorl	%ecx, %ecx
	jmp	goldilocks_shared_secret_core
	.cfi_endproc
.LFE4689:
	.size	goldilocks_shared_secret, .-goldilocks_shared_secret
	.section	.text.unlikely.goldilocks_shared_secret
.LCOLDE15:
	.section	.text.goldilocks_shared_secret
.LHOTE15:
	.section	.rodata.str1.1
.LC16:
	.string	"signonce"
	.section	.text.unlikely.goldilocks_sign,"ax",@progbits
.LCOLDB17:
	.section	.text.goldilocks_sign,"ax",@progbits
.LHOTB17:
	.p2align 4,,15
	.globl	goldilocks_sign
	.type	goldilocks_sign, @function
goldilocks_sign:
.LFB4691:
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
	movq	%rdx, %rbx
	subq	$1248, %rsp
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	goldilocks_global(%rip), %rdx
	leaq	.LC5(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L86
	leaq	-1264(%rbp), %r15
	movq	curve_prime_order@GOTPCREL(%rip), %rdx
	movq	%rdi, %r13
	movq	%rsi, %r14
	movq	%rcx, %rsi
	movq	%rcx, %r12
	movq	%r15, %rdi
	call	barrett_deserialize@PLT
	testq	%rax, %rax
	jne	.L76
	leaq	56(%r15), %rax
	movq	%r15, %rdi
	.p2align 4,,10
	.p2align 3
.L72:
	movb	$0, (%rdi)
	addq	$1, %rdi
	cmpq	%rdi, %rax
	jne	.L72
	movl	$44801, %eax
.L71:
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L87
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
.L86:
	.cfi_restore_state
	movl	$44805, %eax
	jmp	.L71
	.p2align 4,,10
	.p2align 3
.L76:
	leaq	-1008(%rbp), %rax
	movq	%rax, %rdi
	movq	%rax, -1272(%rbp)
	call	sha512_init@PLT
	movq	-1272(%rbp), %rdi
	leaq	.LC16(%rip), %rsi
	movl	$8, %edx
	call	sha512_update@PLT
	leaq	112(%r12), %rax
	movq	-1272(%rbp), %rdi
	movl	$32, %edx
	movq	%rax, %rsi
	movq	%rax, -1280(%rbp)
	call	sha512_update@PLT
	movq	-1272(%rbp), %rdi
	movq	%rbx, %rdx
	movq	%r14, %rsi
	call	sha512_update@PLT
	movq	-1280(%rbp), %rax
	movq	-1272(%rbp), %rdi
	movl	$32, %edx
	movq	%rax, %rsi
	call	sha512_update@PLT
	leaq	-192(%rbp), %rax
	movq	-1272(%rbp), %rdi
	movq	%rax, %rsi
	movq	%rax, -1280(%rbp)
	call	sha512_final@PLT
	leaq	-1200(%rbp), %rax
	movq	curve_prime_order@GOTPCREL(%rip), %rcx
	movl	$64, %edx
	movq	%rax, %rdi
	movq	-1280(%rbp), %rax
	movq	%rdi, -1272(%rbp)
	movq	%rax, %rsi
	call	barrett_deserialize_and_reduce@PLT
	leaq	-592(%rbp), %rax
	movq	-1272(%rbp), %rsi
	leaq	15424+goldilocks_global(%rip), %rcx
	movl	$446, %edx
	movq	%rax, %rdi
	movq	%rax, -1280(%rbp)
	call	scalarmul_fixed_base@PLT
	movq	-1280(%rbp), %rdi
	call	double_tw_extensible@PLT
	leaq	-1072(%rbp), %rdx
	movq	-1280(%rbp), %rsi
	movq	%rdx, %rdi
	movq	%rdx, -1280(%rbp)
	call	untwist_and_double_and_serialize@PLT
	movq	-1280(%rbp), %rdx
	leaq	-256(%rbp), %rax
	movq	%rax, %rdi
	movq	%rax, -1288(%rbp)
	movq	%rdx, %rsi
	call	p448_serialize@PLT
	leaq	-800(%rbp), %rax
	movq	%rax, %rdi
	movq	%rax, -1280(%rbp)
	call	sha512_init@PLT
	leaq	56(%r12), %rsi
	movq	-1280(%rbp), %r12
	movl	$56, %edx
	movq	%r12, %rdi
	call	sha512_update@PLT
	movq	-1288(%rbp), %rax
	movq	%r12, %rdi
	movl	$56, %edx
	movq	%rax, %rsi
	call	sha512_update@PLT
	movq	%r14, %rsi
	leaq	-128(%rbp), %r14
	movq	%rbx, %rdx
	movq	%r12, %rdi
	call	sha512_update@PLT
	movq	%r12, %rdi
	movq	%r14, %rsi
	leaq	-1136(%rbp), %r12
	call	sha512_final@PLT
	movq	curve_prime_order@GOTPCREL(%rip), %rcx
	movl	$64, %edx
	movq	%r14, %rsi
	movq	%r12, %rdi
	call	barrett_deserialize_and_reduce@PLT
	movq	curve_prime_order@GOTPCREL(%rip), %rdx
	movl	$7, %esi
	movq	%r12, %rdi
	call	barrett_negate@PLT
	movq	-1272(%rbp), %rbx
	pushq	$-1
	movl	$7, %r9d
	pushq	curve_prime_order@GOTPCREL(%rip)
	movq	%r15, %r8
	movl	$7, %ecx
	movq	%r12, %rdx
	movl	$7, %esi
	movq	%rbx, %rdi
	call	barrett_mul_or_mac@PLT
	movq	$-1, %r9
	movl	$7, %r8d
	movq	%rbx, %rcx
	movl	$7, %edx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	add_nr_ext_packed@PLT
	movq	curve_prime_order@GOTPCREL(%rip), %rcx
	movq	%rax, %rdx
	movl	$7, %esi
	movq	%rbx, %rdi
	call	barrett_reduce@PLT
	movq	-256(%rbp), %rax
	leaq	56(%r13), %rdi
	movl	$56, %edx
	movq	%rbx, %rsi
	movq	%rax, 0(%r13)
	movq	-248(%rbp), %rax
	movq	%rax, 8(%r13)
	movq	-240(%rbp), %rax
	movq	%rax, 16(%r13)
	movq	-232(%rbp), %rax
	movq	%rax, 24(%r13)
	movq	-224(%rbp), %rax
	movq	%rax, 32(%r13)
	movq	-216(%rbp), %rax
	movq	%rax, 40(%r13)
	movq	-208(%rbp), %rax
	movq	%rax, 48(%r13)
	call	barrett_serialize@PLT
	popq	%rdx
	popq	%rcx
	leaq	56(%rbx), %rax
	.p2align 4,,10
	.p2align 3
.L73:
	movb	$0, (%rbx)
	addq	$1, %rbx
	cmpq	%rax, %rbx
	jne	.L73
	leaq	56(%r15), %rax
	movq	%r15, %rdi
	.p2align 4,,10
	.p2align 3
.L74:
	movb	$0, (%rdi)
	addq	$1, %rdi
	cmpq	%rdi, %rax
	jne	.L74
	leaq	56(%r12), %rax
	movq	%r12, %rdi
	.p2align 4,,10
	.p2align 3
.L75:
	movb	$0, (%rdi)
	addq	$1, %rdi
	cmpq	%rdi, %rax
	jne	.L75
	xorl	%eax, %eax
	jmp	.L71
.L87:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4691:
	.size	goldilocks_sign, .-goldilocks_sign
	.section	.text.unlikely.goldilocks_sign
.LCOLDE17:
	.section	.text.goldilocks_sign
.LHOTE17:
	.section	.text.unlikely.goldilocks_verify,"ax",@progbits
.LCOLDB18:
	.section	.text.goldilocks_verify,"ax",@progbits
.LHOTB18:
	.p2align 4,,15
	.globl	goldilocks_verify
	.type	goldilocks_verify, @function
goldilocks_verify:
.LFB4692:
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
	movq	%rdx, %r14
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	subq	$704, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	goldilocks_global(%rip), %rdx
	leaq	.LC5(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L113
	leaq	-592(%rbp), %rbx
	movq	%rdi, %r12
	movq	%rsi, %r13
	movq	%rcx, %rsi
	movq	%rcx, %r15
	movq	%rbx, %rdi
	call	p448_deserialize@PLT
	testq	%rax, %rax
	jne	.L114
.L92:
	movl	$44802, %eax
.L90:
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L115
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
.L113:
	.cfi_restore_state
	movl	$44805, %eax
	jmp	.L90
	.p2align 4,,10
	.p2align 3
.L114:
	leaq	-720(%rbp), %rax
	movq	curve_prime_order@GOTPCREL(%rip), %rdx
	leaq	56(%r12), %rsi
	movq	%rax, %rdi
	movq	%rax, -728(%rbp)
	call	barrett_deserialize@PLT
	testq	%rax, %rax
	je	.L92
	leaq	-464(%rbp), %rax
	movq	%rax, %rdi
	movq	%rax, -736(%rbp)
	call	sha512_init@PLT
	movq	%r15, %rsi
	movq	-736(%rbp), %r15
	movl	$56, %edx
	movq	%r15, %rdi
	call	sha512_update@PLT
	movl	$56, %edx
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	sha512_update@PLT
	movq	%r14, %rdx
	leaq	-128(%rbp), %r14
	movq	%r13, %rsi
	movq	%r15, %rdi
	leaq	-656(%rbp), %r13
	call	sha512_update@PLT
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	sha512_final@PLT
	movq	curve_prime_order@GOTPCREL(%rip), %rcx
	movq	%r14, %rsi
	leaq	-528(%rbp), %r14
	movl	$64, %edx
	movq	%r13, %rdi
	call	barrett_deserialize_and_reduce@PLT
	movq	%r12, %rsi
	movq	%r14, %rdi
	call	p448_deserialize@PLT
	testq	%rax, %rax
	je	.L92
	movq	-736(%rbp), %rdi
	movq	%rbx, %rsi
	call	deserialize_and_twist_approx@PLT
	testq	%rax, %rax
	je	.L92
	movq	-736(%rbp), %r15
	movq	-728(%rbp), %rcx
	leaq	15584+goldilocks_global(%rip), %r9
	pushq	%rax
	pushq	$5
	movl	$446, %edx
	movl	$446, %r8d
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	linear_combo_var_fixed_vt@PLT
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	untwist_and_double_and_serialize@PLT
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	p448_eq@PLT
	testq	%rax, %rax
	popq	%rdx
	popq	%rcx
	je	.L92
	xorl	%eax, %eax
	jmp	.L90
.L115:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4692:
	.size	goldilocks_verify, .-goldilocks_verify
	.section	.text.unlikely.goldilocks_verify
.LCOLDE18:
	.section	.text.goldilocks_verify
.LHOTE18:
	.section	.text.unlikely.goldilocks_precompute_public_key,"ax",@progbits
.LCOLDB19:
	.section	.text.goldilocks_precompute_public_key,"ax",@progbits
.LHOTB19:
	.p2align 4,,15
	.globl	goldilocks_precompute_public_key
	.type	goldilocks_precompute_public_key, @function
goldilocks_precompute_public_key:
.LFB4693:
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
	movq	%rdi, %r12
	pushq	%rbx
	movl	$192, %edi
	subq	$424, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	malloc@PLT
	testq	%rax, %rax
	je	.L122
	leaq	-464(%rbp), %r13
	movq	%r12, %rsi
	movq	%rax, %rbx
	movq	%r13, %rdi
	call	p448_deserialize@PLT
	testq	%rax, %rax
	je	.L125
	leaq	-400(%rbp), %r14
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	deserialize_and_twist_approx@PLT
	testq	%rax, %rax
	je	.L125
	leaq	56(%rbx), %rdi
	xorl	%r9d, %r9d
	movl	$18, %r8d
	movl	$5, %ecx
	movl	$5, %edx
	movq	%r14, %rsi
	call	precompute_fixed_base@PLT
	testq	%rax, %rax
	je	.L125
	movq	(%r12), %rax
	movq	%rax, (%rbx)
	movq	8(%r12), %rax
	movq	%rax, 8(%rbx)
	movq	16(%r12), %rax
	movq	%rax, 16(%rbx)
	movq	24(%r12), %rax
	movq	%rax, 24(%rbx)
	movq	32(%r12), %rax
	movq	%rax, 32(%rbx)
	movq	40(%r12), %rax
	movq	%rax, 40(%rbx)
	movq	48(%r12), %rax
	movq	%rax, 48(%rbx)
	movq	%rbx, %rax
.L117:
	movq	-56(%rbp), %rdx
	xorq	%fs:40, %rdx
	jne	.L126
	addq	$424, %rsp
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
	.p2align 4,,10
	.p2align 3
.L125:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	free@PLT
	xorl	%eax, %eax
	jmp	.L117
	.p2align 4,,10
	.p2align 3
.L122:
	xorl	%eax, %eax
	jmp	.L117
.L126:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4693:
	.size	goldilocks_precompute_public_key, .-goldilocks_precompute_public_key
	.section	.text.unlikely.goldilocks_precompute_public_key
.LCOLDE19:
	.section	.text.goldilocks_precompute_public_key
.LHOTE19:
	.section	.text.unlikely.goldilocks_destroy_precomputed_public_key,"ax",@progbits
.LCOLDB20:
	.section	.text.goldilocks_destroy_precomputed_public_key,"ax",@progbits
.LHOTB20:
	.p2align 4,,15
	.globl	goldilocks_destroy_precomputed_public_key
	.type	goldilocks_destroy_precomputed_public_key, @function
goldilocks_destroy_precomputed_public_key:
.LFB4694:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L133
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	56(%rdi), %rbx
	movq	%rdi, %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	%rbx, %rdi
	call	destroy_fixed_base@PLT
	movq	%rbp, %rax
	.p2align 4,,10
	.p2align 3
.L129:
	movb	$0, (%rax)
	addq	$1, %rax
	cmpq	%rbx, %rax
	jne	.L129
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movq	%rbp, %rdi
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	jmp	free@PLT
.L133:
	rep ret
	.cfi_endproc
.LFE4694:
	.size	goldilocks_destroy_precomputed_public_key, .-goldilocks_destroy_precomputed_public_key
	.section	.text.unlikely.goldilocks_destroy_precomputed_public_key
.LCOLDE20:
	.section	.text.goldilocks_destroy_precomputed_public_key
.LHOTE20:
	.section	.text.unlikely.goldilocks_verify_precomputed,"ax",@progbits
.LCOLDB21:
	.section	.text.goldilocks_verify_precomputed,"ax",@progbits
.LHOTB21:
	.p2align 4,,15
	.globl	goldilocks_verify_precomputed
	.type	goldilocks_verify_precomputed, @function
goldilocks_verify_precomputed:
.LFB4695:
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
	movq	%rdx, %r13
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	subq	$704, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	goldilocks_global(%rip), %rdx
	leaq	.LC5(%rip), %rax
	cmpq	%rax, %rdx
	jne	.L156
	leaq	-720(%rbp), %r14
	movq	curve_prime_order@GOTPCREL(%rip), %rdx
	movq	%rsi, %r12
	leaq	56(%rdi), %rsi
	movq	%rdi, %r15
	movq	%rcx, %rbx
	movq	%r14, %rdi
	call	barrett_deserialize@PLT
	testq	%rax, %rax
	jne	.L157
.L138:
	movl	$44802, %eax
.L136:
	movq	-56(%rbp), %rbx
	xorq	%fs:40, %rbx
	jne	.L158
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
.L156:
	.cfi_restore_state
	movl	$44805, %eax
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L157:
	leaq	-464(%rbp), %rax
	movq	%rax, %rdi
	movq	%rax, -728(%rbp)
	call	sha512_init@PLT
	movq	-728(%rbp), %rdi
	movl	$56, %edx
	movq	%rbx, %rsi
	call	sha512_update@PLT
	movq	-728(%rbp), %rdi
	movl	$56, %edx
	movq	%r15, %rsi
	call	sha512_update@PLT
	movq	%r12, %rsi
	movq	-728(%rbp), %r12
	movq	%r13, %rdx
	leaq	-128(%rbp), %r13
	movq	%r12, %rdi
	call	sha512_update@PLT
	movq	%r13, %rsi
	movq	%r12, %rdi
	leaq	-656(%rbp), %r12
	call	sha512_final@PLT
	movq	curve_prime_order@GOTPCREL(%rip), %rcx
	movq	%r13, %rsi
	leaq	-592(%rbp), %r13
	movl	$64, %edx
	movq	%r12, %rdi
	call	barrett_deserialize_and_reduce@PLT
	movq	%r15, %rsi
	movq	%r13, %rdi
	call	p448_deserialize@PLT
	testq	%rax, %rax
	je	.L138
	leaq	15424+goldilocks_global(%rip), %rax
	subq	$8, %rsp
	movq	-728(%rbp), %rdi
	leaq	56(%rbx), %rcx
	movl	$446, %edx
	movl	$446, %r9d
	pushq	%rax
	movq	%r14, %r8
	movq	%r12, %rsi
	call	linear_combo_combs_vt@PLT
	testq	%rax, %rax
	popq	%rdx
	popq	%rcx
	je	.L138
	leaq	-528(%rbp), %rbx
	movq	-728(%rbp), %rsi
	movq	%rbx, %rdi
	call	untwist_and_double_and_serialize@PLT
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	p448_eq@PLT
	testq	%rax, %rax
	je	.L138
	xorl	%eax, %eax
	jmp	.L136
.L158:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4695:
	.size	goldilocks_verify_precomputed, .-goldilocks_verify_precomputed
	.section	.text.unlikely.goldilocks_verify_precomputed
.LCOLDE21:
	.section	.text.goldilocks_verify_precomputed
.LHOTE21:
	.section	.text.unlikely.goldilocks_shared_secret_precomputed,"ax",@progbits
.LCOLDB22:
	.section	.text.goldilocks_shared_secret_precomputed,"ax",@progbits
.LHOTB22:
	.p2align 4,,15
	.globl	goldilocks_shared_secret_precomputed
	.type	goldilocks_shared_secret_precomputed, @function
goldilocks_shared_secret_precomputed:
.LFB4696:
	.cfi_startproc
	movq	%rdx, %rcx
	jmp	goldilocks_shared_secret_core
	.cfi_endproc
.LFE4696:
	.size	goldilocks_shared_secret_precomputed, .-goldilocks_shared_secret_precomputed
	.section	.text.unlikely.goldilocks_shared_secret_precomputed
.LCOLDE22:
	.section	.text.goldilocks_shared_secret_precomputed
.LHOTE22:
	.section	.rodata.__PRETTY_FUNCTION__.29398,"a",@progbits
	.align 16
	.type	__PRETTY_FUNCTION__.29398, @object
	.size	__PRETTY_FUNCTION__.29398, 16
__PRETTY_FUNCTION__.29398:
	.string	"goldilocks_init"
	.section	.bss.goldilocks_global,"aw",@nobits
	.align 32
	.type	goldilocks_global, @object
	.size	goldilocks_global, 21920
goldilocks_global:
	.zero	21920
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.quad	72057594037927935
	.quad	72057594037927935
	.quad	72057594037927935
	.quad	72057594037927935
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
