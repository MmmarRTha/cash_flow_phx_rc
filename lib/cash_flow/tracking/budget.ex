defmodule CashFlow.Tracking.Budget do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "budgets" do
    field :name, :string
    field :description, :string
    field :start_date, :date
    field :end_date, :date

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(budget, attrs) do
    budget
    |> cast(attrs, [:name, :description, :start_date, :end_date])
    |> validate_required([:name, :description, :start_date, :end_date])
  end
end
