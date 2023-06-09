"""
count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.
Invalid strands raise a `DomainError`.
"""
function count_nucleotides(strand)
    counts = Dict(nucleotide => count(==(nucleotide), strand) for nucleotide in "ACGT")
    sum(values(counts)) ≠ length(strand) && throw(DomainError("Valid nucleotides include 'A', 'C', 'G' and 'T'.)"))
    counts
end
