defmodule CrcBenchmarks.MixProject do
  use Mix.Project

  def project do
    [
      app: :crc_benchmarks,
      version: "0.1.0",
      elixir: "~> 1.10",
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
      { :benchwarmer, "~> 0.0.2" },
      # Implementation of CRC32-C Using NIF's
      {:crc32cer, "~> 0.1.10"},
      # Generalized implementation of CRC using NIF's, Configurable for number of bits, etc.
      {:crc, "~> 0.10"},
      # Native erlang implementation
      {:cerlc, git: "https://github.com/mdsebald/cerlc.git", tag: "main"}
      # Native elixir CRC implementation
      # Copy Zwave.Crc modules to main lib, and enable HiPE
    ]
  end
end
