fn isPrime(num: u64) bool {
    for (2..num / 2) |potential_factor| {
        if (num % potential_factor == 0) {
            return false;
        }
    }
    return true;
}

fn getLargestPrimeFactor(num: u64) u64 {
    var largest_prime_factor: u64 = 1;
    for (2..num) |potential_factor| {
        if (num % potential_factor == 0 and isPrime(potential_factor)) {
            largest_prime_factor = potential_factor;
        }
    }
    return largest_prime_factor;
}

pub fn getAnswer() u64 {
    return getLargestPrimeFactor(600851475143);
}
