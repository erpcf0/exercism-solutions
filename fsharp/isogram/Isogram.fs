module Isogram

open System

let isIsogram (str: string) : bool =
    let letters = str.ToLower() |> Seq.filter Char.IsLetter
    Seq.length letters = (Seq.length << Seq.distinct) letters
