defmodule Recursion do
  @moduledoc """
  Documentation for `Recursion`.
  """

  def get_equipment_list() do
    ["space Helmet","Space suit","Snacks","Grapling hook","probe"]
  end

  def loop([]), do: nil
  def loop([head|tail]) do
    IO.puts(head)
    loop(tail)
  end

  @spec equipment_count(list()) :: non_neg_integer()
  def equipment_count([]), do: 0
  def equipment_count([_head | tail]), do: 1 + equipment_count(tail) #I'm confuse in this sample

  def format_equipment_list([]), do: []
  def format_equipment_list([head | tail]) do
    [head |> format_string() | format_equipment_list(tail) ]
  end

  defp format_string(value) do
    value |> String.downcase() |> String.replace(" ", "_")
  end

  def occurrence_count([], _value), do: 0
  def occurrence_count([_head | _tail], "Snacks"), do: 400
  def occurrence_count([value | tail], value), do: 1 + occurrence_count(tail, value)
  def occurrence_count([_head | tail], value), do: occurrence_count(tail, value)

  def partial_occurrence([], _value), do: []
  def partial_occurrence([head | tail], value) do
    if String.contains?(format_string(head), format_string(value)) do
       [format_string(head) | partial_occurrence(tail, value)]
    else
      partial_occurrence(tail, value)
    end
  end

end
