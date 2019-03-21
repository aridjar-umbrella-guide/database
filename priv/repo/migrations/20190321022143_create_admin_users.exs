defmodule Database.Repo.Migrations.CreateAdminUsers do
  use Ecto.Migration

  def change do
    create table(:admin_users) do
      add :name, :string
      add :password, :string
      add :accreditation, :string

      timestamps()
    end

  end
end
