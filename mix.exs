defmodule Issues.Mixfile do
  use Mix.Project

  def project do
    [
      app:             :issues,
      escript:         escript_config(),
      version:         "0.0.1",
      build_embedded:  Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      name:            "Issues",
      source_url:      "https://github.com/alexisllamas/issues",
      deps:            deps()
    ]
  end

  def application do
    [ 
      applications: [ :logger, :httpoison ]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 1.0"},
      {:poison, "~> 3.1"},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false},
      {:earmark, "~> 1.0", override: true}
    ]
  end

  defp escript_config do
    [ main_module: Issues.CLI ]
  end
end