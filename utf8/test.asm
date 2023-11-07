.include "convenience.inc"
.include "mfunc.inc"
.include "string.inc"
.data
	in1: .asciz ""
	in2: .asciz "A string"
	in3: .asciz "dbhrffnjkfdjkbjdfbljdfbklndjfhgirjjkbjhVYFYVHVYGuijhevjhJHVyt3yuytiwek"

	stestcase: .asciz "Testcase "
	sok: .asciz "OK\n"
	swa: .asciz "WRONG ANSWER\n"
	scor: .asciz "Correct answer: "
	sgiv: .asciz "Output: "
	out: .space 256

.macro str_equal_body  # (s1, s2) -> flag
	loop:
		lb t0 (a0)
		lb t1 (a1)
		sub t2 t0 t1
		seqz t3 t2
		beqz t3 are_not_equal  # Если символы не равны, то и строки тоже
		beqz t0 are_equal  # Если одна из строк кончилась (а с услвоием выше и вторая тоже), то строки равны
		addi a0 a0 1
		addi a1 a1 1
		b loop  # Иначе продолжаем сравнивать
	
	are_equal:
		li a0 1
		b end
	are_not_equal:
		li a0 0
	end:
.end_macro
func(_str_equal, str_equal_body)
.macro str_equal (%s1, %s2)
	la a0 %s1
	la a1 %s2
	jal _str_equal
.end_macro

.macro testcase (%num, %in, %out)
	print_str (stestcase)
	li a0 %num
	print_int ()
	print_char (':')
	print_char (' ')
	
	strcpy (%out, %in)
	str_equal (%in, %out)
	
	beqz a0 wrong_answer
		print_str (sok)
		b end
	wrong_answer:
		print_str (swa)
		print_str (sgiv)
		print_str (%out)
		nl()
		print_str (scor)
		print_str (%in)
		nl()
	end:
.end_macro

.global main
.text
main:
	testcase (1, in1, out)
	testcase (2, in2, out)
	testcase (3, in3, out)
	exit()
	
	
	
