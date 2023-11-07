.include "mfunc.inc"

# strcpy �� string.h
# �������� - BUFFER OVERFLOW
.macro strcpy_body  # (dst, src) -> dst
	mv t1 a0  # ��������� dst, ����� ��� ����� �������
	loop:  # ���� � ����-�������� (do-while)
	       # ��� �����, ������ ��� strcpy ������ ���������� � 0 ����
		lb t0 (a1)
		sb t0 (a0)
		addi a0 a0 1
		addi a1 a1 1
		
		bnez t0 loop
	
	mv a0 t1
.end_macro

gfunc(_strcpy, strcpy_body)