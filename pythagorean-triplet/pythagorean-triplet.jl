function pythagorean_triplets(num)
    solutions = []
    for a in 3:fld(num, 3)-1
        for b in (a+1):fld(num, 2)-1
            c = num - a - b
            if a^2 + b^2 == c^2
                push!(solutions, (a, b, c))
            end
        end
    end
    solutions
end
