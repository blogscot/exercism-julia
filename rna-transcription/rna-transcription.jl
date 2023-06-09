function to_rna(dna)
    rna = ""
    for ch in dna
        !contains("CGTA", ch) && throw(ErrorException("Invalid input: $(ch)"))
        ch == 'C' && (rna *= "G")
        ch == 'G' && (rna *= "C")
        ch == 'T' && (rna *= "A")
        ch == 'A' && (rna *= "U")
    end
    rna
end

