//NAME: Casey Quinn
//UIN: 430009866

// File name: palin.asm

// The program develops a Palindrome checker application. 
// The input to the program is a 5 digit integer A and is stored in RAM[0] (R0).
// A helper value of 10 is stored in RAM[8] (R8) by virtue of the tst file command.
// Number A is a positive integer.
// A has exactly 5 digits and no more no less.

// Program functions as follows: 
// Extract the individual digits from number A and store them in R2-R6 registers in that order.
// Result of 1 is stored in R1 if the number A is a Palindrome else result of 0 is stored in R1

@R0     // A = 0
D = M   // D = mem[0] = entireNumber
@entireNumber
M = D   // stored 5 digit number

/////// Loop 1 ////////
@i  //  i  will become the first 4 numbers
M = 0   // set to 0

@loopOne
0;JMP    // first loop will separate abcde into ab and cde --> i becomes ab and entireNumber becomes cde
(loopOne)
    @i 
    M = M + 1    // increment i
    @entireNumber
    D = M   // D = mem[entireNumber] 
    @10
    D = D - A   // D = D - 10
    @entireNumber
    M = D   // update number

    @entireNumber
    D = M
    @10
    D = D - A
    @continue1  // if number becomes less than 0 jump to continue1
    D;JLT
    
    @loopOne  // else do it again
    0;JMP



(continue1)
@i      // i is now abcd
D = M 
@firstFourNums
M = D   // store the first four numbers in better variable
//@R2     // for debugging store first 4 in R2
//M = D

@entireNumber // entireNumber is now e 
D = M
@R2
M = D


@j 
M = 0   // set second counter 
@loopTwo    // // separate the first two numbers 
(loopTwo)
    @j 
    M = M + 1
    @firstFourNums
    D = M   // 
    @10
    D = D - A 
    @firstFourNums
    M = D   // update the first two nums

    @firstFourNums
    D = M 
    @10
    D = D - A 
    @continue2
    D;JLT       // jump out to continue2 if the number becomes less than 0
    @loopTwo
    0;JMP 


(continue2)
@j  // j is now the first three numbers
D = M 
//@R2 
//M = D  // store first three into R2 
@firstThreeNums     // make more descriptive variable
M = D

@firstFourNums   // first four nums has become d 
D = M 
@R3
M = D   // store second number in R3

// work on the last three numbers now 
@k 
M = 0   // set the counter 
@loopThree 
(loopThree)  // k will become c and lastThreeNums will become de 
    @k 
    M = M + 1    // increment k
    @firstThreeNums
    D = M 
    @10
    D = D - A   // decrease 
    @firstThreeNums
    M = D   // update the last three nums

    @firstThreeNums
    D = M 
    @10
    D = D - A 
    @continue3
    D;JLT 
    @loopThree
    0;JMP 


(continue3)
@k  // k is now the first two nums
D = M 
@firstTwoNums   // make better variable again
M = D
//@R2
//M = D


@firstThreeNums  // firstThreeNums is now c
D = M 
@R4
M = D   // update to a better variable 


// now work on the last two numbers 
@l 
M = 0 // set last counter 
@loopFour
(loopFour)  // last two will split and become d e 
    @l
    M = M + 1   // increment the counter 
    @firstTwoNums
    D = M   // D = ab
    @10
    D = D - A 
    @firstTwoNums
    M = D   // update the last two nums

    @firstTwoNums    // do the check
    D = M 
    @10
    D = D - A 
    @continue4
    D;JLT       // jump out to continue4 if the number becomes less than 0
    @loopFour
    0;JMP     

(continue4)
@l 
D = M   // l is now a
@R6
M = D 

@firstTwoNums    // last two nums became b
D = M 
@R5
M = D   // store the last number 

// now checking if it is a palindrome or not 
// compare R2 and R6 -> if mem[R2] = mem[R6] != 0, jump to end
@R2 
D = M 
@R6 
D = D - M 
@end 
D;JNE 

// compare R3 and R5 -> if mem[R3] = mem[R5] != 0, jump to end
@R3 
D = M 
@R5 
D = D - M 
@end 
D;JNE 

// if we make it here then it is indeed a palindrome 
@R1 
M = 1

(end)
@end
0;JMP 


