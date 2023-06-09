tested_bonus_tasks = (rev=true, by=true, lt=true, multiple_matches=true)

function binarysearch(list, item; rev=false, by=identity, lt=<)
    item = by(item)
    if rev
        lt = >
    end
    (isempty(list) || item == 0) && return 1:0
    low = 1
    high = length(list) + 1
    mid = div(low + high, 2)
    while by(list[mid]) ≠ item
        if low == mid
            return high:low
        end
        if lt(by(list[mid]), item)
            low = mid
        else
            high = mid
        end
        mid = div(low + high, 2)
    end
    right = mid
    while right + 1 <= length(list) && list[right+1] == item
        right += 1
    end
    left = mid
    while left - 1 >= 1 && list[left-1] == item
        left -= 1
    end
    left:right
end
