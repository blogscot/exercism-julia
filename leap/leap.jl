"""
    is_leap_year(year)

Return `true` if `year` is a leap year in the gregorian calendar.

"""
function is_leap_year(year)
    divBy(n) = year % n == 0
    divBy(4) && !divBy(100) || divBy(400)
end

