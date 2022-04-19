// NAME: Casey Quinn
// UIN: 430009866

// File name: gcd.asm

// This program calculates the greatest common divisor (gcd) of two given 
// non-negative integers, which are stored in RAM[0] (R0) and RAM[1] (R1). 
// The gcd is stored in RAM[2] (R2).

// set counter 
@i 
M = 0 
@remainder
M = 0

// set a and b 
@R0 
D = M   // D = mem[0]
@a 
M = D  // set aval as mem[R0]

@R1 
D = M 
@b 
M = D   // set bval as mem[R1]

// check if b > a; if so, switch 
@a 
D = M 
@b 
D = D - M   // D = a - b 
@switch 
D;JLT   // jump to switch label if b > a to rearrange 
@divisionLoop
0;JMP   // else jump and start the division


(switch)
@a 
D = M 
@temp 
M = D 
@b 
D = M 
@a 
M = D   // a = b 
@temp 
D = M 
@b 
M = D   // b = a  .. now proceed to division 



(divisionLoop)
    
    @a 
    D = M   // D = mem[a]
    @b 
    D = D - M   // D = D - mem[b] = a val - bval
    @a  
    M = D   // update a after a-b 
    @remainderCheck  
    D;JLT   // if a - b < 0 the computation is done and we can check the remainder (if R=0, then b = GCD)
    
    @a
    D = M   //  D = mem[a]
    @remainder
    M = D   // store current remainder
    @i 
    M = M + 1   // increment i 
    @b 
    D = M 
    @R2 
    M = D // continuously store b val in R2 bc it becomes gcd 

    @divisionLoop
    0;JMP   // jump back to loop start



(remainderCheck) // if remainder is 0 then the computation is complete
@remainder
D = M 
@end 
D;JEQ   // if remainder is 0 jump to end, else set A -> B and B -> R and i -> 0

@b  // update values and repeat the algorithm
D = M 
@a 
M = D 
@remainder 
D = M 
@b 
M = D 
@i 
M = 0
@divisionLoop
0;JMP




(end)
@end
0;JMP