const std = @import("std");

fn getDigitCount(num: u64) u64 {
    var digit_count: u64 = 1;
    while (num / std.math.pow(u64, 10, digit_count) > 0) {
        digit_count += 1;
    }
    return digit_count;
}

test "getDigitCount() works as expected" {
    try std.testing.expect(getDigitCount(0) == 1);
    try std.testing.expect(getDigitCount(1) == 1);
    try std.testing.expect(getDigitCount(9) == 1);
    try std.testing.expect(getDigitCount(10) == 2);
    try std.testing.expect(getDigitCount(11) == 2);
    try std.testing.expect(getDigitCount(99) == 2);
    try std.testing.expect(getDigitCount(100) == 3);
    try std.testing.expect(getDigitCount(101) == 3);
    try std.testing.expect(getDigitCount(999) == 3);
    try std.testing.expect(getDigitCount(1000) == 4);
    try std.testing.expect(getDigitCount(1234567890) == 10);
}

fn getDigit(num: u64, pos: u64) u64 {
    const divisor = std.math.pow(u64, 10, pos);
    return (num / divisor) % 10;
}

test "getDigit() works as expected when in bounds" {
    try std.testing.expect(getDigit(0, 0) == 0);
    try std.testing.expect(getDigit(1, 0) == 1);
    try std.testing.expect(getDigit(9, 0) == 9);
    try std.testing.expect(getDigit(12, 0) == 2);
    try std.testing.expect(getDigit(12, 1) == 1);
    try std.testing.expect(getDigit(91, 0) == 1);
    try std.testing.expect(getDigit(91, 1) == 9);
    try std.testing.expect(getDigit(321, 0) == 1);
    try std.testing.expect(getDigit(321, 1) == 2);
    try std.testing.expect(getDigit(321, 2) == 3);
    try std.testing.expect(getDigit(1234567890, 4) == 6);
}

test "getDigit() returns 0 when index is out of bounds" {
    try std.testing.expect(getDigit(0, 1) == 0);
    try std.testing.expect(getDigit(1, 1) == 0);
    try std.testing.expect(getDigit(9, 1) == 0);
    try std.testing.expect(getDigit(10, 2) == 0);
    try std.testing.expect(getDigit(99, 2) == 0);
    try std.testing.expect(getDigit(100, 3) == 0);
    try std.testing.expect(getDigit(1234567890, 10) == 0);
}

fn isPalindrome(num: u64) bool {
    const digit_count = getDigitCount(num);
    for (0..digit_count) |digit_pos| {
        const left_digit = getDigit(num, digit_count - digit_pos - 1);
        const right_digit = getDigit(num, digit_pos);
        if (left_digit != right_digit) {
            return false;
        }
    }
    return true;
}

test "isPalindrome() works as expected" {
    try std.testing.expect(isPalindrome(0) == true);
    try std.testing.expect(isPalindrome(1) == true);
    try std.testing.expect(isPalindrome(9) == true);
    try std.testing.expect(isPalindrome(10) == false);
    try std.testing.expect(isPalindrome(11) == true);
    try std.testing.expect(isPalindrome(12) == false);
    try std.testing.expect(isPalindrome(21) == false);
    try std.testing.expect(isPalindrome(22) == true);
    try std.testing.expect(isPalindrome(23) == false);
    try std.testing.expect(isPalindrome(101) == true);
    try std.testing.expect(isPalindrome(919) == true);
    try std.testing.expect(isPalindrome(991) == false);
    try std.testing.expect(isPalindrome(12345654321) == true);
}

fn getLargestProductPalindrome(low: u64, high: u64) u64 {
    var largest_palindrome: u64 = 0;
    const left_size = high - low + 1;
    for (0..left_size) |x| {
        const left_num = high - x;
        const right_size = left_num - low + 1;
        for (0..right_size) |y| {
            const right_num = left_num - y;
            const product = left_num * right_num;
            if (product < largest_palindrome) {
                break;
            } else if (isPalindrome(product)) {
                largest_palindrome = product;
            }
        }
    }
    return largest_palindrome;
}

pub fn getAnswer() u64 {
    return getLargestProductPalindrome(100, 999);
}
