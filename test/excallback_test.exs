defmodule ExcallbackTest do
  use ExUnit.Case
  doctest Excallback

  test "greets the world" do
    assert Excallback.hello() == :world
  end
end
