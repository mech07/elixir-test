defmodule Maps do
  def given_key do
    squares = Map.new([{1, 1}, {2, 4}, {3, 9}])
    squares[2]
  end

  def get do
    squares = Map.new([{1, 1}, {2, 4}, {3, 9}])
    Map.get(squares, 2)
  end

  def fetch do
    squares = Map.new([{1, 1}, {2, 4}, {3, 9}])
    Map.fetch(squares, 2)
  end

  def structured_data do
     bob = %{:name => "Bob", :age => 25, :works_at => "Initech"}
     bob[:works_at]
     #bob.wors_at
  end
  def change do
    bob = %{:name => "Bob", :age => 25, :works_at => "Initech"}
    _bob = %{bob | age: 26} # change a field value
  end

end
