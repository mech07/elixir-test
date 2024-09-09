defmodule LinkedList do

@moduledoc """
  Documentation for `Linkedlists` .
"""

def get_equipment_list() do
  ["space Helmet","Space suit","Snacks","Grapling hook","probe"]
end

def get_first_item(list) do
  hd(list)
end

def remove_first_item(list) do
  tl(list)
end

def add_slow(value,list) do
  list ++ [value]
end

def add_fast(value,list)do
  list_reversed = Enum.reverse(list)
  new_list = [value | list_reversed]

  Enum.reverse(new_list)
end

def remove_item(list,index) do
  List.delete_at(list,index)
end

def equipment_count(list) do
  length(list)
end

def check_for_item(list,item) do
  item in list
end


end
