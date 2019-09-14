defmodule Database.Common.Plugs.RedirectToLogin do
  import Plug.Conn
  import Phoenix.Controller

  def init(opts), do: opts

  def call(
        %Plug.Conn{host: host, port: port, request_path: path, private: private} = conn,
        _opts \\ nil
      ) do
    paths = Application.get_env(:database, :paths)
    ports = Application.get_env(:database, :ports)
    hosts = Application.get_env(:database, :hosts)

    with true <- Enum.member?(ports, port),
         true <- Enum.member?(hosts, host),
         false <- Map.has_key?(private, :guardian_default_resource),
         false <- Enum.member?(paths, path) do
      conn
      |> redirect(external: "http://#{host}:#{port}/login")
      |> halt
    else
      _ -> conn
    end
  end
end
