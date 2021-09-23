defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l), do:
    reduce(l, 0, fn(_, x) -> x + 1 end)

  @spec reverse(list) :: list
  def reverse(l), do:
    reduce(l, [], &[&1 | &2])

  @spec map(list, (any -> any)) :: list
  def map(l, f), do:
    reduce(l, [], &[f.(&1) | &2]) |> reverse()

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do:
    reduce(l, [], &if(f.(&1), do: [&1 | &2], else: &2)) |> reverse()

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce([head | tail], acc, f), do: reduce(tail, f.(head, acc), f)

  @spec append(list, list) :: list
  def append(l1, l2), do:
    reduce(l1 |> reverse(), l2, &[&1 | &2])

  @spec concat([[any]]) :: [any]
  def concat(l), do:
    reduce(l |> reverse(), [], &append/2)
end
