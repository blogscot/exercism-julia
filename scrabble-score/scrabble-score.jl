const scores = merge(
    Dict(ch => 1 for ch in "aeioulnrst"),
    Dict(ch => 2 for ch in "dg"),
    Dict(ch => 3 for ch in "bcmp"),
    Dict(ch => 4 for ch in "fhvwy"),
    Dict(ch => 5 for ch in "k"),
    Dict(ch => 8 for ch in "jx"),
    Dict(ch => 10 for ch in "qz"),)

function score(str)
    sum(letter -> get(scores, lowercase(letter), 0), str, init=0)
end
