defmodule Database.Common.GuardianTest do
  use Database.DataCase

  describe "guardian_test" do
    use Database.DataFixtures, [:admin_user]

    alias Database.Common.AdminGuardian
    alias Database.AdminUsers.AdminUser

    test "testresource_from_claims with valid data" do
      admin_user = admin_user_fixture()
      assert {:ok, %AdminUser{}} = AdminGuardian.resource_from_claims(%{"sub" => admin_user.id})
    end

    test "try resource_from_claims with invalid id" do
      assert AdminGuardian.resource_from_claims(%{"sub" => 0}) == {:error, :resource_not_found}
    end

    test "try resource_from_claims with no data" do
      assert AdminGuardian.resource_from_claims(%{}) == {:error, :reason_for_error}
    end
  end
end
