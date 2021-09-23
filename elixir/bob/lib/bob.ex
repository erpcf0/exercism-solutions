defmodule Bob do
  import String, only: [trim: 1, ends_with?: 2, upcase: 1, downcase: 1]

  def hey(input) do
    cond do
      anything?(input) -> "Fine. Be that way!"
      scream?(input) && question?(input) -> "Calm down, I know what I'm doing!"
      question?(input) -> "Sure."
      scream?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp anything?(input), do: trim(input) == ""
  defp question?(input), do: ends_with?(trim(input), "?")

  defp scream?(input),
    do: upcase(input) == input && downcase(input) !== upcase(input)
end
