#Comprehensions can also be used to iterate, transform, filter, and join various enumerables
defmodule Comprehension do
  def test do
    for x <- [1, 2, 3], y <- [1, 2, 3], do: {x, y, x*y} # means for x for y nested iteration
  end
  def test2 do
    for x <- 1..9, y <- 1..9, do: {x, y, x*y}
  end

  def test3(map) do
    multiplication_table = for x <- 1..9,y <- 1..9,into: %{} do {{x, y}, x*y} end
    #multiplication_table
   Map.get(multiplication_table, map)
  end
  def test4 do
    users = [user: "john", admin: "meg", guest: "barbara"]
    for {type, name} when type != :guest <- users do
      String.upcase(name)
    end
  end
end
