"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    bitmap = 0
    for ch in input
        if ch >= 'a' && ch <= 'z'
            bitmap |= (1 << (ch - 'a'))
        elseif ch >= 'A' && ch <= 'Z'
            bitmap |= (1 << (ch - 'A'))
        end
    end
    bitmap == 0x3ffffff
end
