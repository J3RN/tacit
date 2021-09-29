defmodule TacitTest do
  use ExUnit.Case

  defmodule Example do
    import Tacit

    let foo = Enum.reverse <|> String.split
  end

  test "it works" do
    assert Example.foo("1 2 3") == ["3", "2", "1"]
  end
end
