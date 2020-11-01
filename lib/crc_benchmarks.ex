defmodule CrcBenchmarks do

  @moduledoc """
  CRC Benchmark tests
  """
  def run_benchmark(data_length) do
    data_list = make_data_list(data_length)
    data_bin = :binary.list_to_bin(data_list)

    Benchwarmer.benchmark([
      &:erlang.crc32/1, # Erlang BIF for CRC32
      &:crc32cer.nif/1, # Erlang implementation for CRC32-C using NIF's
      &CRC.crc_32/1],    # Elixir configurable CRC implemented using NIF's, CRC32
      data_bin)
      Benchwarmer.benchmark(&CRC.crc/2, [:crc_32c, data_bin]) # Elixir configurable CRC implemented using NIF's, CRC32-C
      Benchwarmer.benchmark(&Grizzly.ZWave.CRC.crc16_aug_ccitt/1, [data_list]) # Natively implemented Elixir CRC16, for ZWave comm
  end

  def make_data_list(data_length) do
    get_range(data_length)
    |> Enum.reduce([], fn(_, acc) -> [Enum.random(0..255) | acc] end)
  end

  defp get_range(length) when length > 1, do: (1..length)
  defp get_range(_length), do: [1]

end
