# ExUnitEx

ExUnitEx provides extra assertions for testing processes side effects when invoking functions that start or stop several processes. These new assertions are `assert_processes_started`, `assert_processes_stopped`, and `assert_processes_survived` macroses for using in ExUnit tests.

The assertion macros will take in two arguments - the function that starts or stops the processes and a list of expected process side effects. The expected process side effects will be in the form of a keyword list, where each key represents a process and the value is a list of expected side effects for that process. When assertion succeeds, it returns the result of passed function.

```elixir
  defmodule ExUnitEx.AssertionsTest do
    use ExUnit.Case, async: true
    import ExUnitEx.Assertions

    test "assert_processes_started success" do
      assert :processes_started ==
               assert_processes_started(
                 fn -> :processes_started end,
                 registry: %{
                   test_registry_one: :agent_foo,
                   test_registry_two: [:agent_bar, :agent_baz]
                 },
                 names: [:foo, :bar, :baz]
               )
    end
  end
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_unit_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_unit_ex, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/ex_unit_ex>.
