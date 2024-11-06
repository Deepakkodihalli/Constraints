// Write a constraint to generate a prime numbers.

// Method_1:

class PrimeNumberGen;
  rand int unsigned prime_num; // Variable to store the generated prime number
  
  constraint prime_c {
    prime_num inside {[2:100]}; // Range for prime numbers
  }

  // Function to check if a number is prime (used after random generation)
  function bit is_prime(int unsigned n);
    if (n < 2)
      return 0;
    for (int i = 2; i <= n/2; i++)       //Dividing by 2 in for (int i = 2; i <= n/2; i++) reduces the number of iterations needed, 
                                         // as any factor of n larger than n/2 would necessarily have a corresponding factor smaller than n/2,
                                        // making it redundant to check beyond that point.
     begin  
       if (n % i == 0)
        return 0;
    end
    return 1;
  endfunction
endclass

module test;
  initial begin
    PrimeNumberGen prime_gen = new();
    int attempt = 0;
    bit success = 0;
    while (!success && attempt < 10) begin
      attempt++;
      if (prime_gen.randomize()) begin
        if (prime_gen.is_prime(prime_gen.prime_num)) begin
          $display("Prime number generated: %0d", prime_gen.prime_num);
          success = 1;
        end
      end
    end
    if (!success) begin
      $display("Failed to generate a prime number after %0d attempts.", attempt);
    end
  end
endmodule


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Method_2:

class PrimeNumberGen;
  rand int unsigned prime_num;
  
  constraint prime_c {
    prime_num inside {[2:100]}; // Define a range for prime numbers
    is_prime(prime_num); // Constraint that ensures only prime numbers are generated
  }
  
  // Function to check if a number is prime
  function bit is_prime(int unsigned num);
    if (num <= 1) return 0; // Numbers <= 1 are not prime
    
    /*In the condition for (int i = 2; i * i <= num; i++), we are only checking divisors up to 
    the square root of num.This works because if num has any factors larger than its square root, 
    there must be a corresponding smaller factor that would have already been found below the square root.*/
    
    for (int i = 2; i*i <= num; i++) begin
      if (num % i == 0) return 0; // If divisible by any number other than 1 and itself, it's not prime
    end
    return 1; // Prime number if no divisors were found
  endfunction
endclass

module test;
  initial begin
    PrimeNumberGen prime_gen = new();
    if (prime_gen.randomize()) begin
      $display("Prime number generated: %0d", prime_gen.prime_num);
    end else begin
      $display("Failed to generate a prime number.");
    end
  end
endmodule


