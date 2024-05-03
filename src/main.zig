const std = @import("std");
const problem1 = @import("./problem1.zig");
const problem2 = @import("./problem2.zig");
const problem3 = @import("./problem3.zig");
const problem4 = @import("./problem4.zig");
const problem5 = @import("./problem5.zig");
const problem6 = @import("./problem6.zig");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("answer 1: {}\n", .{problem1.getAnswer()});
    try stdout.print("answer 2: {}\n", .{problem2.getAnswer()});
    try stdout.print("answer 3: {}\n", .{problem3.getAnswer()});
    try stdout.print("answer 4: {}\n", .{problem4.getAnswer()});
    try stdout.print("answer 5: {}\n", .{problem5.getAnswer()});
    try stdout.print("answer 6: {}\n", .{problem6.getAnswer()});
}

test {
    std.testing.refAllDecls(@This());
}
