module Clock

type Clock = int * int

let rec create hours minutes =
    match hours, minutes with
    | h, _ when h >= 24 -> create (hours - 24) minutes
    | h, _ when h < 0   -> create (hours + 24) minutes
    | _, m when m >= 60 -> create (hours + 1) (minutes - 60)
    | _, m when m < 0   -> create (hours - 1) (minutes + 60)
    | h, m              -> (h, m)

let add minutes (h, m) =
    create h (m + minutes)

let subtract minutes (h, m) =
    create h (m - minutes)

let display (hours, minutes) =
    sprintf "%02i:%02i" hours minutes
