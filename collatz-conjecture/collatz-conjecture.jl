function collatz_steps(num)
    num < 1 &&
        throw(DomainError("Argument must be a positive natural number"))
    steps = 0
    while num ≠ 1
        num = iseven(num) ? num ÷ 2 : num * 3 + 1
        steps += 1
    end
    steps
end