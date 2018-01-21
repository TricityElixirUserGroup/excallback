defmodule Excallback.Database do
  use GenServer

  @name :database

  def start_link do
    GenServer.start_link(__MODULE__, %{}, name: @name)
  end

  def init(state) do
    :ets.new(:inout, [:set, :protected, :named_table])

    {:ok, state}
  end

  def inout_add(data) do
    GenServer.cast @name, {:inout_add, data}
  end

  def handle_cast({:inout_add, data}, state) do
    :ets.insert(:inout, {UUID.uuid4(), data})

    {:noreply, state}
  end
end