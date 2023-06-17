function detect_anagrams(subject, candidates)
    hash = sort ∘ collect ∘ lowercase
    freqs = hash(subject)
    lowered = lowercase(subject)
    filter(c -> lowercase(c) != lowered && hash(c) == freqs, candidates)
end
