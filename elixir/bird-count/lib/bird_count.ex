defmodule BirdCount do
  def today([]), do: nil
  def today([t | _]), do: t

  def increment_day_count([]), do: [1]
  def increment_day_count([t | res]), do: [t + 1 | res]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([t | _]) when t == 0, do: true
  def has_day_without_birds?([_ | res]), do: has_day_without_birds?(res)

  def total(list), do: count(list, 0)
  defp count([], acc), do: acc
  defp count([h | t], acc), do: count(t, acc + h)

  def busy_days(list), do: days(list, 0)
  defp days([], acc), do: acc
  defp days([h | t], acc) when h >= 5, do: days(t, acc + 1)
  defp days([_h | t], acc), do: days(t, acc)
end
