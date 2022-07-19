module GuessingGame

[<Literal>]
let Guess = 42

let reply (guess: int) : string =
    match guess with
    | g when g = Guess -> "Correct"
    | g when abs (Guess - g) = 1 -> "So close"
    | g when g > Guess -> "Too high"
    | _ -> "Too low"
