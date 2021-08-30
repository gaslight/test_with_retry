defmodule TestWithRetry.MixProject do
  use Mix.Project

  def project do
    [
      app: :test_with_retry,
      description: "A mix task to automatically retry any failed tests. Takes same args as mix test. Reports failures on second run.",
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: [
        licenses: ["MIT"],
        links: %{"Github" => "https://github.com/gaslight/test_with_retry"}
      ],
      source_url: "https://github.com/gaslight/test_with_retry",
      homepage_ur: "https://github.com/gaslight/test_with_retry"
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
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
