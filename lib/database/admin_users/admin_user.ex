defmodule Database.AdminUsers.AdminUser do
  use Ecto.Schema
  import Ecto.Changeset

  schema "admin_users" do
    field :accreditation, :string
    field :name, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(admin_user, attrs) do
    admin_user
    |> cast(attrs, [:name, :password, :accreditation])
    |> validate_required([:name, :password, :accreditation])
  end
end
