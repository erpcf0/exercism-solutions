-module(accumulate).

-export([accumulate/2]).

accumulate(Fn, Ls) ->
    accumulate(Fn, Ls, []).

accumulate(_, [], Acc) ->
    lists:reverse(Acc);
accumulate(Fn, [Head | Tail], Acc) ->
    accumulate(Fn, Tail, [Fn(Head) | Acc]).
