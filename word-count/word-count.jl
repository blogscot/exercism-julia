function wordcount(sentence)
    dict = Dict()
    for word in split(lowercase(sentence), r"'\B|\B'|[^\w']+", keepempty=false)
        dict[word] = get(dict, word, 0) + 1
    end
    dict
end
