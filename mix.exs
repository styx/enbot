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
      applications: [:logger, :nadia],
    ]
  end

  # Type "mix help deps" for examples and options
  defp deps do
     [
       {:nadia, "~> 0.3"},
     ]
  end
end
