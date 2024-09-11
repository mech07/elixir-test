defmodule AllStrings do
  @moduledoc """
  Documentation for `AllStrings`.
  """

  @doc """
  Returns the given value with leading and trailing spaces removed.

  Returns `string`

  ## Parameters

  - value: string

  ## Examples

      iex> AllStrings.trim_string(" Hi Amy ")
     "Hi Amy"

  """
  def first_letter(value) do
    String.trim(value)
    |>String.first()
  end

  def initial(value) do
    "#{first_letter(value) |> String.capitalize()}. "
  end

  def initials(full_name) do
    list = String.split(full_name)
    Enum.map(list,fn name->
        initial(name)
    end)
  |>List.to_string()
  |>String.trim()
  end

  def build_saucer() do
    """

                        %%%%%%%%%%%%%%%%%%%%
                   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
      ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ************************************************************
        ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
           ,,,&&&,,,,,,&&&,,,,,,&&&,,,,,,&&&,,,,,,&&&,,,
                ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

    """
  end

  def display_saucer()do
    IO.puts(build_saucer())
  end

  defp customized_spacecraft(full_name) do
    new_string = "********************#{initials(full_name)}'s Spacecraft***********************************"
    "#{build_saucer()}"
    |> String.replace("************************************************************",new_string)
  end

  @doc """
    Return the spacecraft with initials spacecraft

    Returns string

    ## Parameters
    -fullname: string

    ## Example
      iex> AllStrings.display_customized_spacecraft("bloke erling ")
         :ok
    """
  def display_customized_spacecraft(fullname) do
    IO.puts(customized_spacecraft(fullname))
  end

  def s do
    ~s(This is also a string)
    ~S(Not interpolated #{3 + 0.14})
  end
end
