//1) Constraint to generate the pattern 0102030405

// Method_1:

class Pattern;
  rand int data[10];

  constraint pattern_c {
    foreach (data[i]) {
      if (i % 2 == 0)
        data[i] == 0;  // Even indices are 0
      else
        data[i] == i / 2 + 1;  // Odd indices follow the pattern 1, 2, 3, 4, 5
    }
  }
endclass
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Method_2:

class Pattern;
  rand int evens[5];
  rand int odds[5];
  
  constraint pattern_c {
    evens == '{0, 0, 0, 0, 0};  // Even values are 0
    odds == '{1, 2, 3, 4, 5};   // Odd values follow the sequence

    // Combine evens and odds into a single array
    foreach (evens[i]) {
      data[2*i]   == evens[i];
      data[2*i+1] == odds[i];
    }
  }
endclass

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Method_3:

class Pattern;
  int num_pattern[10];  // Array to hold the pattern

  // Function to generate the pattern
  function void generate_pattern();
    for (int i = 0; i < 10; i++) begin
      num_pattern[i] = (i % 2 == 0) ? 0 : (i + 1) / 2;  // Even indices are 0, odd follow 1, 2, 3, 4, 5
    end
  endfunction

  // Function to display the generated pattern
  function void display_pattern();
    foreach (num_pattern[i]) begin
      $display("%0d", num_pattern[i]);  // Display each element in the array
    end
  endfunction
endclass