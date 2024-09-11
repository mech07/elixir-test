defmodule Numbers do
  @moduledoc """
  Documentation for `Numbers`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Numbers.hello()
      :world

  """
  def hello(x) do
    value = 1

    # Conditionally update value if x equals 2
    value = if x == 2, do: x + value, else: value

    value + 2
  end
end
