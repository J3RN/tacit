defmodule Tacit do
  @moduledoc """
  Facilitate "tacit" or "point-free" programming.
  """

  @doc """
  Define a function using the tacit style.

  ## Examples

    iex> import Tacit
    ...> let foo = String.join <|> Enum.reverse
    ...> foo([1,2,3])
    "321"
  """
  defmacro let({:=, _, [{name, _, nil}, definition]}) do
    quote do
      def(unquote(name)(arg), do: unquote(translate(definition, quote(do: arg))))
    end
  end

  defmacro let(_) do
    raise """
    Could not identify the name of the definition. Please define tacit functions
    in the following style:

        let foo = fun1 . fun2 . fun3

    Parentheses are not supported.
    """
  end

  defp translate({:<|>, _meta1, [tail, {head, _meta2, empty}]}, arg) when empty in [nil, []] do
    translate(tail, compose(head, arg))
  end

  defp translate({name, _meta, _args}, arg) do
    compose(name, arg)
  end

  defp compose(a, b) do
    quote do
      unquote(a)(unquote(b))
    end
  end
end
