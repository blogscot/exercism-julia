"Calculates the Hamming Distance between two DNA strands"
function distance(a, b)
    length(a) ≠ length(b) && throw(ArgumentError("Strand lengths are not equal."))
    count(s1 ≠ s2 for (s1, s2) in zip(a, b))
end
