defmodule Excallback do
  @moduledoc """
  Proxy requests

  Take requests. Do them to the target.
  If target fails. Save the failed request.
  Present the requests in some UI.
  Do the requests using the CircurBraker design pattern.
  """

  @doc """
  Takes requests.

  ## Examples

      iex> Excallback.hello(request)
      :world

  """
  def hello(_request) do
    :world
  end

  def bye(_request) do
    :world
  end
end
