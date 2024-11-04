// Generate unique values without using rand or randc.

// Method_1:

class OffsetUniqueValuesExample;
    rand int unique_array[5];

    constraint offset_constraint {
        unique_array[0] == 1; // Start value
        foreach (unique_array[i]) {
            if (i > 0) unique_array[i] == unique_array[i-1] + 1;
        }
    }

    function void display();
        $display("Offset Unique Values: %p", unique_array);
    endfunction
endclass

//////////////////////////////////////////////////////////////////////////////////////////////

// Method_2:

class UniqueValuesExample;
    rand int unique_array[5];

    // Constraint to ensure all values in the array are unique
    constraint unique_constraint {
        unique {unique_array};
    }

    function void display();
        $display("Unique Values: %p", unique_array);
    endfunction
endclass
