defmodule ListUtils do
  # A list_len/1 function that calculates the length of a list
  #lenght(list)
  def list_len([]), do: 0  # Base case: An empty list has length 0.

  def list_len([_head | tail]) do
    1 + list_len(tail)  # Recursive case: Add 1 for the head and calculate length of the tail.
  end

  # A range/2 function that takes two integers, from and to, and returns a list of all integer numbers in the given range
  #def range(from, to) when is_integer(from) and is_integer(to) and from <= to do
   # Enum.to_list(from..to)
  #end

  #def range(from, to) when is_integer(from) and is_integer(to) and from > to do
   # Enum.to_list(from..to)
  #end

  # Handle the case where 'from' is less than or equal to 'to'
  def range(from, to) when is_integer(from) and is_integer(to) and from <= to do
    do_range(from, to, [])
  end

  # Handle the case where 'from' is greater than 'to' (reverse range)
  def range(from, to) when is_integer(from) and is_integer(to) and from > to do
    do_reverse_range(from, to, [])
  end

  # Helper function for generating the range when 'from' <= 'to'
  defp do_range(from, to, acc) when from > to do
    Enum.reverse(acc)  # Reverse the accumulated list to return it in the correct order
  end

  defp do_range(from, to, acc) do
    do_range(from + 1, to, [from | acc])  # Add the current 'from' to the list and recurse
  end

  # Helper function for generating the reverse range when 'from' > 'to'
  defp do_reverse_range(from, to, acc) when from < to do
    Enum.reverse(acc)  # Reverse the accumulated list to return it in the correct order
  end

  defp do_reverse_range(from, to, acc) do
    do_reverse_range(from - 1, to, [from | acc])  # Add the current 'from' to the list and recurse
  end


  # A positive/1 function that takes a list and returns another list that contains only the positive numbers from the input list
  #def positive(list) when is_list(list) do
   # Enum.filter(list, fn x -> is_number(x) and x > 0 end)
  #end

  def positive([]), do: []  # Base case: An empty list returns an empty list.

  def positive([head | tail]) when head > 0 do
    [head | positive(tail)]  # Recursive case: Add the positive number to the result.
  end

  def positive([_head | tail]) do
    positive(tail)  # If the head is not positive, skip it and recurse.
  end

end
