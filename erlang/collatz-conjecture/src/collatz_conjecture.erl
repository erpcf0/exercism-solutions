-module(collatz_conjecture).

-export([steps/1]).

steps(N) when N =< 0 -> error(badarg);
steps(N) -> step(N, 0).

step(1, Acc) -> Acc;
step(N, Acc) when N rem 2 == 0 -> step(N div 2, Acc + 1);
step(N, Acc) -> step(3 * N + 1, Acc + 1).
