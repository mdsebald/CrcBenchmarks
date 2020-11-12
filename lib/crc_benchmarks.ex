defmodule CrcBenchmarks do

  @moduledoc """
  CRC Benchmark tests
  """
  def run_benchmark(data_length) do
    data_list = make_data_list(data_length)
    data_bin = :binary.list_to_bin(data_list)

    Benchwarmer.benchmark([
      &:erlang.crc32/1, # Erlang BIF for CRC-32
      &:crc32cer.nif/1, # Erlang implementation for CRC32-C using NIF's
      &CRC.crc_32/1,    # Elixir configurable CRC implemented using NIF's, CRC-32
      &CRC.ccitt_16/1], # Elixir configurable CRC implemented using NIF's, CRC-16-CCITT
      data_bin)
      Benchwarmer.benchmark(&CRC.crc/2, [:crc_32c, data_bin]) # Elixir configurable CRC implemented using NIF's, CRC-32/C
      Benchwarmer.benchmark(&ZWave.CRC.crc16_aug_ccitt/1, [data_list]) # Natively Elixir CRC-16/AUG-CCITT, for ZWave comm
  end

  def run_benchmark_crc16_ccitt(data_length) do
    data_list = make_data_list(data_length)
    data_bin = :binary.list_to_bin(data_list)

    Benchwarmer.benchmark(&CRC.ccitt_16/1, data_bin) # Elixir configurable CRC implemented using NIF's, CRC16-CCITT
    Benchwarmer.benchmark(&ZWave.CRC.crc16_aug_ccitt/1, [data_list]) # Native Elixir CRC-16/AUG-CCITT, for ZWave comm
    Benchwarmer.benchmark(&:crc16_aug_ccitt.crc/1, [data_list]) # Native Erlang CRC-16/AUG-CCITT
    Benchwarmer.benchmark(&:crc16_modbus.crc/1, [data_list]) # Native Erlang CRC-16/MODBUS
  end

  def run_benchmark_crc32_c(data_length) do
    data_list = make_data_list(data_length)
    data_bin = :binary.list_to_bin(data_list)

    Benchwarmer.benchmark(&:crc32cer.nif/1, data_bin) # Erlang implementation for CRC32-C using NIF's
    Benchwarmer.benchmark(&CRC32_C.crc/1, [data_list])
    Benchwarmer.benchmark(&:crc32_c.crc/1, [data_list])
  end

  def run_benchmark_erlang(data_length) do
    data_list = make_data_list(data_length)
    data_bin = :binary.list_to_bin(data_list)

    Benchwarmer.benchmark([
      &:crc8.crc/1, #Native Erlang CRC-8
      &:crc16_aug_ccitt.crc/1, # Native Erlang CRC-16/AUG CCITT
      &:crc16_modbus.crc/1, # Native Erlang CRC-16/MODBUS
      &:crc32.crc/1, # Native Erlang CRC-32
      &:crc32_c.crc/1], # Native Erlang CRC-32/C
      data_bin)
  end

  def make_data_list(data_length) do
    get_range(data_length)
    |> Enum.reduce([], fn(_, acc) -> [Enum.random(0..255) | acc] end)
  end

  defp get_range(length) when length > 1, do: (1..length)
  defp get_range(_length), do: [1]

end
