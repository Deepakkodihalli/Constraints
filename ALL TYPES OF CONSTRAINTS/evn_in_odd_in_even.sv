/* Write a constraint for 4-bit dynamic array. The size of the array 
should be in between 15 to 20. There should be even number in odd 
locations and odd number in even locations*/

//Method_1:

class DynamicArrayExample;
    rand bit [3:0] arr[]; // 4-bit dynamic array

    // Constraint for array size between 15 and 20
    constraint size_c {
        arr.size() inside {[15:20]};
    }

    // Constraint for even and odd placement
    constraint even_odd_c {
        foreach (arr[i]) {
            if (i % 2 == 0) begin
                // Even index, arr[i] should be odd
                arr[i] % 2 == 1;
            end else begin
                // Odd index, arr[i] should be even
                arr[i] % 2 == 0;
            end
        }
    }
endclass

module test;
    initial begin
        DynamicArrayExample example = new();
        if (example.randomize()) begin
            $display("Generated array with constraints:");
            foreach (example.arr[i]) begin
                $display("arr[%0d] = %0d", i, example.arr[i]);
            end
        end else begin
            $display("Failed to generate an array with the given constraints.");
        end
    end
endmodule

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Method_2:

class DynamicArrayExample;
    rand int unsigned arr_size;  // Helper variable for array size
    rand bit [3:0] arr[];        // 4-bit dynamic array

    constraint size_c {
        arr_size inside {[15:20]}; // Size constraint
    }

    constraint array_size_c {
        arr.size() == arr_size; // Set arr.size() equal to arr_size
    }

    // Constraint for even and odd placement
    constraint even_odd_c {
        foreach (arr[i]) {
            if (i % 2 == 0) begin
                arr[i] % 2 == 1; // Odd number at even index
            end else begin
                arr[i] % 2 == 0; // Even number at odd index
            end
        }
    }
endclass

module test;
    initial begin
        DynamicArrayExample example = new();
        if (example.randomize()) begin
            $display("Array size: %0d", example.arr.size());
            $display("Generated array with constraints:");
            foreach (example.arr[i]) begin
                $display("arr[%0d] = %0d", i, example.arr[i]);
            end
        end else begin
            $display("Failed to generate an array with the given constraints.");
        end
    end
endmodule
