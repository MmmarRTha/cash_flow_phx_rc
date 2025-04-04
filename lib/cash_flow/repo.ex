defmodule CashFlow.Repo do
  use Ecto.Repo,
    otp_app: :cash_flow,
    adapter: Ecto.Adapters.Postgres
end
