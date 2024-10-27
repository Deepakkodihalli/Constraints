// Write a Constraint to generate a co-prime numbers

// Method_1:

class CoprimeExample;
    rand int a;
    rand int b;

    // Function to compute the GCD of two numbers
    function int gcd(int x, int y);
        while (y != 0) begin
            int temp = y;
            y = x % y;
            x = temp;
        end
        return x;
    endfunction

    // Constraint to make sure a and b are co-prime
    constraint coprime_constraint {
        gcd(a, b) == 1;
    }
endclass

// Testing the constraint
module test;
    initial begin
        CoprimeExample example = new();
        
        if (example.randomize()) begin
            $display("Co-prime numbers generated: a = %0d, b = %0d", example.a, example.b);
        end else begin
            $display("Failed to generate co-prime numbers.");
        end
    end
endmodule

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Method_2:

/* Instead of directly computing the GCD, you can impose constraints to avoid common factors,
   especially if the number range is restricted to small primes. For example, if you're working 
   with a limited range, you can exclude certain multiples:
 */
class CoprimeExampleModular;
    rand int a;
    rand int b;

    constraint range_constraint { a inside {[2:100]}; b inside {[2:100]}; }
    constraint coprime_constraint {
        (a % 2 != 0 || b % 2 != 0); // Ensure one of them is not even
        (a % 3 != 0 || b % 3 != 0); // Ensure one of them is not a multiple of 3
        (a % 5 != 0 || b % 5 != 0); // Ensure one of them is not a multiple of 5
        // Add more constraints based on prime factors as needed
    }
endclass

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Method_3:

/* Using Prime Numbers:
If a or b is a prime number, it is co-prime with any number other than its multiples. 
This can simplify constraints if one of the two numbers is always prime:
*/

class CoprimeExamplePrime;
    rand int prime_a;
    rand int b;

    // Limit prime_a to be within a set of prime numbers
    constraint prime_constraint { prime_a inside {2, 3, 5, 7, 11, 13, 17, 19}; }
    constraint range_constraint { b inside {[2:100]}; }
    constraint coprime_constraint {
        b % prime_a != 0;
    }
endclass
