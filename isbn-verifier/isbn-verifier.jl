struct ISBN
    code::String
    function ISBN(text)
        cleaned = replace(text, r"[^\dX]" => "")
        length(cleaned) != 10 && throw(DomainError("Invalid ISBN $(text)"))
        last_digit = cleaned[10]
        check_digit = last_digit == 'X' ? 10 : last_digit - '0'
        digits = [ch - '0' for ch in cleaned[1:9]]
        total = sum(d * i for (d, i) in zip(digits, 10:-1:2))
        (total + check_digit) % 11 == 0 || throw(DomainError("Invalid ISBN Checksum $(text)"))
        new(cleaned)
    end
end