defmodule Database.AdminUsers do
  @moduledoc """
  The AdminUsers context.
  """

  import Ecto.Query, warn: false
  alias Database.Repo

  alias Database.AdminUsers.AdminUser

  @doc """
  Returns the list of admin_users.

  ## Examples

      iex> list_admin_users()
      [%AdminUser{}, ...]

  """
  def list_admin_users do
    Repo.all(AdminUser)
  end

  @doc """
  Gets a single admin_user.

  Raises if the Admin user does not exist.

  ## Examples

      iex> get_admin_user!(123)
      %AdminUser{}

  """
  def get_admin_user!(id), do: Repo.get!(AdminUser, id)

  @doc """
  Creates a admin_user.

  ## Examples

      iex> create_admin_user(%{field: value})
      {:ok, %AdminUser{}}

      iex> create_admin_user(%{field: bad_value})
      {:error, ...}

  """
  def create_admin_user(attrs \\ %{}) do
    %AdminUser{}
    |> AdminUser.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a admin_user.

  ## Examples

      iex> update_admin_user(admin_user, %{field: new_value})
      {:ok, %AdminUser{}}

      iex> update_admin_user(admin_user, %{field: bad_value})
      {:error, ...}

  """
  def update_admin_user(%AdminUser{} = admin_user, attrs) do
    admin_user
    |> AdminUser.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a AdminUser.

  ## Examples

      iex> delete_admin_user(admin_user)
      {:ok, %AdminUser{}}

      iex> delete_admin_user(admin_user)
      {:error, ...}

  """
  def delete_admin_user(%AdminUser{} = admin_user) do
    Repo.delete(admin_user)
  end

  @doc """
  Returns a data structure for tracking admin_user changes.

  ## Examples

      iex> change_admin_user(admin_user)
      %Todo{...}

  """
  def change_admin_user(%AdminUser{} = admin_user) do
    AdminUser.changeset(admin_user, %{})
  end
end
