defmodule Streams do
  def test do
    employees = ["Alice", "Bob", "John"]
    employees
    |> Enum.with_index()
    |> Enum.each(fn {employee, index} ->
        IO.puts("#{index + 1}. #{employee}")
      end)
  end

  def test2 do
    stream = Stream.map([1, 2, 3], fn x ->2*x end)
    #Enum.to_list(stream)
    Enum.take(stream, 1)
  end
  def test3 do
    employees = ["Alice", "Bob", "John"]
    employees
    |> Stream.with_index()
    |> Enum.each(fn {employee, index} ->
    IO.puts("#{index + 1}. #{employee}")
    end)
  end
  def test4 do
    [9, -1, "foo", 25, 49]
    |> Stream.filter(&(is_number(&1) and &1 > 0))
    |> Stream.map(&{&1, :math.sqrt(&1)})
    |> Stream.with_index()
    |> Enum.each(fn {{input, result}, index} ->
    IO.puts("#{index + 1}. sqrt(#{input}) = #{result}")
    end)
  end
  def test5 do
    natural_numbers = Stream.iterate(
      1,
      fn previous -> previous + 1 end
      )
      Enum.take(natural_numbers, 10)
  end
  def test6 do
    Stream.repeatedly(fn -> IO.gets("> ") end)
    |> Stream.map(&String.trim_trailing(&1, "\n"))
    |> Enum.take_while(&(&1 != ""))
  end
end
