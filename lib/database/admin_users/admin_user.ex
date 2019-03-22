defmodule Database.AdminUsers.AdminUser do
  use Ecto.Schema
  import Ecto.Changeset

  schema "admin_users" do
    field :accreditation, :string, default: "user", null: false
    field :email, :string, null: false, unique: true
    field :password, :string, null: false
    field :username, :string, null: false
    field :password_clear, :string, virtual: true, default: nil

    timestamps()
  end

  @doc false
  def changeset(admin_user, attrs) do
    admin_user
    |> cast(attrs, [:email, :username, :password, :accreditation])
    |> validate_required([:email, :username, :password, :accreditation])
  end
end
