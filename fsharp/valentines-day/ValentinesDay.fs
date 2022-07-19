module ValentinesDay

type Approval =
    | Yes
    | No
    | Maybe

type Cuisine =
    | Korean
    | Turkish

type Genre =
    | Crime
    | Horror
    | Romance
    | Thriller

type Activity =
    | BoardGame
    | Chill
    | Movie of genre: Genre
    | Restaurant of cuisine: Cuisine
    | Walk of klm: int

let rateActivity (activity: Activity) : Approval =
    match activity with
    | BoardGame | Chill -> No
    | Movie g when g = Romance -> Yes
    | Restaurant c when c = Korean -> Yes
    | Restaurant c when c = Turkish -> Maybe
    | Walk k when k < 3 -> Yes
    | Walk k when k < 5 -> Maybe
    | _ -> No
