-module(strain).

-export([keep/2, discard/2]).

keep(Fn, List) ->
    keep(Fn, List, []).

keep(_, [], Acc) ->
    lists:reverse(Acc);
keep(Fn, [Head | Tail], Acc) ->
    case Fn(Head) of
        true -> keep(Fn, Tail, [Head | Acc]);
        false -> keep(Fn, Tail, Acc)
    end.

discard(Fn, List) ->
    keep(fun (X) -> not Fn(X) end, List, []).
