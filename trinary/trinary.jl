function trinary_to_decimal(str)
    total = 0
    for ch in str
        ch ∉ "012" && return 0
        total = total * 3 + parse(Int, ch, base=10)
    end
    total
end
