const std = @import("std");
const problem1 = @import("./problem1.zig");
const problem2 = @import("./problem2.zig");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("answer 1: {}\n", .{problem1.getAnswer()});
    try stdout.print("answer 2: {}\n", .{problem2.getAnswer()});
}
