function transform(input::AbstractDict)
    Dict(lowercase(value) => key for (key, values) in input for value in values)
end
