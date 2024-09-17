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

#Printing the first n natural numbers
defmodule NaturalNums do
  def print(n) when is_integer(n) and n > 0 do
    print_helper(n)
  end

  def print(_n) do
    {:error, :not_integer}
  end

  defp print_helper(1) do
    IO.puts(1)
  end

  defp print_helper(n) when n > 1 do
    print_helper(n - 1)
    IO.puts(n)
  end
end


#defmodule NaturalNums do
 # def print(1), do: IO.puts(1)
  #def print(n) do
    #print(n - 1)
   # IO.puts(n)
  #end
#end

#Calculating the sum of a list
defmodule ListSum do
  def sum([]), do: 0
  def sum([head | tail]) do
    IO.puts(head)
   head + sum(tail)
  end
end

#Tail-recursive sum of the first n natural numbers
defmodule ListSumV2 do
  def sum(list) do
    do_sum(0, list)
  end
  defp do_sum(current_sum, []) do
    current_sum
  end
  defp do_sum(current_sum, [head | tail]) do
    IO.puts(current_sum)
    new_sum = head + current_sum
    do_sum(new_sum, tail)
  end
end

defmodule EnumRecursion do
  def test(list) do
    Enum.reduce(list,0,fn element, sum -> sum + element end)
  end
  def test_compact(list) do
    Enum.reduce(list, 0, &+/2)
  end
  def test2(list) do
    Enum.reduce(list,0,fn element,
    sum when is_number(element) -> sum + element
    _, sum -> sum
    end)
  end
end
