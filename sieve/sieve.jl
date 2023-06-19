function sieve(limit)
    primes = fill(true, limit)
    primes[1] = false
    last = isqrt(limit)
    next_prime = 1
    while next_prime < last
        next_prime = findnext(==(1), primes, next_prime + 1)
        for p in next_prime^2:next_prime:limit
            primes[p] = false
        end
    end
    findall(primes)
end
