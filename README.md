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
1.7 sec     8M iterations   0.21 μs/op

*** &:crc32cer.nif/1 ***
1.6 sec     8M iterations   0.2 μs/op

*** &CRC.crc_32/1 ***
1.3 sec     1M iterations   1.31 μs/op

*** &Grizzly.ZWave.CRC.crc16_aug_ccitt/1 ***
1.6 sec   262K iterations   6.44 μs/op

*** &CRC.crc/2 ***
1.3 sec     1M iterations   1.33 μs/op

[
  %Benchwarmer.Results{
    args: [
      :crc_32c,
      <<68, 194, 182, 98, 194, 183, 195, 173, 75, 194, 187, 7, 63, 195, 174, 37,
        89, 195, 146, 195, 174, 92, 0, 29, 195, 161, 194, 150, 21, 195, 152,
        194, 178, 194, 142, 194, 165, 194, 188, 194, 150, 74, 194, 154, 195,
        171, ...>>
    ],
    duration: 1394138,
    function: &CRC.crc/2,
    n: 1048575,
    prev_n: 524288
  }
]
iex(2)>
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

