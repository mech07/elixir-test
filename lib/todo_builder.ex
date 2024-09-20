defmodule TodoBuilder do
  defstruct next_id: 1, entries: %{}
  def new(entries \\ []) do
      Enum.reduce(
      entries,
      %TodoBuilder{},
      fn entry, todo_list_acc -> add_entry(todo_list_acc, entry) end
      )
  end
  def add_entry(todo_list, entry) do
    entry = Map.put(entry, :id, todo_list.next_id)
    new_entries = Map.put(todo_list.entries, todo_list.next_id, entry)

    %TodoBuilder{todo_list | entries: new_entries, next_id: todo_list.next_id + 1}
  end

  def entries(todo_list, date) do
    todo_list.entries
    |> Map.values()
    |> Enum.filter(fn entry -> entry.date == date end)
  end

  def update_entry(todo_list, entry_id, updater_fun) do
    case Map.fetch(todo_list.entries, entry_id) do
      :error ->
        todo_list

      {:ok, old_entry} ->
        new_entry = updater_fun.(old_entry)
        new_entries = Map.put(todo_list.entries, new_entry.id, new_entry)
        %TodoBuilder{todo_list | entries: new_entries}
    end
  end

  def delete_entry(todo_list, entry_id) do
    %TodoBuilder{todo_list | entries: Map.delete(todo_list.entries, entry_id)}
  end

   # New function to list all entries
   def list_all_entries(todo_list) do
    todo_list.entries
    |> Map.values()
  end

  def use_put(todo_list) do
    path = [3, :title]
    new_entries = put_in(todo_list.entries, path, "music")
    %TodoBuilder{todo_list | entries: new_entries}
  end

end

defmodule Input do
  def add do
    entries = [
      %{date: ~D[2023-12-19], title: "Dentist"},
      %{date: ~D[2023-12-20], title: "Shopping"},
      %{date: ~D[2023-12-12], title: "Movies"}
      ]
    entries
    |>TodoBuilder.new()
  end

  def update(todolist) do
    todolist
    |>TodoBuilder.update_entry(1,&Map.put(&1, :date, ~D[2023-12-20]))
  end

end
