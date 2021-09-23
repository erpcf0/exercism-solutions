module Accumulate

let accumulate func input =
    let rec go func acc = function
        | []      -> List.rev acc
        | x :: xs -> go func (func x :: acc) xs
    go func [] input
