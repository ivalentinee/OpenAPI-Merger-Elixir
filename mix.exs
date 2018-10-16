defmodule OpenapiMergerElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :openapi_merger_elixir,
      version: "0.1.0",
      elixir: "~> 1.7",
      deps: deps()
    ]
  end

  def application, do: []

  defp deps do
    [
      {:deep_merge, "~> 0.1.1"},
      {:jason, "~> 1.1"},
      {:yaml_elixir, "~> 2.1"}
    ]
  end
end
