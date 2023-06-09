using Unicode

const TEST_GRAPHEMES = true

function myreverse(s)
    s |> graphemes |> collect |> reverse |> join
end