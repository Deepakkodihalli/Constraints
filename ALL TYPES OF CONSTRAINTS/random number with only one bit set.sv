//  Generate 32-bit random number with only one bit set (should not use $countones).

// Method_1:

class SingleBitSet;
  rand bit [31:0] one_bit_number;

  constraint single_bit_set {
    one_bit_number == (1 << ( {$urandom_range(31, 0)} ));
  }
endclass

/////////////////////////////////////////////////////////////////////////////////////////////////////