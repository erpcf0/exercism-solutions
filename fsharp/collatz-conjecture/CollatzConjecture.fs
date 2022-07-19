module CollatzConjecture

let steps (number: int) : int option =
    let rec step number acc =
        match number with
        | 1                -> acc
        | n when n % 2 = 0 -> step (n / 2) (acc + 1)
        | _                -> step (3 * number + 1) (acc + 1)

    if number <= 0 then None
    else Some(step number 0)
