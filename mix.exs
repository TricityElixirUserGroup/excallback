defmodule Excallback.Mixfile do
  use Mix.Project

  def project do
    [
      app: :excallback,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: true,
      deps: deps()
    ]
  end

  def application do
    [extra_applications: [:logger],
     mod: {Excallback.Application, []}]
  end

  defp deps do
    [
      {:ace, "~> 0.15.9"},
      {:httpoison, "~> 1.0"},
      {:uuid, "~> 1.1"},
      {:dialyxir, "~> 0.5.0", only: :dev},
    ]
  end
end
