function encode(input)
    buf = IOBuffer()
    count = -1
    for ch in input
        if 'a' <= ch <= 'z'
            ch = 'z' - (ch - 'a')
        elseif 'A' <= ch <= 'Z'
            ch = 'z' - (ch - 'A')
        elseif '0' <= ch <= '9'
            # ch = ch
        else
            continue
        end
        count += 1
        if count == 5
            write(buf, ' ')
            count = 0
        end
        write(buf, ch)
    end
    String(take!(buf))
end

function decode(input)
    buf = IOBuffer()
    for ch in input
        if 'a' <= ch <= 'z'
            ch = 'z' - (ch - 'a')
        elseif 'A' <= ch <= 'Z'
            ch = 'z' - (ch - 'A')
        elseif '0' <= ch <= '9'
            # ch = ch
        else
            continue
        end
        write(buf, ch)
    end
    String(take!(buf))
end
