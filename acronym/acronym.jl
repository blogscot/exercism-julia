function acronym(phrase)
    [m.match[1] for m in eachmatch(r"[a-zA-Z']+", phrase)] |> join |> uppercase
end