@enum Heading NORTH EAST SOUTH WEST

struct Point{T<:Int}
    x::T
    y::T
end

mutable struct Robot
    position::Point
    heading::Heading
    Robot(position::Tuple{Int,Int}, heading::Heading) = new(Point(position...), heading)
end

position(robot::Robot) = robot.position
heading(robot::Robot) = robot.heading

function turn_right!(robot::Robot)
    robot.heading = mod(Int(robot.heading) + 1, 4) |> Heading
    robot
end

function turn_left!(robot::Robot)
    robot.heading = mod(Int(robot.heading) - 1, 4) |> Heading
    robot
end

Base.:+(a::Point, b::Point) = Point(a.x + b.x, a.y + b.y)

const DELTAS = Dict(
    NORTH => Point(0, 1),
    SOUTH => Point(0, -1),
    EAST => Point(1, 0),
    WEST => Point(-1, 0))

function advance!(robot::Robot)
    robot.position += DELTAS[robot.heading]
    robot
end

const ACTIONS = Dict('A' => advance!, 'R' => turn_right!, 'L' => turn_left!)

function move!(robot::Robot, actions::String)
    [ACTIONS[action](robot) for action in actions]
    robot
end
