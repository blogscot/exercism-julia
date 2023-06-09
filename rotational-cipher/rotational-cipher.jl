function rotate(by::Int64, letter::Char)::Char
    rotate_with = ch -> (letter - ch + by) % 26 + ch
    if 'a' <= letter <= 'z'
        rotate_with('a')
    elseif 'A' <= letter <= 'Z'
        rotate_with('A')
    else
        letter
    end
end

rotate(by::Int64, text::String)::String = map(c -> rotate(by, c), text)


macro R13_str(str)
    rotate(13, str)
end

for n in 0:26
    @eval macro $(Symbol(:R, n, :_str))(s)
        rotate($n, s)
    end
end
