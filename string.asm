.include "mfunc.inc"

# strcpy из string.h
# ОСТРОЖНО - BUFFER OVERFLOW
.macro strcpy_body  # (dst, src) -> dst
	mv t1 a0  # Сохраняем dst, чтобы его потом вернуть
	loop:  # Цикл с пост-условием (do-while)
	       # Так нужно, потому что strcpy должен копировать и 0 тоже
		lb t0 (a1)
		sb t0 (a0)
		addi a0 a0 1
		addi a1 a1 1
		
		bnez t0 loop
	
	mv a0 t1
.end_macro

gfunc(_strcpy, strcpy_body)