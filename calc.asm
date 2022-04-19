//NAME: Casey Quinn
//UIN: 430009866

// File name: calc.asm

// The program develops a calculator application. 
// The operands a and b are integer numbers stored in RAM[0] (R0) and RAM[1] (R1), respectively.
// The operation choice c is stored in RAM[2] (R2), respectively
// if c == 1, do a + b
// if c == 2, do a - b
// if c == 3, do a * b
// if c == 4, do a / b
// For Addition and Subtraction operations the operands a and b can be positive or negative.
// For Multiplication operation only ONE operand can be negative.
// For Division operation BOTH operands must be positive and must be greater than 0.
// Store the final result (quotient for Division) in RAM[3] (R3). Only the Division operation 
// stores the remainder in RAM[4] (R4).


//////  LABELS  ///////
@addition 
@subtraction 
@multiplicationValidation 
@division
@operation 
M = 0

////////// STATE UPDATES ////////////
@negativeCount  // update states for keeping track of a and b neg values
M = 0
@aNeg
M = 0
@bNeg
M = 0
@1024    // update error state
M = 0
@R4 
M = 0
@i      // set i back to 0
M = 0   // i = 0


/////  STORE COMPUTATION TYPE  //////
@R2		// A = 3
D = M	// D = mem[3] = computation_number
// Store the computation number
@operation	// A = operation
M = D	// mem[operation] = D = computation_number


////////  CHECK ADDITION   //////////
@operation 	// A = operation
D = 1
D = D - M	// D = 1 - mem[operation]
@addition
D; JEQ		// Jump to addition label if D == 0


/////// CHECK SUBTRACTION   /////////
@R2	// A = 2
D = A 	// D = 2
@operation
D = D - M 	// D = 2 - mem[operation]
@subtraction
D;JEQ	// Jump to addition label if D == 0


/////// CHECK MULTPLICATION  ////////
@R3	// A = 3
D = A	// D = 3
@operation 
D = D - M	// D = 3 - mem[operation]
@multiplicationValidation
D;JEQ	// Jump to multiplication label if D == 0

/////// CHECK DIVISION //////////
@R4	// A = 4
D = A 	// D = 4
@operation 	
D = D - M 	// D = 4 - mem[operation]
@division
D;JEQ 	// Jump to division if D == 0


///////    ADDITION   ///////////////
(addition)
@R0     // A = 0
D = M   // D = mem[0] = a 
@R1     // A = 1
D = D + M   // D = a + mem[1] = a + b
@R3     // A = 3
M = D   // mem[3] = a + b 
@end
0;JMP
//////  END ADDITION /////////////



/////////   SUBTRACTION  ////////////
(subtraction)
@R0     // A = 0
D = M   // D = mem[0] = a 
@R1     // A = 1
D = D - M   // D = a + mem[1] = a + b
@R3     // A = 3
M = D   // mem[3] = a + b 
@end
0;JMP
//////// END SUBTRACTION ///////////



/////////   MULTIPLICATION  //////////
////////    BEGIN VALIDATION    //////
(multiplicationValidation)
@R0
D = M
@neg1 
D;JLT
(verifyOne)
@R1 
D = M 
@neg2 
D;JLT 
(verifyTwo)
@negativeCount
D = M 
D = D - 1
D = D - 1
@invalidOperation // if 2 negative numbers go to invalid and exit
D;JEQ
///// END VALIDATION ////////

/////// MULTIPLICATION LOOP /////////
@i  // Set i at 0
M = 0
@multSum    // Set mult sum at 0
M = 0
(multLoop)  // mult loop: if i - b >= 0 -> break
    @i  // A = i
    D = M   // D = mem[i]
    @R1  // b
    D = D - M   // condition check
    @continueMult
    D;JGE 

    @i  
    M = M + 1   // increment i 
    @R0     // a 
    D = M   // D = a 
    @multSum
    M = D + M   // sum += a 
    @multLoop
    0;JMP   // jump back to the top of the loop 



/////// VERIFYING a and b for MULTIPLICATION ///////
(neg1) // label for jumping to if a < 0
@negativeCount
D = M 
M = D + 1
@aNeg // set flag for a being negative
M = 1
@R0     // negate if it was negative 
D = M 
D = !D 
D = D + 1
M = D 
@verifyOne
0;JMP 

(neg2) // label for jumping if b < 0
@negativeCount
D = M
M = D + 1
@bNeg // set flag for b being negative
M = 1
@R1     // negate if it was negative 
D = M 
D = !D 
D = D + 1
M = D 
@verifyTwo
0;JMP
//////// END VERIFYING ////////
/////// FINISH MULTIPLCATION COMPUTATION //////
(continueMult)  // check if a or b was negative: if so negate 
@aNeg   // check if a was neg, jump to negative if true
D = M 
@ifOneNegMult
D;JGT
@bNeg   // check if b was negative
D = M 
@ifOneNegMult
D;JGT 
@multSum // if not negative, store result in R3
D = M 
@R3
M = D
@end    // jump to end if it wasnt negative
0;JMP // jump to the end of program


(ifOneNegMult)  // if a or b was negative, negate and then store in R3
@multSum
D = !M 
D = D + 1 // negate the answer
@R3     // store in R3 
M = D 
@end 
0;JMP
///////////// FINISHED MULTIPLCATION ///////////


//////////   DIVISION   ///////////
(division)    // check if a or b < 0 and exit if so
@R0 
D = M   // D = mem[0]
@invalidOperation
D;JLE   // jump out if a <= 0
@R1 
D = M 
@invalidOperation
D;JLE   // jump out if b <= 0


@R0     // checking if b > a, store a as remainder and 0 in R3 then exit
D = M   // D = mem[0]
@a 
M = D   // mem[a] = D = aval
@R1
D = D - M   // D = D - mem[1] = a - b
@bGreaterForDivision
D;JLT   // if b > a, store a as the remainder and 0 in R3 


@i  // i will keep track of number of times we subtract a - b (answer for division)
M = 0   // initial value of i is 0
@R0     // A = R0
D = M   // D = mem[0]
@a  // A = a 
M = D   // mem[a] = aval 
@R1     // A = 1
D = M   // D = mem[R1]
@b  
M = D   // mem[b] = bval
@divisionLoop
(divisionLoop)
    @a 
    D = M   // D = mem[a]
    @b 
    D = D - M   // D = D - mem[b] = a val - bval
    @a  
    M = D   // update a after a-b 
    @end
    D;JLT   // if a - b < 0 the computation is done
    @a
    D = M   //  D = mem[a]
    @R4 
    M = D   // store current remainder
    @i 
    M = M + 1   // increment i 
    D = M   // D = mem[i]
    @R3 
    M = D   // store answer into R3
    @divisionLoop
    0;JMP   // jump back to loop start



(bGreaterForDivision)
@a 
D = M   // D = mem[a] = a 
@R4 
M = D   // store remainder 
@R3     // A = 3
M = 0   // mem[3] = 0
@end 
0;JMP 
////////// FINISHED DIVISION

//////////  INVALID OPERATION  //////////////
// If invalid data set RAM[1024] to -1 and exit
(invalidOperation)
@1024
M = -1
@end
0;JMP



////////   TERMINATION OF PROGRAM   ////////
(end)
@end
0;JMP
