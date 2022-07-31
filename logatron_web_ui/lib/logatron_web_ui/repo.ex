defmodule LogatronWebUi.Repo do
  use Ecto.Repo,
    otp_app: :logatron_web_ui,
    adapter: Ecto.Adapters.Postgres
end
