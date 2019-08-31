# apps/database/lib/database/common/pipelines/auth.ex
defmodule Database.Common.Pipelines.AdminAuth do
  use Guardian.Plug.Pipeline,
    otp_app: :database,
    error_handler: Database.Common.ErrorHandler,
    module: Database.Common.AdminGuardian

  # If there is a session token, restrict it to an access token and validate it
  plug(Guardian.Plug.VerifySession, claims: %{"typ" => "access"})
  # If there is an authorization header, restrict it to an access token, and validate it
  plug(Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"})
  # Load the user if either of the verifications worked
  plug(Guardian.Plug.LoadResource, allow_blank: true)
  # If the user isn't loaded, redirect to the login page
  plug(Database.Common.Plugs.RedirectToLogin, allow_blank: true)
end
