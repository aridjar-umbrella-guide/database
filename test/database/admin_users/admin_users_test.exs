defmodule Database.AdminUsersTest do
  use Database.DataCase

  alias Database.AdminUsers

  describe "admin_users" do
    use Database.DataFixtures, [:admin_user]

    alias Database.AdminUsers.AdminUser

    test "list_admin_users/0 returns all admin_users" do
      admin_user = admin_user_fixture()
      assert AdminUsers.list_admin_users() == [admin_user]
    end

    test "get_admin_user!/1 returns the admin_user with given id" do
      admin_user = admin_user_fixture()
      assert AdminUsers.get_admin_user!(admin_user.id) == admin_user
    end

    test "create_admin_user/1 with valid data creates a admin_user" do
      assert {:ok, %AdminUser{} = admin_user} = AdminUsers.create_admin_user(@valid_attrs)
    end

    test "create_admin_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AdminUsers.create_admin_user(@invalid_attrs)
    end

    test "update_admin_user/2 with valid data updates the admin_user" do
      admin_user = admin_user_fixture()

      assert {:ok, %AdminUser{} = admin_user} =
               AdminUsers.update_admin_user(admin_user, @update_attrs)
    end

    test "update_admin_user/2 with invalid data returns error changeset" do
      admin_user = admin_user_fixture()

      assert {:error, %Ecto.Changeset{}} =
               AdminUsers.update_admin_user(admin_user, @invalid_attrs)

      assert admin_user == AdminUsers.get_admin_user!(admin_user.id)
    end

    test "delete_admin_user/1 deletes the admin_user" do
      admin_user = admin_user_fixture()
      assert {:ok, %AdminUser{}} = AdminUsers.delete_admin_user(admin_user)
      assert_raise Ecto.NoResultsError, fn -> AdminUsers.get_admin_user!(admin_user.id) end
    end

    test "change_admin_user/1 returns a admin_user changeset" do
      admin_user = admin_user_fixture()
      assert %Ecto.Changeset{} = AdminUsers.change_admin_user(admin_user)
    end
  end
end
