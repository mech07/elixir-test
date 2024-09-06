defmodule AllStrings do
  @moduledoc """
  Documentation for `AllStrings`.
  """

  @spec trim_string(binary()) :: binary()
  @doc """
  Returns the given value with leading and trailing spaces removed.

  Returns `string`

  ## Parameters

  - value: string

  ## Examples

      iex> AllStrings.trim_string(" Hi Amy ")
     "Hi Amy"

  """
  def trim_string(value) do
    String.trim(value)
  end


  def first_letter(name) do
    String.trim(name)
    |>String.first()
  end
end
