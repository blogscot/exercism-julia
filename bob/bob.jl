function bob(text::AbstractString)::AbstractString
    issilence() = all(isspace, text)
    # digits and punctuation are neither upper nor lowercase
    # also need to check there is a least one uppercase letter
    isyelling() = !any(islowercase, text) && any(isuppercase, text)
    isquestion() = last(rstrip(text)) == '?'

    issilence() && return "Fine. Be that way!"
    if isyelling()
        if isquestion()
            return "Calm down, I know what I'm doing!"
        end
        return "Whoa, chill out!"
    end
    isquestion() && return "Sure."
    return "Whatever."
end
