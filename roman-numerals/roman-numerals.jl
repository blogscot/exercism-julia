ROMAN = [(1000, "M")
    (900, "CM")
    (500, "D")
    (400, "CD")
    (100, "C")
    (90, "XC")
    (50, "L")
    (40, "XL")
    (10, "X")
    (9, "IX")
    (5, "V")
    (4, "IV")
    (1, "I")]

function to_roman(number)
    number > 0 || throw(ErrorException("number must be a postive natural number."))
    numerals = ""
    for (value, numeral) in ROMAN
        while number >= value
            numerals *= numeral
            number -= value
        end
    end
    numerals
end
