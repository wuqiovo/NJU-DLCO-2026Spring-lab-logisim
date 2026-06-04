.text
main:
test_1: #x0 register,addi,xor,lui,bne test
	lui  x0, 0x80000
	addi x0, x0,0x7ff
	xor  x1, x1, x1
	addi x3,x0,1    #R[3]=1
	bne  x0, x1, fail

test_2:    #add test
	lui	x1,0x80000
	lui	x2,0xffff8
	add	x14,x1,x2       #RAW冒险
	lui	x7,0x7fff8
	addi x3,x0,2   #R[3]=2
	bne  x14, x7, fail

test_3:    #and test
	lui	x1,0xff01
	addi	x1,x1,-16 # 0ff00ff0
	lui	x2,0xf0f0f
	addi	x2,x2,240 # f0f0f0f0
	and	x15,x1,x2
	lui	x7,0xf00
	addi x7,x7,0xf0
	addi x3,x0,3    #R[3]=3
	bne	x15,x7, fail

test_4:    #sll test
	addi x1,x0,1
	addi x2,x0,63
	sll	x16,x1,x2
	lui	x7,0x80000
	addi x3,x0,4     #R[3]=4
	bne	x16,x7, fail

test_5:    #sra test
	lui	x1,0x80000
	addi x2,x0,14
	sra	x17,x1,x2
	lui	x7,0xfffe0
	addi x3,x0,5     #R[3]=5
	bne	x17,x7, fail

test_6:    #slti test
	lui	x1,0x80000
	slti	x18,x1,2047
	addi	x7,x0,1
	addi	x3,x0,6     #R[3]=1
	bne	x18,x7, fail

test_7:    #sltiu test
	lui	 x1,0x80000
	sltiu x19,x1,2047
	addi	 x7,x0,0
	addi	 x3,x0,7    #R[3]=7
	bne	 x19,x7, fail

test_8:    #load,stroe test
#     la x1,buffer        #等价于下列两条指令
	auipc x1, 2
	addi  x1,x1,0xffffff58 #buffer,0x2000
    addi x2,x0,0xee
    sb   x2,0(x1)
    addi x2,x0,0xff
    sb   x2,1(x1)
    addi x2,x0,0x0c0
    sb   x2,2(x1)
    addi x2,x0,0x00
    sb   x2,3(x1)
    addi x7,x0,-1
    addi x3,x0,8   #R[3]=8
    lb   x20,1(x1)
    bne	 x20,x7, fail   #load-use冒险
    addi x3,x0,9    #R[3]=9
    lui  x7,16  #10
    addi x7,x7,-18  #0x0ffee
    lhu x21,0(x1)
    bne	 x21,x7, fail   #load-use冒险
    addi x3,x0,10    #R[3]=10
    lh   x22,2(x1)
    addi x7,x0,0xc0
    sh   x21,4(x1)
    bne	 x22,x7, fail  #load-use冒险
    addi x3,x0,11   #R[3]=11
    lui	 x7,0xc10
    addi x7,x7,-18 # c0ffee
    lw    x23,0(x1)
    bne	 x23,x7, fail   #load-use冒险
    addi x3,x0,12    #R[3]=12
 	lui	 x7,0xc10
	addi x7,x7,-18 # c0ffee
	addi x4,x1,0
    lw     x24,0(x4)
	sw     x24,4(x4)
	lw     x31,4(x4)
    bne  x31,x7, fail   #load-store冒险

test_9:    #jalr test
	addi x3,x0,13       #R[3]=13
	auipc  x25, 0
	jalr   x25, x25,16   # test_9_2
test_9_1:
	add x0, x0,x0
	jal x0, fail
test_9_2:
	auipc x7,0
	addi x7,x7,-8       #test_9_1
	bne x25,x7,fail     #auipc,jalr,jal指令测试及控制冒险处理

test_10:    #loop test，计算斐波那契项数n=10
	addi x3,x0,14       #R[3]=14
	addi x8,x0,0x0a		#设置循环次数n=10
	ori x10,x0,0         #x9=F(0)=0
    ori x11,x0,1        #x10=F(1)=1
    addi x9,x0,1       #x9初始化计数器   	
test_10_1:
	add x12,x11,x10    #x12=x11+x10
	add x10,x0,x11
	add x11,x0,x12
	addi x9,x9,1
	bgt x9,x8,test_10_2     #计数器>n,结束循环
	jal test_10_1
test_10_2:
	sw     x12,8(x4)        #保存结果到数据区
pass:
	lui	  x10,0xc10
	addi	x10,x10,-18  # R[10]=0X00c0ffee
	ecall                #opcode=0x73，程序中止执行

fail:
	lui	  x10,0xdeade
	addi	x10,x10,-339  # R[10]=0Xdeaddead
	ecall                 #opcode=0x73，程序中止执行
.data   # 在RARS中可设置数据段从 0x2000 开始
buffer: .word 100
