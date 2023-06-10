function complement(bracket)
    bracket == '(' && return ')'
    bracket == '[' && return ']'
    bracket == '{' && return '}'
end

function matching_brackets(text)
    stack = []
    for ch in text
        if ch ∈ "{[("
            push!(stack, complement(ch))
        elseif ch ∈ "}])"
            if isempty(stack) || pop!(stack) ≠ ch
                return false
            end
        end
    end
    isempty(stack)
end
