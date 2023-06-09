const Colour = Dict(
    "black" => 0,
    "brown" => 1,
    "red" => 2,
    "orange" => 3,
    "yellow" => 4,
    "green" => 5,
    "blue" => 6,
    "violet" => 7,
    "grey" => 8,
    "white" => 9)

function label(colours)
    resistance = (10Colour[colours[1]] + Colour[colours[2]]) * 10^Colour[colours[3]]
    (kilos, r) = divrem(resistance, 1000)
    r == 0 ? "$kilos kiloohms" : "$resistance ohms"
end
