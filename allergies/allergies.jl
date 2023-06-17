const ALLERGENS = Dict(
    "eggs" => 1,
    "peanuts" => 2,
    "shellfish" => 4,
    "strawberries" => 8,
    "tomatoes" => 16,
    "chocolate" => 32,
    "pollen" => 64,
    "cats" => 128)

function allergic_to(score, allergen)
    ALLERGENS[allergen] & score > 0
end

function allergy_list(score)
    Set([allergen for (allergen, value) in ALLERGENS if score & value > 0])
end
