defmodule Database.Repo.Migrations.CreateAdminUsers do
  use Ecto.Migration

  def change do
    create table(:admin_users) do
      add :email, :string, null: false, unique: true
      add :username, :string, null: false
      add :password, :string, null: false
      add :accreditation, :string, null: false, default: "user"

      timestamps()
    end

  end
end
