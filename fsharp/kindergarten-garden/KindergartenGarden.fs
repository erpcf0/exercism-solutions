module KindergartenGarden

type Plant =
    | Radishes
    | Clover
    | Grass
    | Violets

let plants (diagram: string) (student: string) =
    let plant = function
        | 'R' -> Radishes
        | 'C' -> Clover
        | 'G' -> Grass
        | _   -> Violets

    let cups = diagram.Split '\n'
    let pos = (List.findIndex (fun x -> x = student.[0]) [ 'A' .. 'L' ]) * 2

    (Seq.toList cups.[0]).[pos .. (pos + 1)] @ (Seq.toList cups.[1]).[pos .. (pos + 1)]
    |> List.map plant
