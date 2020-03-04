defmodule Dota2ex.MixProject do
  use Mix.Project

  @description """
    Elixir wrapper for the Dota2 API
  """

  def project do
    [
      app: :dota2ex,
      version: "0.1.0",
      elixir: "~> 1.9",
      name: "Dota2Ex",
      description: @description,
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:jason, "~> 1.1"},
      {:json, "~> 1.2"}
    ]
  end
end
