defmodule ExUnitEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_unit_ex,
      version: "0.1.1",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      description: description(),
      package: package(),
      name: "ExUnitEx",
      source_url: "https://github.com/sovetnik/ex_unit_ex"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    []
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_env), do: ["lib"]

  defp deps() do
    [
      {:ex_doc, "~> 0.39", only: :dev, runtime: false}
    ]
  end

  defp description do
    "ExUnitEx provides extra assertions for process testing"
  end

  defp package() do
    [
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/sovetnik/ex_unit_ex"}
    ]
  end
end
