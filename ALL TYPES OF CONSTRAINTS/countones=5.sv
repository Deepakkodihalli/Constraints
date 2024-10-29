/*  Write a constraint for two random variables such that one 
variable should not match with the other & the total number of bits 
toggled in one variable should be 5 w.r.t the other. */

// Method_1:

class Example;
  rand bit [7:0] var1; // First 8-bit random variable
  rand bit [7:0] var2; // Second 8-bit random variable

  constraint non_matching_constraint {
    var1 != var2; // Constraint to ensure var1 and var2 do not match
  }

  constraint toggle_count_constraint {
    (var1 ^ var2).countones() == 5; // XOR operation counts bit differences
  }
endclass

////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Method_2 :

class Example;
  rand bit [7:0] var1;
  rand bit [7:0] var2;
  int toggle_count;

  constraint non_matching_constraint {
    var1 != var2; // Ensure var1 and var2 do not match
  }

  constraint toggle_count_constraint {
    toggle_count == (var1 ^ var2).countones(); // Calculate toggle count
    toggle_count == 5; // Constrain toggles to 5
  }
endclass

////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Method_3:

class abc;
	rand bit [7:0] datain;
	rand bit [7:0] prev_data;
		constraint d1 {datain != prev_data;}
		constraint ones {$countones (datain) == 5;}
endclass

module jk;
	abc mah;
	initial 
	begin
		m_h = new();
		repeat (25)
		begin
		m h.randomize();
		$display("\t\t\tPrevious_data = %0b", m_h.prev_data); $display("\t\t\tdata = %0b\n", m_h.datain);
		end
	end
endmodule