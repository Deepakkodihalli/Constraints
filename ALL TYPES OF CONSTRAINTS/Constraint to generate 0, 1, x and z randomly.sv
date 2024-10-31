//  Constraint to generate 0, 1, x and z randomly

// Method_1:

class RandomValueGenerator;
  rand logic [1:0] rand_sel; // Selection variable to choose among 0, 1, x, z
  logic rand_val;            // Output value

  // Constraint to ensure rand_sel only takes values 0 to 3
  constraint sel_constraint { rand_sel inside {0, 1, 2, 3}; }

  // Function to generate a random 0, 1, x, or z value
  function logic get_random_val();
    if (!this.randomize()) begin
      $display("Randomization failed");
    end
    case (rand_sel)
      0: rand_val = 1'b0;  // 0
      1: rand_val = 1'b1;  // 1
      2: rand_val = 1'bx;  // x
      3: rand_val = 1'bz;  // z
    endcase
    return rand_val;
  endfunction
endclass

// Test the random generator
module test;
  initial begin
    RandomValueGenerator gen = new();
    foreach (gen.rand_sel[i]) begin
      $display("Random Value: %b", gen.get_random_val());
    end
  end
endmodule

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Method_2:

module test;
  logic rand_val; // Output value

  initial begin
    repeat (10) begin
      case ($urandom_range(0, 3))
        0: rand_val = 1'b0;  // 0
        1: rand_val = 1'b1;  // 1
        2: rand_val = 1'bx;  // x
        3: rand_val = 1'bz;  // z
      endcase
      $display("Random Value: %b", rand_val);
    end
  end
endmodule

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Method_3:

module test;
  logic [1:0] values [0:3] = '{1'b0, 1'b1, 1'bx, 1'bz}; // Array of values
  logic rand_val;

  initial begin
    repeat (10) begin
      rand_val = values[$urandom_range(0, 3)]; // Select a random value
      $display("Random Value: %b", rand_val);
    end
  end
endmodule

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Method_4:

class Randomizer;
  rand int unsigned idx;
  logic [1:0] values [0:3] = '{1'b0, 1'b1, 1'bx, 1'bz};

  constraint idx_constraint { idx inside {[0:3]}; }

  function logic get_random_val();
    this.randomize();
    return values[idx];
  endfunction
endclass

module test;
  initial begin
    Randomizer gen = new();
    repeat (10) begin
      $display("Random Value: %b", gen.get_random_val());
    end
  end
endmodule

