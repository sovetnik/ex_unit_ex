defmodule ExUnitEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_unit_ex,
      version: "0.1.0",
      elixir: "~> 1.14",
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

  defp description do
    "ExUnitEx provides extra assertions"
  end

  defp package() do
    [
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/sovetnik/ex_unit_ex"}
    ]
  end
end
