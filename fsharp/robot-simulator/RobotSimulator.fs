module RobotSimulator

type Direction =
    | North
    | East
    | South
    | West

type Position = int * int

type Robot = { Dir: Direction; Pos: Position }

let create direction position = { Dir = direction; Pos = position }

let move instructions robot =
    let dirLeft = function
        | North -> West
        | East -> North
        | South -> East
        | West -> South

    let dirRight d = d |> dirLeft |> dirLeft |> dirLeft

    let step (x, y) =
        function
        | North -> (x, y + 1)
        | East -> (x + 1, y)
        | South -> (x, y - 1)
        | West -> (x - 1, y)

    let step robot str =
        match str, robot with
        | 'A', { Dir = dir; Pos = pos } -> { robot with Pos = step pos dir }
        | 'L', { Dir = dir } -> { robot with Dir = dir |> dirLeft }
        | 'R', { Dir = dir } -> { robot with Dir = dir |> dirRight }
        | _ -> failwith "Invalid instruction"

    instructions |> Seq.fold step robot
