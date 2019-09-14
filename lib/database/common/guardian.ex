defmodule Database.Common.AdminGuardian do
  use Guardian, otp_app: :admin

  alias Database.AdminUsers

  def subject_for_token(%{id: id}, _claims), do: {:ok, to_string(id)}
  def subject_for_token(_, _), do: {:error, :reason_for_error}

  def resource_from_claims(%{"sub" => id}) do
    user = get_admin_user(id, Mix.env())

    case user do
      nil -> {:error, :resource_not_found}
      _ -> {:ok, user}
    end
  end

  def resource_from_claims(_claims), do: {:error, :reason_for_error}

  defp get_admin_user(id, :test = _), do: AdminUsers.get_admin_user(id)
  defp get_admin_user(id, _), do: AdminUsers.get_admin_user!(id)
end
