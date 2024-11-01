// Constraint with array size of 5 to 10 values & the array values 
// should be in ascending order

// Method_1:

class AscendingArray;
    rand int arr[];

    constraint size_constraint {
        arr.size inside {[5:10]}; // Ensures the array size is between 5 and 10
    }

    constraint ascending_constraint {
        foreach (arr[i]) {
            if (i > 0) arr[i] >= arr[i-1]; // Ensures ascending order
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
            if (i > 0) arr[i] == arr[i-1] + {$random()%10 + 1}; // Increment each element
        }
    }
endclass

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Method_3:

class AscendingArray;
    rand int arr[];

    constraint size_constraint {
        arr.size inside {[5:10]};
    }

    constraint ascending_constraint {
        arr[0] inside {[0:50]}; // Set initial range for the first element
        foreach (arr[i]) {
            if (i > 0) arr[i] inside {[arr[i-1] + 1: arr[i-1] + 10]}; // Each element 1 to 10 greater
        }
    }
endclass
