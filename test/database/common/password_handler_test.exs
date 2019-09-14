defmodule Database.Common.PasswordHandlerTest do
  use Database.DataCase

  describe "password_handler" do
    use Database.DataFixtures, [:admin_user]

    alias Database.Common.PasswordHandler
    alias Database.AdminUsers.AdminUser

    test "test put_password_hash with valid data" do
      admin_user_fixture()

      assert {:ok, %AdminUser{}} =
               PasswordHandler.authenticate_admin_user(@valid_attrs.email, @valid_attrs.password)
    end

    test "try put_password_hash with invalid data" do
      assert PasswordHandler.authenticate_admin_user(
               @invalid_attrs.email,
               @invalid_attrs.password
             ) == {:error, :invalid_credentials}
    end
  end
end
