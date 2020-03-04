defmodule Dota2ex.MixProject do
  use Mix.Project

  @description """
    Elixir wrapper for the Dota2 Steam API and game data
  """

  def project do
    [
      app: :dota2ex,
      version: "0.1.0",
      elixir: "~> 1.9",
      name: "Dota2ex",
      description: @description,
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      source_url: "https://github.com/elixir-ecto/postgrex"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.6"},
      {:jason, "~> 1.1"}
    ]
  end

  defp package do
    [
      maintainers: ["ekorneeff"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/ekorneeff/dota2ex"}
    ]
  end
end
