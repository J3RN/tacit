# Tacit

A library to facilitate ["tacit" or "point-free" programming](https://en.wikipedia.org/wiki/Tacit_programming).

For instance, a traditional, pointed function might read:
```elixir
def foo(arg), do: arg |> String.split() |> Enum.reverse()
```

Here, the usage of the point `arg` is just noise, and adds little to the implementation. Contrast this with the Tacit equivalent:

```elixir
let foo = String.split() |> Enum.reverse()
```

The Tacit version is shorter, and contains substantially less syntactic noise.

## Installation

This library is not yet on Hex, as I'm not sure it's generally useful. However, if you want to pull this library into your project, you can update the `deps` function in your `mix.exs` with the following:

```elixir
def deps do
  [
    {:tacit, github: "J3RN/tacit"}
  ]
end
```
