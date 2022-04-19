// Filename = calc.tst

load calc.asm,
output-file calc.out,
compare-to calc.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[3]%D2.6.2 RAM[4]%D2.6.2;


// Filename = calc.tst

load calc.asm,
output-file calc.out,
compare-to calc.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[3]%D2.6.2 RAM[4]%D2.6.2;


//////// DIVISON TESTS //////

// test 8/2 for even division
set PC 0,
set RAM[0] 8,	// Set test arguments
set RAM[1] 2,
set RAM[2] 4,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0] 8,   // Restore arguments in case program used them as loop counter
set RAM[1] 2,
set RAM[2] 4,
output;


// test with a remainder
set PC 0,
set RAM[0] 8,	// Set test arguments
set RAM[1] 3,
set RAM[2] 4,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0] 8,   // Restore arguments in case program used them as loop counter
set RAM[1] 3,
set RAM[2] 4,
output;


// test with b > a 
set PC 0,
set RAM[0] 7,	// Set test arguments
set RAM[1] 50,
set RAM[2] 4,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0] 7,   // Restore arguments in case program used them as loop counter
set RAM[1] 50,
set RAM[2] 4,
output;


// test a < 0 negative numbers
set PC 0,
set RAM[0] -2,	// Set test arguments
set RAM[1] 4,
set RAM[2] 4,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0] -2,   // Restore arguments in case program used them as loop counter
set RAM[1] 4,
set RAM[2] 4,
output;


// test with b negative
set PC 0,
set RAM[0] 2,	// Set test arguments
set RAM[1] -4,
set RAM[2] 4,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0] 2,   // Restore arguments in case program used them as loop counter
set RAM[1] -4,
set RAM[2] 4,
output;


// test with a = 0
set PC 0,
set RAM[0] 0,	// Set test arguments
set RAM[1] 4,
set RAM[2] 4,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0] 0,   // Restore arguments in case program used them as loop counter
set RAM[1] 4,
set RAM[2] 4,
output;


// test with b = 0
set PC 0,
set RAM[0] 7,	// Set test arguments
set RAM[1] 0,
set RAM[2] 4,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0] 7,   // Restore arguments in case program used them as loop counter
set RAM[1] 0,
set RAM[2] 4,
output;




// SUBTRACTION
set PC 0,
set RAM[0] -2,	// Set test arguments
set RAM[1] -6,
set RAM[2] 2,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0]  -2,   // Restore arguments in case program used them as loop counter
set RAM[1]  -6,
set RAM[2] 2,
output;


// SUBTRACTION
set PC 0,
set RAM[0] -2,	// Set test arguments
set RAM[1] 6,
set RAM[2] 2,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0]  -2,   // Restore arguments in case program used them as loop counter
set RAM[1]  6,
set RAM[2] 2,
output;


// SUBTRACTION
set PC 0,
set RAM[0] 2,	// Set test arguments
set RAM[1] 6,
set RAM[2] 2,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0]  2,   // Restore arguments in case program used them as loop counter
set RAM[1]  6,
set RAM[2] 2,
output;


// ADDITION 
set PC 0,
set RAM[0] 1,	// Set test arguments
set RAM[1] 2,
set RAM[2] 1,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0]  1,   // Restore arguments in case program used them as loop counter
set RAM[1]  2,
set RAM[2] 1,
output;

// ADDITION 
set PC 0,
set RAM[0] -1,	// Set test arguments
set RAM[1] 2,
set RAM[2] 1,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0] -1,   // Restore arguments in case program used them as loop counter
set RAM[1]  2,
set RAM[2] 1,
output;


// SUBTRACTION
set PC 0,
set RAM[0] 9,	// Set test arguments
set RAM[1] 2,
set RAM[2] 2,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0] 9,   // Restore arguments in case program used them as loop counter
set RAM[1] 2,
set RAM[2] 2,
output;



/////////  TESTING MULTPLICATION  /////////
// test two negative numbers
set PC 0,
set RAM[0] -2,	// Set test arguments
set RAM[1] -4,
set RAM[2] 3,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0] -2,   // Restore arguments in case program used them as loop counter
set RAM[1] -4,
set RAM[2] 3,
output;


//// test b negative //////
set PC 0,
set RAM[0] 2,	// Set test arguments
set RAM[1] -4,
set RAM[2] 3,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0] 2,   // Restore arguments in case program used them as loop counter
set RAM[1] -4,
set RAM[2] 3,
output;


////// test no negative /////
set PC 0,
set RAM[0] 3,	// Set test arguments
set RAM[1] 3,
set RAM[2] 3,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0] 3,   // Restore arguments in case program used them as loop counter
set RAM[1] 3,
set RAM[2] 3,
output;


/////// test a negative //////
set PC 0,
set RAM[0] -9,	// Set test arguments
set RAM[1] 9,
set RAM[2] 3,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0] -9,   // Restore arguments in case program used them as loop counter
set RAM[1] 9,
set RAM[2] 3,
output;


// test 8/2 for even division
set PC 0,
set RAM[0] 8,	// Set test arguments
set RAM[1] 2,
set RAM[2] 4,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0] 8,   // Restore arguments in case program used them as loop counter
set RAM[1] 2,
set RAM[2] 4,
output;


// test with a remainder
set PC 0,
set RAM[0] 8,	// Set test arguments
set RAM[1] 3,
set RAM[2] 4,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0] 8,   // Restore arguments in case program used them as loop counter
set RAM[1] 3,
set RAM[2] 4,
output;


// test with b > a 
set PC 0,
set RAM[0] 7,	// Set test arguments
set RAM[1] 50,
set RAM[2] 4,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0] 7,   // Restore arguments in case program used them as loop counter
set RAM[1] 50,
set RAM[2] 4,
output;


// test a < 0 negative numbers
set PC 0,
set RAM[0] -2,	// Set test arguments
set RAM[1] 4,
set RAM[2] 4,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0] -2,   // Restore arguments in case program used them as loop counter
set RAM[1] 4,
set RAM[2] 4,
output;


// test with b negative
set PC 0,
set RAM[0] 2,	// Set test arguments
set RAM[1] -4,
set RAM[2] 4,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0] 2,   // Restore arguments in case program used them as loop counter
set RAM[1] -4,
set RAM[2] 4,
output;


// test with a = 0
set PC 0,
set RAM[0] 0,	// Set test arguments
set RAM[1] 4,
set RAM[2] 4,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0] 0,   // Restore arguments in case program used them as loop counter
set RAM[1] 4,
set RAM[2] 4,
output;


// test with b = 0
set PC 0,
set RAM[0] 7,	// Set test arguments
set RAM[1] 0,
set RAM[2] 4,  
set RAM[3] 0;	// Test that program initialized to 0
repeat 300 {
  ticktock;
}
set RAM[0] 7,   // Restore arguments in case program used them as loop counter
set RAM[1] 0,
set RAM[2] 4,
output;
