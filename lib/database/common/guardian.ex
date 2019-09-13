defmodule Database.Common.AdminGuardian do
  use Guardian, otp_app: :admin

  alias Database.AdminUsers

  def subject_for_token(%{id: id}, _claims), do: {:ok, to_string(id)}
  def subject_for_token(_, _), do: {:error, :reason_for_error}

  def resource_from_claims(%{"sub" => id}) do
    user = if (Mix.env == :test) do
      AdminUsers.get_admin_user(id)
    else
      AdminUsers.get_admin_user!(id)
    end

    case user do
      nil -> {:error, :resource_not_found}
      _ -> {:ok,  user}
    end
  end
  def resource_from_claims(_claims), do: {:error, :reason_for_error}
end
