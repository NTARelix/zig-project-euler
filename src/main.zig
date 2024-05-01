const std = @import("std");

pub fn main() !void {
    var sum: u64 = 0;
    for (0..1000) |num| {
        if (num % 3 == 0 or num % 5 == 0) {
            sum += num;
        }
    }
    try std.io.getStdOut().writer().print("{d}", .{sum});
}
