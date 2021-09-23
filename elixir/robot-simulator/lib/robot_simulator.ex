defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0}) do
    case {direction, position} do
      {value, _} when not (value in [:north, :east, :south, :west]) ->
        {:error, "invalid direction"}

      {value, {x, y} = pos} when is_integer(x) and is_integer(y) ->
        {value, pos}

      {_, _} ->
        {:error, "invalid position"}
    end
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    if !Regex.match?(~r/[^RLA]/, instructions) do
      instructions |> String.graphemes() |> Enum.reduce(robot, &step/2)
    else
      {:error, "invalid instruction"}
    end
  end

  @spec step(String.t(), robot :: any) :: any
  defp step("L", {dir, pos}) do
    case dir do
      :north -> {:west, pos}
      :east -> {:north, pos}
      :south -> {:east, pos}
      :west -> {:south, pos}
    end
  end

  defp step("R", {dir, pos}) do
    case dir do
      :north -> {:east, pos}
      :east -> {:south, pos}
      :south -> {:west, pos}
      :west -> {:north, pos}
    end
  end

  defp step("A", {dir, {x, y}}) do
    case dir do
      :north -> {:north, {x, y + 1}}
      :east -> {:east, {x + 1, y}}
      :south -> {:south, {x, y - 1}}
      :west -> {:west, {x - 1, y}}
    end
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction({direction, _}) do
    direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position({_, position}) do
    position
  end
end
