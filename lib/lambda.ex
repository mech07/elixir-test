defmodule Lambda do
  def test do
    outside_var = 5
    my_lambda = fn ->
      IO.puts(outside_var)
      end
      my_lambda.()
  end

  def test1 do
    lambda = &(&1 * &2 + &3) #lambda = fn x, y, z -> x * y + z end
    lambda.(2, 3, 4)
  end
end
