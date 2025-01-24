# Wreport

This is Weather Report Generator. 
In the United States, the National Oceanic and Atmospheric Administration provides hourly XML feeds of conditions at 1,800 locations.
For example, the feed for Denton Enterprise Airport in Texas is at http://w1.weather.gov/xml/current_obs/KDTO.xml.

This application that fetches this data, parses it, and displays it in a nice format. You have to pass the station code and it fetches
the data, parses the xml and displays in a readable format.

in IEX run 'Wreport.CLI.main(["KDTO"])' where KDTO is the station code. For now only one station code is accepted as the argument.
## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `wreport` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:wreport, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/wreport>.

