.macro strcpy (%dst, %src)
	la a0 %dst
	la a1 %src
	jal _strcpy
.end_macro