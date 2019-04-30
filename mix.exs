defmodule OpenapiMerger.MixProject do
  use Mix.Project

  def project do
    [
      app: :openapi_merger,
      version: "0.1.0",
      elixir: "~> 1.7",
      deps: deps(),
      description: "Mix task to merge OpenAPI specs",
      docs: docs(),
      package: package()
    ]
  end

  def package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/ivalentinee/OpenAPI-Merger-Elixir"}
    ]
  end

  defp docs do
    [
      main: "OpenapiMerger",
      source_url: "https://github.com/ivalentinee/OpenAPI-Merger-Elixir"
    ]
  end

  def application, do: []

  defp deps do
    [
      {:deep_merge, "~> 0.1.1"},
      {:jason, "~> 1.1"},
      {:yaml_elixir, "~> 2.1"},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false}
    ]
  end
end
