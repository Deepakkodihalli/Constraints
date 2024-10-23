// Derive odd numbers within the range of 10 to 30 using SV constraint.

// Method_1:

module odd_numbers;
  // Declare a variable to hold the random number
  bit [4:0] rand_num;

  // Create a class with a constraint
  class oddNumber;
    randc bit [4:0] num; // Random number with cyclic behavior

    // Constraint to get only odd numbers between 10 and 30
    constraint odd_c {
      num inside {[11:2:29]}; // Odd numbers between 10 and 30
    }
  endclass

  // Main block to generate random numbers
  initial begin
    oddNumber obj = new();

    // Generate and display 10 random odd numbers within the range
    foreach (rand_num[i]) begin
      if (obj.randomize()) begin
        $display("Random Odd Number: %0d", obj.num);
      end
    end
  end
endmodule

//////////////////////////////////////////////////////////////////////////////////////////////////////////

// Method_2:

module odd_numbers_tb;
  
  // Declare a variable to hold the random number
  bit [4:0] rand_num;
  
  // Create a class with a constraint for generating odd numbers
  class oddNumber;
    randc bit [4:0] num; // Random number with cyclic behavior

    // Constraint to get numbers between 10 and 30, ensuring it's odd
    constraint odd_c {
      num >= 10;
      num <= 30;
      num % 2 == 1; // Ensures the number is odd
    }
  endclass

  // Initial block to generate random numbers
  initial begin
    oddNumber obj = new();

    // Generate and display 10 random odd numbers within the range
    repeat(10) begin
      if (obj.randomize()) begin
        $display("Random Odd Number: %0d", obj.num);
      end
    end
  end

endmodule

//////////////////////////////////////////////////////////////////////////////////////////////////////////

// Method_3:

module odd_numbers_tb;

  // Declare a class for random number generation
  class oddNumber;
    rand bit [4:0] num;

    // Constraint for odd numbers between 10 and 30
    constraint odd_c {
      num >= 11 && num <= 29; // Limit the range
      num[0] == 1;            // Ensure it's odd (LSB == 1)
    }
  endclass

  // Initial block for generating and displaying random odd numbers
  initial begin
    oddNumber obj = new();

    // Generate and display 10 random odd numbers
    repeat(10) begin
      if (obj.randomize()) begin
        $display("Random Odd Number: %0d", obj.num);
      end
    end
  end

endmodule

//////////////////////////////////////////////////////////////////////////////////////////////////////////

// Method_4:

module odd_numbers_tb;

  // Declare a class for random number generation
  class oddNumber;
    rand bit [4:0] num;

    // Constraint using a function to check if the number is odd
    constraint odd_c {
      is_odd(num) && num >= 10 && num <= 30;
    }

    // Function to check if a number is odd
    function bit is_odd(input bit [4:0] value);
      return (value % 2 == 1);
    endfunction
  endclass

  // Initial block to generate random numbers
  initial begin
    oddNumber obj = new();

    // Generate and display 10 random odd numbers within the range
    repeat(10) begin
      if (obj.randomize()) begin
        $display("Random Odd Number: %0d", obj.num);
      end
    end
  end

endmodule


