module Bob

let response (input: string): string =
    let inp = input.Trim()
    let question = inp.EndsWith("?")
    let upper = input.ToUpper()

    let scream =
        upper = input && input.ToLower() <> input

    match input with
    | _ when inp = ""           -> "Fine. Be that way!"
    | _ when scream && question -> "Calm down, I know what I'm doing!"
    | _ when question           -> "Sure."
    | _ when scream             -> "Whoa, chill out!"
    | _                         -> "Whatever."
