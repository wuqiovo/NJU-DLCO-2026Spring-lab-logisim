#计算累加和程序
.text
main:
    auipc t0,2          # 等价于伪指令la t0,n：获取标号n的地址，la伪指令,n存放在数据区0x2000
    addi t0,t0,0
	lw a0,0(t0)         # 从数据区地址单元中读取参数n到寄存器a0；n=0,则退出
	beq a0,x0,fail
	ori a2,x0,1         # 循环变量i，存放在a2，初值为1 
	xor a3,a3,a3        # 累计和存放在a3，初值为s=0
loop:
	add a3, a3, a2      # 将a3=a3+i
	beq a2, a0, finish  # 若i=n，则跳出循环
    addi a2, a2, 1      # i++
    jal x0, loop        # 无条件跳转到loop执行
#	bge a0,a2,loop      # 若i=n，则跳出循环
finish:
	sw a3, 4(t0)        # 将累加结果保存到数据存储器地址0x2004单元

pass:
  lui	a0,0xc10
  addi	a0,a0,-18  # 00c0ffee
  ecall

fail:
  lui	a0,0xdeade
  addi	a0,a0,-339  # deaddead
  ecall

.data                   # 在RARS中可设置数据段从 0x2000 开始，
 n: .word 100
 result: .word 0
