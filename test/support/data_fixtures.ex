defmodule Database.DataFixtures do
  @moduledoc """
  A module for defining fixtures that can be used in tests.
  This module can be used with a list of fixtures to apply as parameter:
      use Database.DataFixtures, [:user]
  """

  def admin_user do
    alias Database.AdminUsers

    quote do
      @super_admin_attrs %{
        username: "test_admin",
        password: "test_pwd",
        accreditation: "super_admin",
        email: "admin@mail.test"
      }
      @valid_attrs %{
        username: "test_name",
        password: "test_pwd",
        accreditation: "user",
        email: "test@mail.test"
      }
      @update_attrs %{
        username: "test_name_updated",
        password: "test_pwd",
        accreditation: "user",
        email: "test@mail.test"
      }
      @invalid_attrs %{
        username: nil,
        password: nil,
        accreditation: nil,
        email: "test@mail.test"
      }

      def admin_user_fixture(attrs \\ %{}) do
        {:ok, admin_user} =
          attrs
          |> Enum.into(@valid_attrs)
          |> AdminUsers.create_admin_user()

        admin_user
      end
    end
  end

  @doc """
  Apply the `fixtures`.
  """
  defmacro __using__(fixtures) when is_list(fixtures) do
    for fixture <- fixtures, is_atom(fixture), do: apply(__MODULE__, fixture, [])
  end
end
