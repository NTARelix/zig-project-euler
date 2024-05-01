const LIMIT: u64 = 4000000;

pub fn getAnswer() u64 {
    var prev: u64 = 0;
    var current: u64 = 1;
    var even_sum: u64 = 0;
    while (current < LIMIT) {
        if (current % 2 == 0) {
            even_sum += current;
        }
        const next = prev + current;
        prev = current;
        current = next;
    }
    return even_sum;
}
