//2. Constraint to generate unique numbers between 99 to 100.

// Method_1:

class UniqueRealNumbers;
  rand int unique_nums[10]; // Array of 10 integers

  constraint unique_nums_c {
    foreach (unique_nums[i]) unique_nums[i] inside {[990:1000]}; // Range from 990 to 1000
    unique {unique_nums}; // Ensure all numbers are unique
  }

  // Function to print the unique numbers divided by 10
  function void display_numbers();
    foreach (unique_nums[i]) 
      $display("Number[%0d]: %0.1f", i, unique_nums[i] / 10.0); // Divide by 10 when displaying
  endfunction
endclass

module test;
  initial begin
    UniqueRealNumbers u = new();
    if (u.randomize()) begin
      u.display_numbers(); // Display the unique numbers
    end else 
      $display("Constraint failed!");
  end
endmodule

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Method_2:

module JK();
	class eve;
	  rand int val;
	  real out val;
	  
		constraint al {val inside {[990:1000]};}
		
		function void post_randomize();
			out_val = val/10.0; $display("\t\t\t Unique value is %2f", out_val);
		endfunction
		
	endclass
	
	initial 
	begin
		eve p1=new();
		repeat (20)
		begin
		p1.randomize();
		end
	end
endmodule