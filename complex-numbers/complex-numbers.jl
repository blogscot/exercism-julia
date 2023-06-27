struct ComplexNumber <: Number
    real
    imag
    ComplexNumber(real, imag) = new(real, imag)
end

const jm = ComplexNumber(0, 1)

conj(c::ComplexNumber) = ComplexNumber(c.real, -c.imag)
real(c::ComplexNumber) = c.real
imag(c::ComplexNumber) = c.imag
exp(c::ComplexNumber) =
    ℯ^c.real * ComplexNumber(cos(c.imag), sin(c.imag))

Base.:(==)(a::ComplexNumber, b::ComplexNumber) = a.real == b.real && a.imag == b.imag
Base.:(≈)(a::ComplexNumber, b::ComplexNumber) =
    isapprox(a.real, b.real, atol=1e-5) && isapprox(a.imag, b.imag, atol=1e-5)
Base.:+(a::ComplexNumber, b::ComplexNumber) =
    ComplexNumber(a.real + b.real, a.imag + b.imag)
Base.:+(n::Number, c::ComplexNumber) =
    ComplexNumber(n + c.real, c.imag)
Base.:-(a::ComplexNumber, b::ComplexNumber) =
    ComplexNumber(a.real - b.real, a.imag - b.imag)
Base.:-(n::Number, c::ComplexNumber) =
    ComplexNumber(n - c.real, c.imag)
Base.:*(a::ComplexNumber, b::ComplexNumber) =
    ComplexNumber(a.real * b.real - a.imag * b.imag, a.imag * b.real + a.real * b.imag)
Base.:*(n::Number, c::ComplexNumber) =
    ComplexNumber(n * c.real, n * c.imag)
Base.abs(c::ComplexNumber) = sqrt(c.real^2 + c.imag^2)

function Base.:/(a::ComplexNumber, b::ComplexNumber)
    denom = b.real^2 + b.imag^2
    ComplexNumber(
        (a.real * b.real + a.imag * b.imag) / denom,
        (a.imag * b.real - a.real * b.imag) / denom)
end

function Base.show(io::IO, c::ComplexNumber)
    sign = c.imag < 0 ? '-' : '+'
    print(io, "$(c.real) $sign $(abs(c.imag))im")
end
