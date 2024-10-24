// Write a constraint to generate a prime numbers.

// Method_1:

class PrimeNumberGen;
  rand int unsigned prime_num; // Variable to store the generated prime number
  
  constraint prime_c {
    prime_num inside {[2:100]}; // Range for prime numbers (adjust as needed)
    foreach (prime_num[i]) { // Loop through the range
      !(prime_num % i == 0 && i != 1 && i != prime_num); // Not divisible by any number other than 1 and itself
    }
  }

  // Function to check if a number is prime (for debug purposes)
  function bit is_prime(int unsigned n);
    if (n < 2)
      return 0;
    for (int i = 2; i <= n/2; i++) begin
      if (n % i == 0)
        return 0;
    end
    return 1;
  endfunction
endclass

module test;
  initial begin
    PrimeNumberGen prime_gen = new();
    if (prime_gen.randomize()) begin
      $display("Prime number generated: %0d", prime_gen.prime_num);
    end
    else begin
      $display("Failed to generate a prime number.");
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


