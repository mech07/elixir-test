defmodule Guards do
@moduledoc """
Gaurd begins with when keyword followed by a boolean expression. always return a true or false
"""
  def type(value) when is_integer(value), do: :integer
  def type(value) when is_float(value), do: :float
  def type(value) when not is_number(value), do: :not_number

  def is_single_digit(value) when is_integer(value) and value < 10, do: true
  def is_single_digit(value) when not is_integer(value) or value > 9, do: false

  defguardp is_even(value) when is_integer(value) and rem(value, 2) == 0

  #define default values in headers
  def return_even_numbers(value \\ :empty) # deault value
  def return_even_numbers(value) when is_even(value), do: value
  def return_even_numbers(value) when not is_even(value), do: :not_even

  def is_under_max_load?(load, max_load \\ 55)
  def is_under_max_load?(load, max_load) when is_number(load) and load <= max_load, do: true
  def is_under_max_load?(load, max_load) when not is_number(load) or load > max_load, do: false

end
