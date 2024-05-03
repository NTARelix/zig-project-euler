fn sumOfSquares(count: u8) u64 {
    var sum: u64 = 0;
    for (1..count + 1) |num| {
        sum = sum + (num * num);
    }
    return sum;
}

fn squareOfSum(count: u8) u64 {
    var sum: u64 = 0;
    for (1..count + 1) |num| {
        sum += num;
    }
    return sum * sum;
}

pub fn getAnswer() u64 {
    return squareOfSum(100) - sumOfSquares(100);
}
