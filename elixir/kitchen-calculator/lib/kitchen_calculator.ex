defmodule KitchenCalculator do
  def get_volume({_, num}), do: num

  def to_milliliter({:milliliter, val}), do: {:milliliter, val}
  def to_milliliter({:cup, val}), do: {:milliliter, val * 240}
  def to_milliliter({:fluid_ounce, val}), do: {:milliliter, val * 30}
  def to_milliliter({:teaspoon, val}), do: {:milliliter, val * 5}
  def to_milliliter({:tablespoon, val}), do: {:milliliter, val * 15}

  def from_milliliter({:milliliter, val}, :milliliter), do: {:milliliter, val}
  def from_milliliter({:milliliter, val}, :cup), do: {:cup, val / 240}
  def from_milliliter({:milliliter, val}, :fluid_ounce), do: {:fluid_ounce, val / 30}
  def from_milliliter({:milliliter, val}, :teaspoon), do: {:teaspoon, val / 5}
  def from_milliliter({:milliliter, val}, :tablespoon), do: {:tablespoon, val / 15}

  def convert(volume_pair, unit) do
    volume_pair |> to_milliliter() |> from_milliliter(unit)
  end
end
