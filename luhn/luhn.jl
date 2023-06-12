function luhn(text)
    nums = replace(text, " " => "")
    all(isdigit, collect(nums)) || return false
    length(nums) > 1 || return false
    total = 0
    for (i, n) in enumerate(reverse(nums))
        n = n - '0'
        iseven(i) && (n = n > 4 ? 2n - 9 : 2n)
        total += n
    end
    total % 10 == 0
end
