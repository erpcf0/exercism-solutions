module OcrNumbers

open System

let verify input =
    List.fold (fun acc x -> (String.length x % 3 = 0) && acc) true input

let digit = function
    | " _ | ||_|   " -> "0"
    | "     |  |   " -> "1"
    | " _  _||_    " -> "2"
    | " _  _| _|   " -> "3"
    | "   |_|  |   " -> "4"
    | " _ |_  _|   " -> "5"
    | " _ |_ |_|   " -> "6"
    | " _   |  |   " -> "7"
    | " _ |_||_|   " -> "8"
    | " _ |_| _|   " -> "9"
    | _              -> "?"

let transform list =
    list
    |> Seq.chunkBySize 3
    |> Seq.map (Array.reduce (+) << Array.map string)
    |> Seq.toList

let result input =
    input
    |> List.map transform
    |> List.transpose
    |> List.map (digit << String.concat "")
    |> List.fold (+) ""

let convert (input: string list) =
    match verify input with
    | true when List.length input = 4 -> Some (input |> result)
    | true when List.length input % 4 = 0 ->
        let res =
            input
            |> Seq.chunkBySize 4
            |> Seq.map (result << Seq.toList)
            |> String.concat ","

        Some res
    | _ -> None
