// Constraint with array size of 5 to 10 values & the array values 
// should be in descending order

// Method_1:

class AscendingArray;
    rand int arr[];

    constraint size_constraint {
        arr.size inside {[5:10]}; // Ensures the array size is between 5 and 10
    }

    constraint descending_constraint {
        foreach (arr[i]) {
            if (i > 0) arr[i] < arr[i-1]; // Ensures descending order
        }
    }
endclass

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Method_2:

class AscendingArray;
    rand int arr[];

    constraint size_constraint {
        arr.size inside {[5:10]};
    }

    constraint value_constraint {
        arr[0] inside {[0:100]}; // First element in a certain range (0 to 100, for example)
        foreach (arr[i]) {
            if (i > 0) arr[i] == arr[i-1] - {$random()%5}; // decrement each element
        }
    }
endclass

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Method_3:

class DescendingArray;
  rand int unsigned arr[];

  constraint size_constraint {
    arr.size inside {[5:10]}; // Array size between 5 and 10
  }

  function void post_randomize();
    // Sort array in descending order after randomization
    arr.sort();
    arr.reverse();
  endfunction
endclass

