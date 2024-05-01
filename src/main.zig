const std = @import("std");
const problem1 = @import("./problem1.zig");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("answer 1: {}\n", .{problem1.getAnswer()});
}
