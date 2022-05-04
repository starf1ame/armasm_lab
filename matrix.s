; int __cdecl matrix_mul(Matrix_0 *dst, const Matrix_0 *src1, const Matrix_0 *src2)
                EXPORT matrix_mul
matrix_mul                              ; CODE XREF: main+6C↓p

src2            = -0x20
src1            = -0x1C
dst             = -0x18
i               = -0x14
j               = -0x10
k               = -0xC
sum             = -8

                PUSH    {R11}
                ADD     R11, SP, #0
                SUB     SP, SP, #0x24
                STR     R0, [R11,#dst]
                STR     R1, [R11,#src1]
                STR     R2, [R11,#src2]
                MOV     R3, #0
                STR     R3, [R11,#sum]
                MOV     R3, #0
                STR     R3, [R11,#i]
                B       loc_10660
; ---------------------------------------------------------------------------

loc_10550                               ; CODE XREF: matrix_mul+14C↓j
                MOV     R3, #0
                STR     R3, [R11,#j]
                B       loc_10640
; ---------------------------------------------------------------------------

loc_1055C                               ; CODE XREF: matrix_mul+12C↓j
                MOV     R3, #0
                STR     R3, [R11,#sum]
                MOV     R3, #0
                STR     R3, [R11,#k]
                B       loc_105EC
; ---------------------------------------------------------------------------

loc_10570                               ; CODE XREF: matrix_mul+D8↓j
                LDR     R3, [R11,#src1]
                LDR     R2, [R3,#8]
                LDR     R3, [R11,#src1]
                LDR     R3, [R3,#4]
                LDR     R1, [R11,#i]
                MUL     R3, R1, R3
                MOV     R1, R3
                LDR     R3, [R11,#k]
                ADD     R3, R1, R3
                MOV     R3, R3,LSL#2
                ADD     R3, R2, R3
                LDR     R3, [R3]
                LDR     R2, [R11,#src2]
                LDR     R1, [R2,#8]
                LDR     R2, [R11,#src2]
                LDR     R2, [R2,#4]
                LDR     R0, [R11,#k]
                MUL     R2, R0, R2
                MOV     R0, R2
                LDR     R2, [R11,#j]
                ADD     R2, R0, R2
                MOV     R2, R2,LSL#2
                ADD     R2, R1, R2
                LDR     R2, [R2]
                MUL     R3, R2, R3
                LDR     R2, [R11,#sum]
                ADD     R3, R2, R3
                STR     R3, [R11,#sum]
                LDR     R3, [R11,#k]
                ADD     R3, R3, #1
                STR     R3, [R11,#k]

loc_105EC                               ; CODE XREF: matrix_mul+48↑j
                LDR     R3, [R11,#src1]
                LDR     R3, [R3,#4]
                LDR     R2, [R11,#k]
                CMP     R2, R3
                BLT     loc_10570
                LDR     R3, [R11,#dst]
                LDR     R2, [R3,#8]
                LDR     R3, [R11,#dst]
                LDR     R3, [R3,#4]
                LDR     R1, [R11,#i]
                MUL     R3, R1, R3
                MOV     R1, R3
                LDR     R3, [R11,#j]
                ADD     R3, R1, R3
                MOV     R3, R3,LSL#2
                ADD     R3, R2, R3
                LDR     R2, [R11,#sum]
                STR     R2, [R3]
                LDR     R3, [R11,#j]
                ADD     R3, R3, #1
                STR     R3, [R11,#j]

loc_10640                               ; CODE XREF: matrix_mul+34↑j
                LDR     R3, [R11,#src2]
                LDR     R3, [R3,#4]
                LDR     R2, [R11,#j]
                CMP     R2, R3
                BLT     loc_1055C
                LDR     R3, [R11,#i]
                ADD     R3, R3, #1
                STR     R3, [R11,#i]

loc_10660                               ; CODE XREF: matrix_mul+28↑j
                LDR     R3, [R11,#src1]
                LDR     R3, [R3]
                LDR     R2, [R11,#i]
                CMP     R2, R3
                BLT     loc_10550
                MOV     R3, #0
                MOV     R0, R3
                MOV     SP, R11
                POP     {R11}
                BX      LR
; End of function matrix_mul