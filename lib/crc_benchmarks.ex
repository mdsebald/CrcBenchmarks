defmodule CrcBenchmarks do

  @moduledoc """
  CRC Benchmark tests
  """
  def run_benchmark(data_length) do
    data= make_data(data_length)
    Benchwarmer.benchmark([
      &:erlang.crc32/1, # Erlang BIF for CRC32
      &:crc32cer.nif/1, # Erlang implementation for CRC32-C using NIF's
      &CRC.crc_32/1,    # Elixir configurable CRC implemented using NIF's, CRC32
      &Grizzly.ZWave.CRC.crc16_aug_ccitt/1], # Natively implemented Elixir CRC16, for ZWave comm
      data)
    Benchwarmer.benchmark(&CRC.crc/2, [:crc_32c, data]) # Elixir configurable CRC implemented using NIF's, CRC32-C
  end

  # Make a binary data_length size, filled with random bytes
  defp make_data(data_length) do
    get_range(data_length)
    |> Enum.reduce([], fn(_, acc) -> [Enum.random(0..255) | acc] end)
    |> List.to_string()
  end

  defp get_range(length) when length > 1, do: (1..length)
  defp get_range(_length), do: [1]

end
