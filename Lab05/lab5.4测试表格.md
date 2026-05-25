| PC   | IR       | BusW       | 控制信号                               | 指令功能汇编语句  | DataA      | DataB      |
| ---- | -------- | ---------- | -------------------------------------- | ----------------- | ---------- | ---------- |
| 0x00 | fedca2b7 | 0xfedca000 | ExtOp=1, RegWr=1, ALUASrc=0, ALUBSrc=2 | lui x5, 0xfedca   | 0x00000000 | 0xfedca000 |
| 0x04 | f9c28293 | 0xfedc9f9c | ExtOp=0, RegWr=1, ALUASrc=0, ALUBSrc=2 | addi x5, x5, -100 | 0xfedca000 | 0xffffff9c |
| 0x08 | 01006013 | 0x00000010 | ExtOp=0, RegWr=1, ALUASrc=0, ALUBSrc=2 | ori x0, x0, 16    | 0x00000000 | 0x00000010 |
| 0x0c | 06502223 | 0x00000064 | ExtOp=2, RegWr=0, ALUASrc=0, ALUBSrc=2 | sw x5, 100(x0)    | 0x00000000 | 0x00000064 |
| 0x10 | 06400303 | 0xffffff9c | ExtOp=0, RegWr=1, ALUASrc=0, ALUBSrc=2 | lb x6, 100(x0)    | 0x00000000 | 0x00000064 |
| 0x14 | 06601423 | 0x00000068 | ExtOp=2, RegWr=0, ALUASrc=0, ALUBSrc=2 | sh x6, 104(x0)    | 0x00000000 | 0x00000068 |
| 0x18 | 06405383 | 0x00009f9c | ExtOp=0, RegWr=1, ALUASrc=0, ALUBSrc=2 | lhu x7, 100(x0)   | 0x00000000 | 0x00000064 |
| 0x1c | 06701623 | 0x0000006c | ExtOp=2, RegWr=0, ALUASrc=0, ALUBSrc=2 | sh x7, 108(x0)    | 0x00000000 | 0x0000006c |
| 0x20 | 4042d413 | 0xffedc9f9 | ExtOp=0, RegWr=1, ALUASrc=0, ALUBSrc=2 | srai x8, x5, 4    | 0xfedc9f9c | 0x00000404 |
| 0x24 | 006444b3 | 0x00123665 | ExtOp=0, RegWr=1, ALUASrc=0, ALUBSrc=0 | xor x9, x8, x6    | 0xffedc9f9 | 0xffffff9c |
| 0x28 | 00649533 | 0x50000000 | ExtOp=0, RegWr=1, ALUASrc=0, ALUBSrc=0 | sll x10, x9, x6   | 0x00123665 | 0xffffff9c |
| 0x2c | 008505b3 | 0x4fedc9f9 | ExtOp=0, RegWr=1, ALUASrc=0, ALUBSrc=0 | add x11, x10, x8  | 0x50000000 | 0xffedc9f9 |
| 0x30 | 00b2a633 | 0x00000001 | ExtOp=0, RegWr=1, ALUASrc=0, ALUBSrc=0 | slt x12, x5, x11  | 0xfedc9f9c | 0x4fedc9f9 |
| 0x34 | 00b2b6b3 | 0x00000000 | ExtOp=0, RegWr=1, ALUASrc=0, ALUBSrc=0 | sltu x13, x5, x11 | 0xfedc9f9c | 0x4fedc9f9 |
| 0x38 | 40b287b3 | 0xaeeed5a3 | ExtOp=0, RegWr=1, ALUASrc=0, ALUBSrc=0 | sub x15, x5, x11  | 0xfedc9f9c | 0x4fedc9f9 |
| 0x3c | 06f02823 | 0x00000070 | ExtOp=2, RegWr=0, ALUASrc=0, ALUBSrc=2 | sw x15, 112(x0)   | 0x00000000 | 0x00000070 |
| 0x40 | 0067c263 | 0x00000001 | ExtOp=3, RegWr=0, ALUASrc=0, ALUBSrc=0 | blt x15, x6, 4    | 0xaeeed5a3 | 0xffffff9c |
| 0x44 | 0067d263 | 0x00000001 | ExtOp=3, RegWr=0, ALUASrc=0, ALUBSrc=0 | bge x15, x6, 4    | 0xaeeed5a3 | 0xffffff9c |
| 0x48 | 0040086f | 0x0000004c | ExtOp=4, RegWr=1, ALUASrc=1, ALUBSrc=1 | jal x16, 16       | 0x00000048 | 0x00000004 |
| 0x4c | 004808e7 | 0x00000050 | ExtOp=0, RegWr=1, ALUASrc=1, ALUBSrc=1 | jalr x17, x16, 4  | 0x0000004c | 0x00000004 |
| 0x50 | 00001917 | 0x00001050 | ExtOp=1, RegWr=1, ALUASrc=1, ALUBSrc=2 | auipc x18, 1      | 0x00000050 | 0x00001000 |