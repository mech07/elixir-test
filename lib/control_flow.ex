defmodule ControlFlowStructures do

  def check_max_flying_load(load) do
    if load < 55, do: "Safe to fly!", else: "Too heavy to fly!"
    # unless load < 55, do: "Too heavy to fly!", else: "Safe to fly!"
  end

  def check_fuel_level(percentage) do
    cond do  #conditional
      percentage == 100 -> "full tank"
      percentage > 75 -> "3/4 tank"
      percentage > 49 -> "1/2 tank"
      percentage > 24 -> "1/4 tank"
      true -> "empty tank"
    end
  end

  #sample from the book
  def call_status(call) do
    cond do
      call.ended_at != nil -> :ended
      call.started_at != nil -> :started
      true -> :pending
    end
  end
  def error_code_check(value) do
    case value do
      200 -> :ok
      201 -> :created
      204 -> :no_content
      n when is_integer(n) and n > 299 -> :error #guard
      _ -> :unknown
    end
  end

  def max(a,b) do
    case a >= b do
    true -> a
    false -> b
    end
  end

 # defp convert_lb_to_kg(lb_value), do: lb_value / 2.2

  defp convert_kg_to_lb(kg_value), do: kg_value * 2.2
  def equipment_check(equipment_tuple) do
    case equipment_tuple do
      {weight, unit_type, quantity} when weight / quantity < 16 and unit_type == :kg -> :equipment_cleared #guard
      {weight, unit_type, quantity} when unit_type == :lb ->
        if convert_kg_to_lb(weight) / quantity < 16, do: :equipment_cleared, else: :failed
      _ -> :uknown
    end
  end
end

defmodule ControlFlowTestBook do
  defp extract_login(%{"login" => login}), do: {:ok, login}
  defp extract_login(_), do: {:error, "login missing"}
  defp extract_email(%{"email" => email}), do: {:ok, email}
  defp extract_email(_), do: {:error, "email missing"}
  defp extract_password(%{"password" => password}), do: {:ok, password}
  defp extract_password(_), do: {:error, "password missing"}

  def extract_user(user) do
    case extract_login(user) do
      {:error, reason} ->
        {:error, reason}
      {:ok, login} ->
          case extract_email(user) do
              {:error, reason} ->
                  {:error, reason}
              {:ok, email} ->
                case extract_password(user) do
                  {:error, reason} ->
                     {:error, reason}
                  {:ok, password} ->
                     %{login: login, email: email, password: password}
                end
          end
      end
    end

    #user=%{login=>"mech",email=>"mech@test.com",password=>"test"}
    def extract_user_using_with(user) do
      with {:ok, login} <- extract_login(user),
        {:ok, email} <- extract_email(user),
        {:ok, password} <- extract_password(user) do
          {:ok, %{login: login, email: email, password: password}}
      end
    end

    #user=%{login: "mech",email: "mech@test.com",password: "test"}
    def extract_using_map_fetch(user)do
      with {:ok, login} when login !="" <-Map.fetch(user,:login),
      {:ok,email} when email !="" <- Map.fetch(user,:email),
      {:ok,password} when password !=""<- Map.fetch(user,:password) do
        {:ok, %{login: login, email: email, password: password}}
      else
        :error ->
          {:error,:wrong_data}
        _other_error ->
          :unexpected_error
      end
    end


def file_test(path) do
  with :ok <- validate_extension(path),
  :ok <- validate_exists(path) do
      backup_path = path <> ".backup"
      File.cp!(path, backup_path)
      {:ok, backup_path}
  end
end

defp validate_extension(path) do
  if Path.extname(path) == ".ex", do: :ok, else: {:error, :invalid_extension}
end

defp validate_exists(path) do
  if File.exists?(path), do: :ok, else: {:error, :missing_file}
end
end

#higher-order function

defmodule TestEnum do
  def iterate(list) do
    Enum.each(list, fn x -> IO.puts(x) end)
  end
  def transformation(list) do
    Enum.map(list,&(2 * &1)) #&1 is the current element in the list
  end
end
