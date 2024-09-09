defmodule LinkedListTest do
  use ExUnit.Case
  doctest LinkedList

  describe "get_equipment_list/0" do
    test "return static equipment list" do
      assert LinkedList.get_equipment_list() == ["space Helmet","Space suit","Snacks","Grapling hook","probe"]
    end
  end

  describe "get_first_item/1" do
    test "return the first element from the list" do
      assert LinkedList.get_first_item(["space Helmet","Space suit","Snacks","Grapling hook","probe"]) == "space Helmet"
    end
  end

  describe "remove_first_item" do
    test "removes first element from the list" do
      assert LinkedList.remove_first_item(["space Helmet","Space suit","Snacks","Grapling hook","probe"]) == ["Space suit","Snacks","Grapling hook","probe"]

    end
  end

  describe "add_slow/2" do
    test "adds element to end of list" do
      assert LinkedList.add_slow("new value", ["Space Helmet", "Space Suit", "Snacks", "Grapling Hook", "Probe"]) == ["Space Helmet", "Space Suit", "Snacks", "Grapling Hook", "Probe", "new value"]
    end
  end

  describe "add_fast/2" do
    test "adds element to end of list" do
      assert LinkedList.add_fast("new value", ["Space Helmet", "Space Suit", "Snacks", "Grapling Hook", "Probe"]) == ["Space Helmet", "Space Suit", "Snacks", "Grapling Hook", "Probe", "new value"]
    end
  end

  describe "remove_item/2" do
    test "removes element from list at index" do
      assert LinkedList.remove_item(["Space Helmet", "Space Suit", "Snacks", "Grapling Hook", "Probe"], 2) == ["Space Helmet", "Space Suit", "Grapling Hook", "Probe"]
    end
  end

  describe "equipment_count/1" do
    test "returns length of list" do
      assert LinkedList.equipment_count(["Space Helmet", "Space Suit", "Snacks", "Grapling Hook", "Probe"]) == 5
    end
  end

  describe "check_for_item/2" do
    test "checks for value in list" do
      assert LinkedList.check_for_item(["Space Helmet", "Space Suit", "Snacks", "Grapling Hook", "Probe"], "Probe") == true
    end
  end
end
