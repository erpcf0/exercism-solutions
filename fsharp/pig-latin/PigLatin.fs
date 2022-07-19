module PigLatin

open System.Text.RegularExpressions

let vowels =
    Regex(@"(?<begin>^|\s+)(?<vowel>a|e|i|o|u|yt|xr)(?<rest>\w+)")

let consonants =
    Regex(@"(?<begin>^|\s+)(?<consonant>ch|qu|thr|th|sch|yt|xr|rh|\wqu|\w)(?<rest>\w+)")

let (|Vowel|Constant|) input =
    if vowels.IsMatch input
    then Vowel
    else Constant

let translate input =
    match input with
    | Vowel -> vowels.Replace(input, "${begin}${vowel}${rest}ay")
    | Constant -> consonants.Replace(input, "${begin}${rest}${consonant}ay")
