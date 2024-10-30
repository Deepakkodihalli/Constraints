/* Write a constraint such that when rand bit[3:0] a is randomized, 
the value of “a” should not be same as 5 previous occurrences of the 
value of “a” */

// Method_1:

class RandomClass;
  rand bit [3:0] a;
  bit [3:0] previous_values[5]; // Array to store the last 5 values of "a"

  // Constraint to make sure "a" is not equal to any of the last 5 occurrences
  constraint unique_a {
    foreach (previous_values[i]) {
      a != previous_values[i];
    }
  }

  // Task to shift the previous values and store the current "a" value after randomization
  function void update_previous_values();
    previous_values = '{previous_values[1], previous_values[2], previous_values[3], previous_values[4], a};
  endfunction
endclass

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Method_2:

class RandomClass;
  rand bit [3:0] a;
  bit [3:0] previous_values[$]; // Queue to store the last 5 values of "a"

  // Constraint to ensure "a" is not equal to any value in the queue
  constraint unique_a {
    foreach (previous_values[i]) {
      a != previous_values[i];
    }
  }

  // Task to update the queue after each randomization
  function void update_previous_values();
    if (previous_values.size() == 5) 
      previous_values.pop_front(); // Remove the oldest element if the queue has 5 elements
    previous_values.push_back(a);   // Add the new value of "a" to the queue
  endfunction
endclass

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Method_3:

class RandomClass;
  rand bit [3:0] a;
  bit [3:0] previous_values[5]; // Store last 5 occurrences

  // Randomization constraint to make sure the current "a" is not among previous values
  constraint unique_a_constraint {
    foreach (previous_values[i]) {
      a != previous_values[i];
    }
  }

  // Assertion to verify that "a" has a unique value in the last 5 randomizations
  always_ff @(posedge clk) begin
    assert (a != previous_values[0] && 
            a != previous_values[1] && 
            a != previous_values[2] &&
            a != previous_values[3] &&
            a != previous_values[4])
    else $error("Value of 'a' is not unique among the last 5 occurrences.");
  end

  // Shift array in post_randomize
  function void post_randomize();
    previous_values = '{previous_values[1], previous_values[2], previous_values[3], previous_values[4], a};
  endfunction
endclass

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Method_4:

class RandomClass;
  rand bit [3:0] a;
  bit [3:0] previous_values[5];

  // Constraint generation via a recursive method
  function void generate_unique_a();
    bit match_found = 1;
    while (match_found) begin
      match_found = 0;
      a.randomize();
      foreach (previous_values[i]) begin
        if (a == previous_values[i]) begin
          match_found = 1;
          break;
        end
      end
    end
  endfunction

  // Update previous values after randomization
  function void update_previous_values();
    previous_values = '{previous_values[1], previous_values[2], previous_values[3], previous_values[4], a};
  endfunction
endclass

