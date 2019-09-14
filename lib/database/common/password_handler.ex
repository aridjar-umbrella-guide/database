# apps/database/lib/database/common/password_handler.ex
defmodule Database.Common.PasswordHandler do
  import Ecto.Changeset
  import Ecto.Query
  alias Database.Repo
  alias Database.AdminUsers.AdminUser

  # if there is a password in the changeset, it will hash it and replace it in the changeset.
  def put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Pbkdf2.hash_pwd_salt(password))
  end

  # if there is no password, it will return the changeset without any modifications
  def put_password_hash(changeset), do: changeset

  # Nothing really to tell. It create a Postgresql query and pass it to check_password()
  def authenticate_admin_user(email, plain_text_password) do
    from(u in AdminUser, where: u.email == ^email)
    |> check_pass(plain_text_password)
  end

  # this private function take a query, fetch the data and compare the hash with another password
  defp check_pass(query, plain_text_password) do
    with database_user <- Repo.one(query),
         {:ok, user} <- Pbkdf2.check_pass(database_user, plain_text_password, hash_key: :password) do
      {:ok, user}
    else
      _ -> {:error, :invalid_credentials}
    end
  end
end
