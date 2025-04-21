defmodule CashFlow.TrackingFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CashFlow.Tracking` context.
  """

  import CashFlow.AccountsFixtures

  def valid_budget_attributes(attrs \\ %{}) do
    attrs
    |> add_creator_if_necessary()
    |> Enum.into(%{
      name: "some name",
      description: "some description",
      start_date: ~D[2025-01-01],
      end_date: ~D[2025-01-31]
    })
  end

  @doc """
  Generate a budget.
  """
  def budget_fixture(attrs \\ %{}) do
    user = attrs[:creator] || user_fixture()

    {:ok, budget} =
      attrs
      |> Enum.into(%{
        description: "some description",
        end_date: ~D[2025-04-20],
        name: "some name",
        start_date: ~D[2025-04-20],
        creator_id: user.id
      })
      |> CashFlow.Tracking.create_budget()

    budget
  end

  defp add_creator_if_necessary(attrs) when is_map(attrs) do
    Map.put_new_lazy(attrs, :creator_id, fn ->
      user = CashFlow.AccountsFixtures.user_fixture()
      user.id
    end)
  end
end
