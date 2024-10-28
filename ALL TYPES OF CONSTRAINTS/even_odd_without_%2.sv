// write a constraint to locate even and odd in SV without using %2.

// Method_1:

class EvenOddExample;
    rand int number;

    // Constraint for even number
    constraint even_number_c {
        (number & 1) == 0;
    }

    // Constraint for odd number
    constraint odd_number_c {
        (number & 1) == 1;
    }
endclass

////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Method_2:

constraint even_number_shift {
    (number >> 1) * 2 == number;
}

constraint odd_number_shift {
    (number >> 1) * 2 != number;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Method_3:

constraint even_number_cond {
    (number[0] == 0) ? (number >= 0) : (number == number); // Forces LSB to be 0 for even
}

constraint odd_number_cond {
    (number[0] == 1) ? (number >= 0) : (number == number); // Forces LSB to be 1 for odd
}
