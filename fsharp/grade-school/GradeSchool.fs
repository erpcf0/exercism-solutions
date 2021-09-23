module GradeSchool

type School = Map<int, string list>

let empty: School = Map.empty

let add (student: string) (grade: int) (school: School): School =
    match Map.tryFind grade school with
    | None   -> Map.add grade [ student ] school
    | Some x -> Map.add grade (student :: x |> List.sort) school

let roster (school: School): string list =
    school
    |> Map.toList
    |> List.collect (fun (_, students) -> students)

let grade (number: int) (school: School): string list =
    Map.tryFind number school
    |> Option.defaultValue []
