using Random

const issued_names = Set{String}()

mutable struct Robot
    name::String
    Robot() = new(generate_name()) |> reset!
end

generate_name() = randstring('A':'Z', 2) * join(rand(0:9, 3))

function reset!(instance::Robot)
    while instance.name ∈ issued_names
        instance.name = generate_name()
    end
    push!(issued_names, instance.name)
    instance
end

name(instance::Robot) = instance.name
