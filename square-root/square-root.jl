function square_root(n)
    n >= 0 || throw(DomainError("n must be a positive number"))
    x = n / 2
    while x != 0.5 * (x + n / x)
        x = 0.5 * (x + n / x)
    end
    x
end
