struct ComplexNumber{T<:Real} <: Number
    real::T
    imag::T
end

const jm = ComplexNumber(0, 1)

ComplexNumber(x::Real) = ComplexNumber(x, zero(x))
ComplexNumber(x::Real, y::Real) = ComplexNumber(promote(x, y)...)

real(c::ComplexNumber) = c.real
imag(c::ComplexNumber) = c.imag
conj(c::ComplexNumber) = ComplexNumber(c.real, -c.imag)
exp(c::ComplexNumber) = ℯ^c.real * ComplexNumber(cos(c.imag), sin(c.imag))

Base.:(==)(a::ComplexNumber, b::ComplexNumber) = a.real == b.real && a.imag == b.imag
Base.:(≈)(a::ComplexNumber, b::ComplexNumber) =
    isapprox(a.real, b.real, atol=1e-5) && isapprox(a.imag, b.imag, atol=1e-5)
Base.:+(a::ComplexNumber, b::ComplexNumber) = ComplexNumber(a.real + b.real, a.imag + b.imag)
Base.:+(n::Number, c::ComplexNumber) = ComplexNumber(n) + ComplexNumber(c.real, c.imag)
Base.:-(a::ComplexNumber, b::ComplexNumber) = ComplexNumber(a.real - b.real, a.imag - b.imag)
Base.:-(n::Number, c::ComplexNumber) = ComplexNumber(n) - ComplexNumber(c.real, c.imag)
Base.:*(a::ComplexNumber, b::ComplexNumber) =
    ComplexNumber(a.real * b.real - a.imag * b.imag, a.imag * b.real + a.real * b.imag)
Base.:*(n::Number, c::ComplexNumber) = ComplexNumber(n) * ComplexNumber(c.real, c.imag)
Base.abs(c::ComplexNumber) = hypot(c.real, c.imag)

function Base.:/(a::ComplexNumber, b::ComplexNumber)
    denom = b.real^2 + b.imag^2
    ComplexNumber(
        (a.real * b.real + a.imag * b.imag) / denom,
        (a.imag * b.real - a.real * b.imag) / denom)
end
Base.:/(n::Number, b::ComplexNumber) = ComplexNumber(n) / ComplexNumber(b)

function Base.show(io::IO, c::ComplexNumber)
    sign = c.imag < 0 ? '-' : '+'
    print(io, "$(c.real) $sign $(abs(c.imag))im")
end
