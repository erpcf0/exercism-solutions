module QueenAttack

let create (row, col) =
    0 <= row && row <= 7 && 0 <= col && col <= 7

let canAttack queen1 queen2 =
    match queen1, queen2 with
    | (row1, _), (row2, _) when row1 = row2 -> true
    | (_, col1), (_, col2) when col1 = col2 -> true
    | (row1, col1), (row2, col2) when abs (row1 - row2) = abs (col1 - col2) -> true
    | _ -> false
