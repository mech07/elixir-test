defmodule Comprehension do
  def test do
    for x <- [1, 2, 3], y <- [1, 2, 3], do: {x, y, x*y} # means for x for y nested iteration
  end
  def test2 do
    for x <- 1..9, y <- 1..9, do: {x, y, x*y}
  end
end
