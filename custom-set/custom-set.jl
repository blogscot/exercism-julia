mutable struct CustomSet{T} <: AbstractSet{T}
    values
    CustomSet(initial::Vector{T}) where {T} =
        new{T}(unique(initial))
end

Base.isempty(s::CustomSet)::Bool = isempty(s.values)

Base.length(s::CustomSet)::Number = length(s.values)

Base.in(value, s::CustomSet)::Bool = value in s.values

issubset(set1::CustomSet, set2::CustomSet)::Bool =
    all(n in set2 for n in set1)

disjoint(set1::CustomSet, set2::CustomSet)::Bool =
    !any(n in set2 for n in set1)

intersect(set1::CustomSet, set2::CustomSet)::CustomSet =
    filter(n -> n in set1, set2.values) |> CustomSet

intersect!(set1::CustomSet, set2::CustomSet) =
    set1.values = filter(n -> n in set1, set2.values)

complement(set1::CustomSet, set2::CustomSet)::CustomSet =
    filter(n -> n ∉ set2.values, set1.values) |> CustomSet

complement!(set1::CustomSet, set2::CustomSet) =
    set1.values = filter(n -> n ∉ set2.values, set1.values)

union(set1::CustomSet, set2::CustomSet)::CustomSet =
    vcat(set1.values, set2.values) |> CustomSet

Base.union!(set1::CustomSet, set2::CustomSet) =
    set1.values = vcat(set1.values, set2.values) |> unique

Base.push!(s::CustomSet, value) =
    value ∉ s && pushfirst!(s.values, value)

Base.iterate(s::CustomSet, state=1) =
    state > length(s) ? nothing : (s.values[state], state + 1)

Base.copy(s::CustomSet)::CustomSet = CustomSet(copy(s.values))

Base.:(==)(set1::CustomSet, set2::CustomSet)::Bool =
    sort(set1.values) == sort(set2.values)
