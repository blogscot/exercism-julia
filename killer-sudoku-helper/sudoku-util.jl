function combinations(n, k)
    result = []
    k == 1 && return n
    for (index, head) in enumerate(n)
        tail = n[index+1:end]
        for y in combinations(tail, k - 1)
            push!(result, cat(head, y, dims=1))
        end
    end
    result
end

function combinations_in_cage(s, cage)
    cage == 1 && return [[s]]
    filter(xs -> sum(xs) == s, combinations(1:9, cage))
end

function combinations_in_cage(total::Int, cage::Int, restricted)
    results = combinations_in_cage(total, cage)
    filter(xs -> all(x -> x ∉ xs, restricted), results)
end