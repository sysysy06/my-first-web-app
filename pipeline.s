# "ldstbnz.s" Last updated: March 27, 2026

# Part 1: Fill all addresses with "1"s
      LI    r0,100
      LI    r1, 2
      LI    r2, 1
      LI    r3, 4
LP1:  ST    0(r1), r2   #ループアンローリング　
      ST    1(r1), r2
      ST    2(r1), r2
      ST    3(r1), r2
      ADD   r1, r1, r3
      nop
      SGT   r5,r1,r0
      nop
      BZ    r5, LP1:
      nop
      nop

# Part 2: Write "0" only to even addresses
      LI    r4, 0 #j=0
      LI    r6, 2 #k=2
DOWH: LD    r5,0(r6)
      nop
      BZ    r5,ENDIF:
      nop
      nop
      ADD   r4,r4,r3

      MLT   r1,r6,r6
      LI    r7,0
LP2:  ST    (r1), r7
      ADD   r1, r1, r6
      nop
      SGT   r5,r1,r0
      nop
      BZ    r5, LP2:
      nop
      nop
ENDIF:ADD   r6,r6,r3
      nop
      SGT   r5,r6,r0
      nop
      BZ    r5, DOWH:
      nop
      nop

# Part 5: Enter an infinite loop to prevent runaway execution
HLT:  B     HLT:
