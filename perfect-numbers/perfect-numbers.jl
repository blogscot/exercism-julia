function aliquotsum(num)
    num < 1 && throw(DomainError("$(num) is not a positive natural number."))
    sum(n for n in 1:(num÷2) if num % n == 0)
end

isperfect(num) = aliquotsum(num) == num

isabundant(num) = aliquotsum(num) > num

isdeficient(num) = aliquotsum(num) < num
