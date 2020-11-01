# CrcBenchmarks

## Run benchmarks comparing various CRC implementations

Example Run: 
  OS: WSL2, Ubuntu 18.04, on 64 bit Windows 10
  Processor:	Intel(R) Core(TM) i5-6300U CPU @ 2.40GHz, 2501 Mhz, 2 Core(s), 4 Logical Processor(s)
  8 GB Ram


```
.../crc_benchmarks$ iex -S mix
Erlang/OTP 23 [erts-11.0.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe]

Interactive Elixir (1.10.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> CrcBenchmarks.run_benchmark(100)
*** &:erlang.crc32/1 ***
1.3 sec     8M iterations   0.16 μs/op

*** &:crc32cer.nif/1 ***
1.2 sec     8M iterations   0.16 μs/op

*** &CRC.crc_32/1 ***
1.3 sec     1M iterations   1.29 μs/op

*** &CRC.crc/2 ***
1.2 sec     1M iterations   1.17 μs/op

*** &Grizzly.ZWave.CRC.crc16_aug_ccitt/1 ***
1.9 sec   524K iterations   3.64 μs/op

[
  %Benchwarmer.Results{
    args: [
      [51, 11, 230, 165, 133, 91, 95, 28, 229, 158, 183, 209, 5, 255, 59, 238,
       158, 45, 144, 250, 245, 166, 168, 14, 245, 132, 81, 41, 95, 244, 93, 237,
       82, 130, 245, 94, 133, 243, 24, 96, 243, 105, 76, 18, 197, 206, 199, ...]
    ],
    duration: 1904582,
    function: &Grizzly.ZWave.CRC.crc16_aug_ccitt/1,
    n: 524287,
    prev_n: 262144
  }
]
iex(2)>
```

Compare CRC16-CCITT
```
iex(10)> CrcBenchmarks.run_benchmark_crc16_ccitt(100)
*** &CRC.ccitt_16/1 ***
1.2 sec     1M iterations   1.24 μs/op

*** &Grizzly.ZWave.CRC.crc16_aug_ccitt/1 ***
1.1 sec   262K iterations   4.23 μs/op

[
  %Benchwarmer.Results{
    args: [
      [122, 26, 1, 164, 62, 24, 126, 13, 17, 182, 212, 17, 163, 19, 51, 1, 226,
       17, 47, 249, 32, 252, 89, 62, 137, 205, 110, 81, 57, 64, 14, 121, 4, 50,
       10, 96, 218, 33, 144, 145, 135, 139, 5, 168, 75, 182, 172, ...]
    ],
    duration: 1107268,
    function: &Grizzly.ZWave.CRC.crc16_aug_ccitt/1,
    n: 262143,
    prev_n: 131072
  }
]
iex(11)>
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

