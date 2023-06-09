function sum_of_multiples(limit, factors)
    factors = filter(>(0), factors)
    sum(n for n in 1:(limit-1) if any(factor -> n % factor == 0, factors))
end
