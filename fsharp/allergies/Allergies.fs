module Allergies

type Allergen =
    | Eggs         = 1
    | Peanuts      = 2
    | Shellfish    = 4
    | Strawberries = 8
    | Tomatoes     = 16
    | Chocolate    = 32
    | Pollen       = 64
    | Cats         = 128

let inAllergen gen value = gen &&& value = value

let allergicTo (codedAllergies: int) (allergen: Allergen) =
    int allergen |> inAllergen codedAllergies

let list codedAllergies =
    let allergys = int >> inAllergen codedAllergies

    [ Allergen.Eggs
      Allergen.Peanuts
      Allergen.Shellfish
      Allergen.Strawberries
      Allergen.Tomatoes
      Allergen.Chocolate
      Allergen.Pollen
      Allergen.Cats ]
    |> List.filter allergys
