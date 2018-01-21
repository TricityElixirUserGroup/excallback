# Excallback

Proxy recording failed requests

Working schema:

  * Take requests.
  * Do them to the target.
  * Return the targets response to the caller. [TODO]
  * If target fails: save the failed request and response.
  * Present failed requests in an UI or CLI. [TODO]
  * Do the requests using the CircuitBreaker design pattern. [TODO]

## Origin

This was started on ElixirBridge no.2 at [Elixir Tricity](https://www.meetup.com/Elixir-Tricity/).
The main purpose is to learn together and teach Elixir to others. 

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `excallback` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:excallback, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/excallback](https://hexdocs.pm/excallback).

