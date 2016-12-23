	.file	"magic.c"
	.hidden	sqrt_d_minus_1
	.globl	sqrt_d_minus_1
	.section	.rodata.sqrt_d_minus_1,"a",@progbits
	.align 32
	.type	sqrt_d_minus_1, @object
	.size	sqrt_d_minus_1, 64
sqrt_d_minus_1:
	.quad	59358338729942854
	.quad	38436401792876921
	.quad	25359800491502136
	.quad	23052758725774342
	.quad	46337247922722672
	.quad	62113912208094806
	.quad	20622695763309386
	.quad	5346653400882042
	.hidden	curve_prime_order
	.globl	curve_prime_order
	.section	.data.rel.ro.local.curve_prime_order,"aw",@progbits
	.align 16
	.type	curve_prime_order, @object
	.size	curve_prime_order, 24
curve_prime_order:
	.long	7
	.long	62
	.long	4
	.zero	4
	.quad	curve_prime_order_lo
	.section	.rodata.curve_prime_order_lo,"a",@progbits
	.align 32
	.type	curve_prime_order_lo, @object
	.size	curve_prime_order_lo, 32
curve_prime_order_lo:
	.quad	-2556006723728458995
	.quad	-2408513697996967766
	.quad	4301259484579875183
	.quad	2201345046
	.hidden	goldilocks_base_point
	.globl	goldilocks_base_point
	.section	.rodata.goldilocks_base_point,"a",@progbits
	.align 32
	.type	goldilocks_base_point, @object
	.size	goldilocks_base_point, 128
goldilocks_base_point:
	.quad	67798653110948767
	.quad	54447829754290375
	.quad	68560243319520662
	.quad	44170657370767018
	.quad	26747116006789232
	.quad	16442263009178404
	.quad	7687441509029957
	.quad	11679703633400575
	.quad	19
	.zero	56
	.hidden	SCALARMUL_FIXED_WINDOW_ADJUSTMENT
	.globl	SCALARMUL_FIXED_WINDOW_ADJUSTMENT
	.section	.rodata.SCALARMUL_FIXED_WINDOW_ADJUSTMENT,"a",@progbits
	.align 32
	.type	SCALARMUL_FIXED_WINDOW_ADJUSTMENT, @object
	.size	SCALARMUL_FIXED_WINDOW_ADJUSTMENT, 112
SCALARMUL_FIXED_WINDOW_ADJUSTMENT:
	.quad	-1446612708507781694
	.quad	765782677464586754
	.quad	9178660047569472910
	.quad	33020175693
	.quad	0
	.quad	0
	.quad	4611686018427387904
	.quad	-4002619432236240689
	.quad	-1642731020532381011
	.quad	-4966824541560203523
	.quad	35221520739
	.quad	0
	.quad	0
	.quad	0
	.hidden	FIELD_MODULUS
	.globl	FIELD_MODULUS
	.section	.rodata.FIELD_MODULUS,"a",@progbits
	.align 32
	.type	FIELD_MODULUS, @object
	.size	FIELD_MODULUS, 56
FIELD_MODULUS:
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-2
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
