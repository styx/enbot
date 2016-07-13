defmodule Enbot.Mixfile do
  use Mix.Project

  def project do
    [app: :enbot,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Type "mix help compile.app" for information
  def application do
    [
      applications: [
        :logger,
        :nadia,
        :httpoison,
        :timex,
      ],
      mod: {Enbot, []},
    ]
  end

  # Type "mix help deps" for examples and options
  defp deps do
    [
      {:nadia, "~> 0.4"},
      {:credo, "~> 0.4", only: [:dev, :test]},
      {:httpoison, "~> 0.9"},
      {:floki, "~> 0.9"},
      {:timex, "~> 3.0"},
    ]
  end
end
