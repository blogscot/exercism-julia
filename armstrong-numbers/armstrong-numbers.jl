function isarmstrong(num::Int)
    ds = digits(num)
    p = length(ds)
    num == sum(d^p for d in ds)
end