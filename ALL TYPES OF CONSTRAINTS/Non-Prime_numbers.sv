// Write a constraint to generate a non-prime numbers

// Method_1:

class NonPrimeNumber;
  rand int num;

  constraint non_prime_constraint {
    num >= 2;
    !(is_prime(num));
  }

  // Function to check if a number is prime
  function bit is_prime(int n);
    if (n < 2) return 0;
    for (int i = 2; i <= n/2; i++) begin
      if (n % i == 0) return 0;
    end
    return 1;
  endfunction
endclass

/////////////////////////////////////////////////////////////////////////////////////////////////

// Method_2:

class NonPrimeNumber;
  rand int num;
  rand int a, b;

  constraint composite_constraint {
    a >= 2;
    b >= 2;
    num == a * b;
  }
endclass

/////////////////////////////////////////////////////////////////////////////////////////////////

// Method_3:

class NonPrimeNumber;
  rand int num;

  constraint divisible_constraint {
    num >= 4;
    (num % 2 == 0) || (num % 3 == 0);
  }
endclass

