# CrcBenchmarks

## Run benchmarks comparing various CRC implementations

Benchmark Environment: 
  OS: WSL2, Ubuntu 18.04, on 64 bit Windows 10
  Processor:	Intel(R) Core(TM) i5-6300U CPU @ 2.40GHz, 2501 Mhz, 2 Core(s), 4 Logical Processor(s)
  8 GB Ram

Benchmark CRC routines
  CRC.ccitt_16() - Elixir wrapper implemented with NIF
  ZWave.CRC.crc16_aug_ccitt() - Native Elixir (Copied from Grizzly project)
  crc16_aug_ccitt.crc() - Native Erlang
  crc16_modbus.crc() - Native Erlang (Algorithm reflects input and output, requires fewer calculations)

Benchmark run 3 times, using a 100 bytes of random data each time
  1. OTP-23 without HiPE enabled
  2. OTP-23 with HiPE enabled
  3. OTO-24 uses JIT compiler

OTP-23 without HiPE 
```
iex(3)> CrcBenchmarks.run_benchmark_crc16_ccitt(100)
*** &CRC.ccitt_16/1 ***
1.1 sec     1M iterations   1.13 μs/op

*** &ZWave.CRC.crc16_aug_ccitt/1 ***
1.6 sec   524K iterations   3.15 μs/op

*** &:crc16_aug_ccitt.crc/1 ***
1.8 sec   524K iterations   3.47 μs/op

*** &:crc16_modbus.crc/1 ***
1.6 sec   524K iterations   3.15 μs/op
```

OTP-23 with HiPE
```
iex(3)> CrcBenchmarks.run_benchmark_crc16_ccitt(100)
*** &CRC.ccitt_16/1 ***
1.1 sec     1M iterations   1.14 μs/op

*** &ZWave.CRC.crc16_aug_ccitt/1 ***
1.3 sec     2M iterations   0.65 μs/op

*** &:crc16_aug_ccitt.crc/1 ***
1.4 sec     1M iterations   1.43 μs/op

*** &:crc16_modbus.crc/1 ***
1.5 sec     2M iterations   0.74 μs/op
```

OTP-24 with JIT
```
iex(4)> CrcBenchmarks.run_benchmark_crc16_ccitt(100)
*** &CRC.ccitt_16/1 ***
1.2 sec     1M iterations   1.21 μs/op

*** &ZWave.CRC.crc16_aug_ccitt/1 ***
1.4 sec     1M iterations   1.39 μs/op

*** &:crc16_aug_ccitt.crc/1 ***
1.0 sec   524K iterations   2.07 μs/op

*** &:crc16_modbus.crc/1 ***
1.0 sec   524K iterations   2.04 μs/op
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

