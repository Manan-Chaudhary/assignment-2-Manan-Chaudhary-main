.ORIG x3000

TRAP x29

LD R3, A_X
NOT R4, R3
ADD R4, R4, #1
ADD R5, R4, R0

ADD R0, R5, #0
BRzp SKIP_ABS_A_X
NOT R0, R0
ADD R0, R0, #1
SKIP_ABS_A_X

LD R3, A_Y
NOT R4, R3
ADD R4, R4, #1
ADD R5, R4, R1

ADD R1, R5, #0
BRzp SKIP_ABS_A_Y
NOT R1, R1
ADD R1, R1, #1
SKIP_ABS_A_Y

LD R3, A_Z
NOT R4, R3
ADD R4, R4, #1
ADD R5, R4, R2

ADD R2, R5, #0
BRzp SKIP__A_Z
NOT R2, R2
ADD R2, R2, #1
SKIP__A_Z

ADD R6, R0, R1
ADD R6, R6, R2

LD R3, B_X
NOT R4, R3
ADD R4, R4, #1
ADD R5, R4, R0

ADD R0, R5, #0
BRzp SKIP__B_X
NOT R0, R0
ADD R0, R0, #1
SKIP__B_X

LD R3, B_Y
NOT R4, R3
ADD R4, R4, #1
ADD R5, R4, R1

ADD R1, R5, #0
BRzp SKIP__B_Y
NOT R1, R1
ADD R1, R1, #1
SKIP__B_Y

LD R3, B_Z
NOT R4, R3
ADD R4, R4, #1
ADD R5, R4, R2

ADD R2, R5, #0
BRzp SKIP__B_Z
NOT R2, R2
ADD R2, R2, #1
SKIP__B_Z

ADD R7, R0, R1
ADD R7, R7, R2

NOT R3, R6
ADD R3, R3, R7

BRn NEAR_A
BRp NEAR_B

LEA R0, MSG_C
TRAP x28
BR DONE

NEAR_A
LEA R0, MSG_A
TRAP x28
BR DONE

NEAR_B
LEA R0, MSG_B
TRAP x28
BR DONE

DONE
HALT

A_X .FILL #1
A_Y .FILL #2
A_Z .FILL #3
B_X .FILL #20
B_Y .FILL #32
B_Z .FILL #-8

MSG_A  .STRINGZ "The player is closer to Point A"
MSG_B  .STRINGZ "The player is closer to Point B"
MSG_C .STRINGZ "The player is equally far from both points"

.END
