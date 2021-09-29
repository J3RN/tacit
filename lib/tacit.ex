defmodule Tacit do
  @moduledoc """
  Facilitate "tacit" or "point-free" programming.
  """

  @doc """
  Define a function using the tacit style.

  ## Examples

    iex> import Tacit
    ...> let foo = Enum.reverse |> String.join
    ...> foo([1,2,3])
    "321"
  """
  defmacro let({:=, _, [{name, _, nil}, definition]}) do
    quote do
      def(unquote(name)(arg), do: arg |> unquote(definition))
    end
  end

  defmacro let(_) do
    raise """
    Could not parse the definition. Please define tacit functions in the
    following style:

        let foo = fun1 |> fun2 |> fun3
    """
  end
end
