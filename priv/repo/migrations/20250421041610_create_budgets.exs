defmodule CashFlow.Repo.Migrations.CreateBudgets do
  use Ecto.Migration

  def change do
    create table(:budgets, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :description, :string
      add :start_date, :date
      add :end_date, :date

      timestamps(type: :utc_datetime)
    end
  end
end
