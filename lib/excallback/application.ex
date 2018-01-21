defmodule Excallback.Application do
  @moduledoc false

  use Application

  import Supervisor.Spec

  def start(_type, _args) do
    children = [
      {Excallback.Proxy, [%{}, [port: Application.get_env(:excallback, :port)]]},
      worker(Excallback.Database, []),
    ]

    opts = [strategy: :one_for_one, name: Excallback.Supervisor]
    Supervisor.start_link(children, opts)
  end
end