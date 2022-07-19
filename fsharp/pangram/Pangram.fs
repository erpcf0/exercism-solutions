module Pangram

let isPangram (input: string) : bool =
    [ 'a' .. 'z' ]
    |> Seq.forall (fun c -> input.ToLower() |> Seq.contains c)
