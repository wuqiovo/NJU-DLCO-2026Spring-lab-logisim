#计算累加和程序lab8.2-1.asm
.text
main:
	lw a0,0(x0)         # 从数据区地址单元0x0中读取参数n到寄存器a0；n=0,则退出
	beq a0,x0,fail
	ori a2,x0,1         # 循环变量i，存放在a2，初值为1 
	xor a3,a3,a3        # 累计和存放在a3，初值为s=0
loop:
	add a3, a3, a2      # 将a3=a3+i
    addi a2, a2, 1      # i++
	bgeu a0,a2,loop      # 若n>=i，则循环
	sw a3, 4(x0)        # 将累加结果保存到数据存储器地址0x2004单元

pass:
  lui	a0,0xc10
  addi	a0,a0,-18       # a0=00c0ffee
  ecall                 # opcode=0x73，程序中止执行

fail:
  lui	a0,0xdeade
  addi	a0,a0,-339      # a0=deaddead
  ecall                 # opcode=0x73，程序中止执行
