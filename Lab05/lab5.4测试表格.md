| PC   | IR       | BusW     | 控制信号                            | 指令功能汇编语句 | DataA、DataB 输出值 |
| ---- | -------- | -------- | ----------------------------------- | ---------------- | ------------------- |
| 0    | fedca2b7 | fedca000 | ExtOp=1 RegWr=1 ALUASrc=0 ALUBSrc=2 | lui t0,0xfedca   | 00000000, fedca000  |
| 4    | f9c28293 | fedc9f9c | ExtOp=0 RegWr=1 ALUASrc=0 ALUBSrc=2 | addi t0,t0,-0x64 | fedca000, ffffff9c  |
| 8    | 01006013 | 10       | ExtOp=0 RegWr=1 ALUASrc=0 ALUBSrc=2 | ori x0,x0,0x10   | 00000000, 00000010  |
| c    | 06502223 | 64       | ExtOp=2 RegWr=0 ALUASrc=0 ALUBSrc=2 | sw t1,0x64(x0)   | 00000000, fedc9f9c  |
| 10   | 06400303 | ffffff9c | ExtOp=0 RegWr=1 ALUASrc=0 ALUBSrc=2 | lb t1,0x64(x0)   | 00000000, 00000064  |
| 14   | 06601423 | 68       | ExtOp=2 RegWr=0 ALUASrc=0 ALUBSrc=2 | sh t2,0x68(x0)   | 00000000, ffffff9c  |
| 18   | 06405383 | 9f9c     | ExtOp=0 RegWr=1 ALUASrc=0 ALUBSrc=2 | lhu t2,0x64(x0)  | 00000000, 00000064  |
| 1c   | 06701623 | 6c       | ExtOp=2 RegWr=0 ALUASrc=0 ALUBSrc=2 | sh t3,0x6c(x0)   | 00000000, 00009f9c  |
| 20   | 4042d413 | ffedc9f9 | ExtOp=0 RegWr=1 ALUASrc=0 ALUBSrc=2 | srai t0,t0,0x4   | fedc9f9c, 00000404  |
| 24   | 006444b3 | 123665   | ExtOp=0 RegWr=1 ALUASrc=0 ALUBSrc=0 | xor s1,s2,t0     | ffedc9f9, ffffff9c  |
| 28   | 00649533 | 50000000 | ExtOp=0 RegWr=1 ALUASrc=0 ALUBSrc=0 | sll s2,s2,t0     | 00123665, ffffff9c  |
| 2c   | 008505b3 | 4fedc9f9 | ExtOp=0 RegWr=1 ALUASrc=0 ALUBSrc=0 | add s3,s2,s4     | 50000000, ffedc9f9  |
| 30   | 00b2a633 | 1        | ExtOp=0 RegWr=1 ALUASrc=0 ALUBSrc=0 | slt s4,t0,s3     | fedc9f9c, 4fedc9f9  |
| 34   | 00b2b6b3 | 0        | ExtOp=0 RegWr=1 ALUASrc=0 ALUBSrc=0 | sltu s5,t0,s3    | fedc9f9c, 4fedc9f9  |
| 38   | 40b287b3 | aeeed5a3 | ExtOp=0 RegWr=1 ALUASrc=0 ALUBSrc=0 | sub s6,t0,s3     | fedc9f9c, 4fedc9f9  |
| 3c   | 06f02823 | 70       | ExtOp=2 RegWr=0 ALUASrc=0 ALUBSrc=2 | sw s6,0x70(x0)   | 00000000, aeeed5a3  |
| 40   | 0067c263 | 1        | ExtOp=3 RegWr=0 ALUASrc=0 ALUBSrc=0 | beq s6,t0,0x4    | aeeed5a3, ffffff9c  |
| 44   | 0067d263 | 1        | ExtOp=3 RegWr=0 ALUASrc=0 ALUBSrc=0 | bne s6,t0,0x4    | aeeed5a3, ffffff9c  |
| 48   | 0040086f | 4c       | ExtOp=4 RegWr=1 ALUASrc=1 ALUBSrc=1 | jal ra,0x4c      | 00000048, 00000004  |
| 4c   | 004808e7 | 50       | ExtOp=0 RegWr=1 ALUASrc=1 ALUBSrc=1 | jalr ra,ra,0x4   | 0000004c, 00000004  |
| 50   | 00001917 | 1050     | ExtOp=1 RegWr=1 ALUASrc=1 ALUBSrc=2 | auipc s2,0x1     | 00000050, 00001000  |