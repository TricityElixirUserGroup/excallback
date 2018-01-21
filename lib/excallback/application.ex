defmodule Excallback.Application do
  @moduledoc false

  use Application

  import Supervisor.Spec

  def start(_type, _args) do
    options = [
      port: Application.get_env(:excallback, :port),
      connections: 1_000,
      cleartext: true
    ]
    children = [
      {Ace.HTTP.Service, [{Excallback.Proxy, []}, options]},
      worker(Excallback.Database, [])
    ]

    opts = [strategy: :one_for_one, name: Excallback.Supervisor]
    Supervisor.start_link(children, opts)
  end
end