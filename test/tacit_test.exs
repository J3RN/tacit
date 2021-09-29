defmodule TacitTest do
  use ExUnit.Case

  defmodule Example do
    import Tacit
    import String, only: [capitalize: 1]

    let remote =
          String.split()
          |> Enum.reverse()

    let anonymous = then(&String.split(&1, ",")) |> Enum.reverse()
    let imported = capitalize
    let local = get_age |> add_one

    defp get_age(%{age: age}), do: age
    defp add_one(arg), do: arg + 1
  end

  test "handles remote functions" do
    assert Example.remote("1 2 3") == ["3", "2", "1"]
  end

  test "handles anonymous functions" do
    assert Example.anonymous("1,2,3") == ["3", "2", "1"]
  end

  test "handles imported functions" do
    assert Example.imported("hello") == "Hello"
  end

  test "handles local functions" do
    assert Example.local(%{name: "J3RN", age: 30}) == 31
  end
end
