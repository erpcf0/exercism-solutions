-module(bob).

-export([response/1]).

response(Str) ->
    case string:trim(Str) of
        [] -> "Fine. Be that way!";
        Input -> response(Input, Str)
    end.

response(Input, Str) ->
    Question = string:equal(string:substr(Input, length(Input)), "?"),
    Upper = string:uppercase(Str),
    Scream = (Upper == Str) and (string:lowercase(Str) /= Upper),
    case {Scream, Question} of
        {true, true} -> "Calm down, I know what I'm doing!";
        {false, true} -> "Sure.";
        {true, false} -> "Whoa, chill out!";
        {false, false} -> "Whatever."
    end.
