defmodule Geometry do
  def rectangle_area(a, b) do
    a*b
  end
  #def rectangle_area(a, b), do: a * b - condensed form define in a single line
end

defmodule Client do
  import Geometry #imports module
  #alias Rectangle , as: Rec #calls an alias
  alias Geometry.Rectangle
  def run do
    rectangle_area(3, 2)
  end
  def area do
    Rectangle.area(4)
    #Rec.area(2)
  end
end

defmodule Geometry.Rectangle do
  def area(a), do: area(a, a)
  def area(a, b), do: a*b
end
defmodule Rectangle do
  def area(a), do: area(a, a)
  def area(a, b), do: a*b
end

defmodule Calc do
  #def add(a), do: add(a, 0)
  #def add(a, b), do: a+b
  def add(a, b \\ 0), do: a + b #defining default value for argument b
end

#defmodule Circle do
#  @pi 3.14159 #module attribute
 # def area(r), do: r*r*@pi
  #def circumference(r), do: 2*r*@pi
#end
