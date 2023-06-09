function all_your_base(digits::Any, base_in::Int, base_out::Int)::Vector{Int}
    base_in < 2 && throw(DomainError("Invalid base_in: $(base_in)"))
    base_out < 2 && throw(DomainError("Invalid base_out: $(base_out)"))
    all(digit -> 0 <= digit < base_in, digits) || throw(DomainError("Invalid digits: $(digits)"))
    isempty(digits) && return [0]

    total = reduce((acc, x) -> base_in * acc + x, digits, init=0)

    result = Int[]
    while total > 0
        (total, rem) = divrem(total, base_out)
        pushfirst!(result, rem)
    end
    isempty(result) ? [0] : result
end
