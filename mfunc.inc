# ������ ��� �������� ����������� �������
# ��������� ������������ ����� ������� ���� ������� ������������� � ������, ��� ������ ����� ����������.
# ����� ��� ��������� �� ������ ������ � ������ � ������ �������
.macro func (%name, %body)
.text
	%name:
	# ������
	sw ra (sp)
	addi sp sp -4
	
	%body ()
	
	# ������ 
	lw ra 4(sp)
	addi sp sp 4
	ret
.end_macro

.macro gfunc(%name, %body)  # ��� func, ������ ������� ���������� ��� ����������
	func (%name, %body)
	.globl %name
.end_macro

.macro save (%s)  # ��������� �������� �������� �� �����.
	sw %s (sp)
	addi sp sp -4
.end_macro

.macro fsave.d (%s)  # ��������� double-�������� �������� �� �����
	addi sp sp -4
	fsd %s (sp)
	addi sp sp -4
.end_macro

.macro restore (%s)  # ���������������� �������� �������� ��������� �� �����.
	lw %s 4(sp)
	addi sp sp 4
.end_macro

.macro frestore.d (%s)  # ��������������� double-�������� �������� ��������� �� �����. 
	fld %s 4(sp)
	addi sp sp 8
.end_macro
