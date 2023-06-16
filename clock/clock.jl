struct Clock
    minutes
    function Clock(hours, minutes)
        minutes = hours * 60 + minutes
        new(mod(minutes, 24 * 60))
    end
end

Base.:+(clock::Clock, minutes::Dates.Minute)::Clock =
    Clock(0, clock.minutes + minutes.value)

Base.:-(clock::Clock, minutes::Dates.Minute)::Clock =
    Clock(0, clock.minutes - minutes.value)

function Base.show(io::IO, clock::Clock)
    (hours, minutes) = divrem(clock.minutes, 60)
    print(io, "\"$(lpad(hours % 24, 2, '0')):$(lpad(minutes,2,'0'))\"")
end