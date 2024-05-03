const std = @import("std");

pub fn getSmallestMultiple(low: u8, high: u8) u64 {
    factoring: for (1..std.math.maxInt(u64)) |factor| {
        const potential_multiple = high * factor;
        for (low..high) |num| {
            if (potential_multiple % num != 0) {
                continue :factoring;
            }
        }
        return potential_multiple;
    }
    unreachable;
}

test "getSmallestMultiple() works as expected" {
    try std.testing.expect(getSmallestMultiple(1, 10) == 2520);
    try std.testing.expect(getSmallestMultiple(1, 20) == 232792560);
}

pub fn getAnswer() u64 {
    return getSmallestMultiple(1, 20);
}
