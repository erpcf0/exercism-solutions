-module(rna_transcription).

-export([to_rna/1]).

to_rna(Strand) ->
    lists:map(fun ($G) -> $C;
                  ($C) -> $G;
                  ($T) -> $A;
                  ($A) -> $U;
                  (X) -> X
              end, Strand).