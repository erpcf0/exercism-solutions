-module(hamming).

-export([distance/2]).

distance(Strand1, Strand2) ->
    case length(Strand1) == length(Strand2) of
        true -> distance(Strand1, Strand2, 0);
        false -> {error,
                    "left and right strands must be of equal "
                    "length"}
    end.

distance(Strand, Strand, Acc) -> Acc;
% distance([], [], Acc) -> Acc;
distance([Head | Tail1], [Head | Tail2], Acc) ->
    distance(Tail1, Tail2, Acc);
distance([_ | Tail1], [_ | Tail2], Acc) ->
    distance(Tail1, Tail2, Acc + 1).

