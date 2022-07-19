defmodule Username do
  # def sanitize(username) do
  #   sanitized(username, '')
  # end

  # defp sanitized([], acc), do: acc

  # defp sanitized([chr | rest], acc) do
  #   case chr do
  #     ?_ -> sanitized(rest, acc ++ '_')
  #     ?ä -> sanitized(rest, acc ++ 'ae')
  #     ?ö -> sanitized(rest, acc ++ 'oe')
  #     ?ü -> sanitized(rest, acc ++ 'ue')
  #     ?ß -> sanitized(rest, acc ++ 'ss')
  #     c when c >= ?a and c <= ?z -> sanitized(rest, acc ++ [c])
  #     _ -> sanitized(rest, acc)
  #   end
  # end

  def sanitize(username) do
    for c <- username, reduce: '' do
      acc when c == ?_ -> acc ++ '_'
      acc when c == ?ä -> acc ++ 'ae'
      acc when c == ?ö -> acc ++ 'oe'
      acc when c == ?ü -> acc ++ 'ue'
      acc when c == ?ß -> acc ++ 'ss'
      acc when c >= ?a and c <= ?z -> acc ++ [c]
      acc -> acc
    end
  end
end
