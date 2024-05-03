const std = @import("std");

fn isPrime(num: u64) bool {
    const max_potential_factor = num / 2;
    for (2..max_potential_factor) |potential_factor| {
        if (num % potential_factor == 0) {
            return false;
        }
    }
    return true;
}

fn getLargestPrimeFactor(num: u64) u64 {
    var largest_prime_factor: u64 = 1;
    const max_potential_factor = std.math.sqrt(num);
    for (2..max_potential_factor) |potential_factor| {
        if (num % potential_factor == 0 and isPrime(potential_factor)) {
            largest_prime_factor = potential_factor;
        }
    }
    return largest_prime_factor;
}

pub fn getAnswer() u64 {
    return getLargestPrimeFactor(600851475143);
}
