defmodule CashFlow.TrackingFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CashFlow.Tracking` context.
  """

  @doc """
  Generate a budget.
  """
  def budget_fixture(attrs \\ %{}) do
    {:ok, budget} =
      attrs
      |> Enum.into(%{
        description: "some description",
        end_date: ~D[2025-04-20],
        name: "some name",
        start_date: ~D[2025-04-20]
      })
      |> CashFlow.Tracking.create_budget()

    budget
  end
end
