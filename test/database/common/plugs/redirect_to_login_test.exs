defmodule Database.Common.Plugs.RedirectToLoginTest do
  use Database.DataCase
  use Database.DataFixtures, [:admin_user]
  alias Plug.Conn

  alias Database.Common.Plugs.RedirectToLogin

  describe "redirect login" do
    test "resource_from_claims with valid data" do
      conn =
        Plug.Adapters.Test.Conn.conn(%Conn{}, :get, "http://localhost:4101/", nil)
        |> RedirectToLogin.call()

      assert conn.status == 302
    end

    test "try to redirect with base conn port and path" do
      conn =
        Plug.Adapters.Test.Conn.conn(%Conn{}, :get, "/", nil)
        |> RedirectToLogin.call()

      assert conn.status != 302
    end

    test "try to redirect to login when connected" do
      conn =
        Plug.Adapters.Test.Conn.conn(%Conn{}, :get, "http://localhost:4101/",
          private: %{guardian_default_resource: true}
        )
        |> Map.put(:private, %{guardian_default_resource: true})
        |> RedirectToLogin.call()

      assert conn.status != 302
    end
  end
end
