struct RationalNumber{T} <: Real
    num::T
    den::T
    function RationalNumber(numerator::T, denominator::T=one(T)) where {T}
        numerator == denominator == 0 && throw(ArgumentError(""))
        d = gcd(numerator, denominator)
        sign = denominator < 0 ? -1 : 1
        new{T}(sign * numerator ÷ d, sign * denominator ÷ d)
    end
end

numerator(r::RationalNumber) = r.num
denominator(r::RationalNumber) = r.den

Base.zero(::Type{RationalNumber{T}}) where {T<:Number} = RationalNumber(zero(T), one(T))
Base.one(::Type{RationalNumber{T}}) where {T<:Number} = RationalNumber(one(T), one(T))
Base.:+(a::RationalNumber, b::RationalNumber) =
    RationalNumber(a.num * b.den + a.den * b.num, a.den * b.den)
Base.:-(a::RationalNumber, b::RationalNumber) =
    RationalNumber(a.num * b.den - a.den * b.num, a.den * b.den)
Base.:*(a::RationalNumber, b::RationalNumber) =
    RationalNumber(a.num * b.num, a.den * b.den)
Base.:/(a::RationalNumber, b::RationalNumber) =
    RationalNumber(a.num * b.den, a.den * b.num)
Base.show(io::IO, r::RationalNumber) = print(io, "$(r.num)//$(r.den)")
Base.:abs(r::RationalNumber)::RationalNumber = RationalNumber(abs(r.num), r.den)
Base.:^(n::Real, r::RationalNumber) = n^(r.num / r.den)
Base.:(==)(a::RationalNumber, b::RationalNumber) = a.num == b.num && a.den == b.den
Base.:>(a::RationalNumber, b::RationalNumber) = a.num / a.den > b.num / b.den
Base.:>=(a::RationalNumber, b::RationalNumber) = a.num / a.den >= b.num / b.den
Base.:<(a::RationalNumber, b::RationalNumber) = a.num / a.den < b.num / b.den
Base.:<=(a::RationalNumber, b::RationalNumber) = a.num / a.den <= b.num / b.den
Base.:(==)(a::RationalNumber, c::Real) = a.num / a.den == c
Base.:>(a::RationalNumber, n::Real) = a.num / a.den > n
Base.:>=(a::RationalNumber, n::Real) = a.num / a.den >= n
Base.:<(a::RationalNumber, n::Real) = a.num / a.den < n
Base.:<=(a::RationalNumber, n::Real) = a.num / a.den <= n