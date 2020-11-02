# CrcBenchmarks

## Run benchmarks comparing various CRC implementations

Example Run: 
  OS: WSL2, Ubuntu 18.04, on 64 bit Windows 10
  Processor:	Intel(R) Core(TM) i5-6300U CPU @ 2.40GHz, 2501 Mhz, 2 Core(s), 4 Logical Processor(s)
  8 GB Ram


Compare CRC16-CCITT without HiPE enabled for Grizzly.ZWave.CRC
```
iex(10)> CrcBenchmarks.run_benchmark_crc16_ccitt(100)
*** &CRC.ccitt_16/1 ***
1.2 sec     1M iterations   1.24 μs/op

*** &Grizzly.ZWave.CRC.crc16_aug_ccitt/1 ***
1.1 sec   262K iterations   4.23 μs/op
```

Compare CRC16-CCITT with HiPE enabled for ZWave.CRC
```
iex(8)> CrcBenchmarks.run_benchmark_crc16_ccitt(100)
*** &CRC.ccitt_16/1 ***
1.2 sec     1M iterations   1.24 μs/op

*** &ZWave.CRC.crc16_aug_ccitt/1 ***
1.3 sec     2M iterations   0.67 μs/op
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `crc_benchmarks` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:crc_benchmarks, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/crc_benchmarks](https://hexdocs.pm/crc_benchmarks).

