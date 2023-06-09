const area_code_pos = 1
const exchange_code_pos = 4

function clean(phone_number)
    digits = filter(isdigit, phone_number)
    if first(digits) == '1'
        digits = digits[2:end]
    end
    length(digits) == 10 &&
        digits[area_code_pos] > '1' &&
        digits[exchange_code_pos] > '1' &&
        return digits
    throw(ArgumentError("Invalid phone number $(phone_number)"))
end
