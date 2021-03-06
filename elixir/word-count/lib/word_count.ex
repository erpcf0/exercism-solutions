defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.split(~r/(_|[^\w\p{Pd}])+/u, trim: true)
    |> Enum.frequencies_by(&String.downcase/1)
  end
end
