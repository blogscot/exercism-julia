function score(x, y)
    dist = sqrt(x^2 + y^2)
    dist > 10 && return 0
    dist > 5 && return 1
    dist > 1 && return 5
    10
end
