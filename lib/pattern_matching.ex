defmodule PatternMatching do

  def get_local_date do
    :calendar.local_time()
  end

  def get_date do
    {date, time} = :calendar.local_time()
    {year, month, day} = date
    {hour, minute, second} = time
    "Date: #{month}-#{day}-#{year} - Time: #{hour}:#{minute}:#{second}"
  end

  def get_name do
   # {name, age} = {"Bob", 25}
    #"Your name is #{name} and your age is #{age}"
    person = {:person, "Bob", 25}
    {:person, _name, age} = person
    age
  end
  def identical do
     {amount, amount, amount} = {127, 127, 127}
  end
end
#defmodule Rectangle do
 # def area({a, b}) do
  #a*b
  #end
#end


defmodule User do
  @doc """
Structs may appear in patterns using the percentage sign, the struct module name or a variable
followed by the curly brackets syntax (%{}).
"""
  defstruct [:name]
  def test do
    %User{name: name} = %User{name: "meg"}
    name
  end
  def test2 do
    %struct_name{} = %User{name: "meg"}
    struct_name
  end
end


defmodule Geometry.Test do
  @doc """
multiclause function
"""
  def area({:rectangle, a, b}), do: a*b
  def area({:square, a}), do: a*a
  def area({:circle, r}), do: r * r * 3.14

  #handles the invalid input
  def area(unknown) do
    {:error, {:unknown_shape, unknown}}
  end
  def test do
    fun = &Geometry.Test.area/1
    fun.({:square,5})
  end
end

#The guard is a logical expression that adds further conditions to the pattern
defmodule TestNum do
  def test(x) when is_number(x) and x < 0, do: :negative
  #def test(x) when x == 0, do: :zero
  def test(0), do: :zero
  #this is called when you try test(:notanumber)

  #def test(x) when x > 0 do
   # :positive
  #end
  def test(x) when is_number(x) and x > 0, do: :positive

  def lambda do
    test_num =
        fn
          x when is_number(x) and x < 0 -> :negative
          x when x == 0 -> :zero
          x when is_number(x) and x > 0 -> :positive
        end

        test_num.(-3)
  end
end

defmodule ListHelper do
  def smallest(list) when length(list) > 0 do
    Enum.min(list)
  end
  def smallest(_), do: {:error, :invalid_argument}

  #recursion loop
  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)
end

defmodule TestList do
  def empty?([]), do: true
  def empty?([_|_]), do: false
end

defmodule Polymorphic do
  def double(x) when is_number(x), do: 2*x
  def double(x) when is_binary(x), do: x <> x
end

#recursion
defmodule Fact do
  def fact(0), do: 1
  def fact(n), do: n * fact(n - 1)
end
