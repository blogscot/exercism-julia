function count_mines(mines, row, col, num_rows, num_cols)
    v = view(
        mines,
        max(1, row - 1):min(num_rows, row + 1),
        max(1, col - 1):min(num_cols, col + 1)
    )
    sum(v)
end

function annotate(input)
    isempty(input) && return input
    num_rows = length(input)
    num_cols = length(first(input))
    result = ones(String, num_rows)
    mines = [input[r][c] == '*' for r in 1:num_rows, c in 1:num_cols]
    for r in 1:num_rows
        for c in 1:num_cols
            if input[r][c] == ' '
                count = count_mines(mines, r, c, num_rows, num_cols)
                result[r] *= count > 0 ? string(count) : " "
            else
                result[r] *= "*"
            end
        end
    end
    result
end
