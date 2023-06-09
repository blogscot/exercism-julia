isvalid = square -> 0 < square < 65 || throw(DomainError("Valid square values are 1:64"))

"""Calculate the number of grains on square `square`."""
function on_square(square)
    isvalid(square)
    Int128(2)^(square - 1)
end

"""Calculate the total number of grains after square `square`."""
function total_after(square)
    isvalid(square)
    Int128(2)^square - 1
end
