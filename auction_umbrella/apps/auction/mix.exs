defmodule Auction.MixProject do
  use Mix.Project

  # These are only some of the options that can be set
  # here for your app
  # Other dependencies of your app may also have options
  # that will need to be set here
  def project do
    [
      app: :auction,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  # You can specify lots of other options here, but they're
  # unnecessary for your starter app

  def application do
    [
      # Any applications you provide to extra_applications is
      # guaranteed to start before your app does, so that it will
      # be ready to accept commands when your app needs it
      # Elixir's logging app is provided by default
      extra_applications: [:logger],
      # This is an application callback
      # Any module you specify in this list (along with a list
      # of args which is currently empty) will be called when the
      # main app starts
      # The callback expects Auction.Application.start/2 to be
      # defined
      # When you generated the auction app with the --sup flag,
      # it created that module and placed it here for you
      mod: {Auction.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      # {:sibling_app_in_umbrella, in_umbrella: true}
    ]
  end
end
