defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """

  @numbers [
    M: 1000,
    CM: 900,
    D: 500,
    CD: 400,
    C: 100,
    XC: 90,
    L: 50,
    XL: 40,
    X: 10,
    IX: 9,
    V: 5,
    IV: 4,
    I: 1
  ]

  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    romans([], number, @numbers)
  end

  defp romans(current, number, [{letter, digit} | _] = list) when number >= digit do
    romans([letter | current], number - digit, list)
  end

  defp romans(current, number, [_ | t]) do
    romans(current, number, t)
  end

  defp romans(current, _, []) do
    current
    |> Enum.reverse()
    |> Enum.map_join("", &to_string/1)
  end

  # @list [I: 1, IV: 4, V: 5, IX: 9, X: 10, XL: 40, L: 50, XC: 90, C: 100, CD: 400, D: 500, CM: 900, M: 1000] |> Enum.reverse()

  # @doc """
  # Convert the number to a roman number.
  # """
  # @spec numeral(pos_integer) :: String.t()
  # def numeral(0), do: ""
  # def numeral(number) do
  #   {roman, arabic} = Enum.find(@list, fn {_k, v} -> number >= v end)
  #   "#{roman}#{numeral(number - arabic)}"
  # end
end
