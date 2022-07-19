module TisburyTreasureHunt

let getCoordinate (line: string * string) : string = snd line

let convertCoordinate (coordinate: string) : int * char =
    (coordinate[0] |> string |> int, coordinate[1])

let compareRecords (azarasData: string * string) (ruisData: string * (int * char) * string) : bool =
    let (_, coordinate, _) = ruisData
    (azarasData |> getCoordinate |> convertCoordinate) = coordinate

let createRecord (azarasData: string * string) (ruisData: string * (int * char) * string): (string * string * string * string) =
    match azarasData, ruisData with
    | (treasure, coordinate), (location, _, quadrant) when compareRecords azarasData ruisData ->
        (coordinate, location, quadrant, treasure)
    | _ -> ("", "", "", "")
