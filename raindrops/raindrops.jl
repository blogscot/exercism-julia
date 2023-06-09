function raindrops(number)
    divBy(n) = number % n == 0
    result = ""
    divBy(3) && (result *= "Pling")
    divBy(5) && (result *= "Plang")
    divBy(7) && (result *= "Plong")
    result ≠ "" ? result : string(number)
end
