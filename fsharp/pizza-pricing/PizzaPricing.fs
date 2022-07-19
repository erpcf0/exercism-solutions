module PizzaPricing

type Pizza =
    | Margherita
    | Caprese
    | Formaggio
    | ExtraSauce of Pizza
    | ExtraToppings of Pizza

let pizzaPrice (pizza: Pizza) : int =
    let rec calc pizza acc =
        match pizza with
        | Margherita       -> acc + 7
        | Caprese          -> acc + 9
        | Formaggio        -> acc + 10
        | ExtraSauce pz    -> calc pz (acc + 1)
        | ExtraToppings pz -> calc pz (acc + 2)

    calc pizza 0

let orderPrice (pizzas: Pizza list) : int =
    let rec price pizzas acc =
        match pizzas with
        | p :: ps -> price ps (acc + pizzaPrice p)
        | []      -> acc

    match pizzas.Length with
    | 1 -> price pizzas 3
    | 2 -> price pizzas 2
    | _ -> price pizzas 0

// let pizzaLength = pizzas.Length

// if pizzaLength = 1 then price pizzas 3
// elif pizzaLength = 2 then price pizzas 2
// else price pizzas 0
