function triangle(n)
    n < 0 && throw(DomainError("n must be a positive natural number"))
    n == 0 && return []
    pascal = [[1]]
    [push!(pascal, [1; pascal[end][1:end-1] + pascal[end][2:end]; 1]) for _ in 1:n-1]
    pascal
end
