defmodule Excallback.Proxy do
  use Raxx.Server
#  use Raxx.Static, "./public"

  @fake Mix.env == :fake

  @impl Raxx.Server
  def handle_request(request, _) do
    if @fake do
      Raxx.response(:ok)
      |> Raxx.set_body("Fake responese")
    else
      IO.inspect(request)

      method = request.method |> Atom.to_string() |> String.downcase() |> String.to_atom()
      orig_uri = URI.parse("#{request.scheme}://#{request.authority}")
      target_uri = orig_uri |> Map.put(:port, 80) |> URI.to_string
      response = apply(HTTPoison, method, [target_uri])

      IO.inspect(response)

      case response do
        {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
          IO.puts body
        not_200_response ->
          Excallback.Database.inout_add(%{request: request, response: not_200_response})
      end

      Raxx.response(:ok)
      |> Raxx.set_body(response.body)
    end
  end
end
