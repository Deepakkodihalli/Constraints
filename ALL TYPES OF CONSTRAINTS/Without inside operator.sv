//  Without inside operator generate random values for the range 34-43.

// Method_1:

class RandomRangeExample;
    rand int random_value;

    // Constraint to limit the range
    constraint value_range { random_value >= 34 && random_value <= 43; }

    function void display_random_value();
        if (randomize()) begin
            $display("Random value (using constraints): %0d", random_value);
        end else begin
            $display("Randomization failed!");
        end
    end
endclass

// Test
initial begin
    RandomRangeExample example = new();
    example.display_random_value();
end

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Method_2:

int random_value;
initial begin
    random_value = $dist_uniform(seed, 34, 43);
    $display("Random value (using $dist_uniform): %0d", random_value);
end

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Method_3:

int random_value;
initial begin
    random_value = ($urandom % 10) + 34;
    $display("Random value (using $urandom with modulus): %0d", random_value);
end

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Method_4:

int random_value;
initial begin
    random_value = $urandom_range(34, 43);
    $display("Random value (using $urandom_range): %0d", random_value);
end
