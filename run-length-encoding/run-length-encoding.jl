function encode(s)
    join(length(field) |> (l -> l == 1 ? field : string(l) * field[end])
         for field in getfield.(eachmatch(r"(.)\1*", s), :match))
end

function decode(s)
    join([letter^(number == "" ? 1 : parse(Int, number))
          for (number, letter) in eachmatch(r"(\d*)?(.)", s)])
end
