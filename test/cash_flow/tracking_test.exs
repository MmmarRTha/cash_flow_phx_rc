defmodule CashFlow.TrackingTest do
  use CashFlow.DataCase

  alias CashFlow.Tracking

  describe "budgets" do
    alias CashFlow.Tracking.Budget

    import CashFlow.TrackingFixtures

    @invalid_attrs %{name: nil, description: nil, start_date: nil, end_date: nil}

    test "list_budgets/0 returns all budgets" do
      budget = budget_fixture()
      assert Tracking.list_budgets() == [budget]
    end

    test "get_budget!/1 returns the budget with given id" do
      budget = budget_fixture()
      assert Tracking.get_budget!(budget.id) == budget
    end

    test "create_budget/1 with valid data creates a budget" do
      valid_attrs = %{
        name: "some name",
        description: "some description",
        start_date: ~D[2025-04-20],
        end_date: ~D[2025-04-20]
      }

      assert {:ok, %Budget{} = budget} = Tracking.create_budget(valid_attrs)
      assert budget.name == "some name"
      assert budget.description == "some description"
      assert budget.start_date == ~D[2025-04-20]
      assert budget.end_date == ~D[2025-04-20]
    end

    test "create_budget/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tracking.create_budget(@invalid_attrs)
    end

    test "update_budget/2 with valid data updates the budget" do
      budget = budget_fixture()

      update_attrs = %{
        name: "some updated name",
        description: "some updated description",
        start_date: ~D[2025-04-21],
        end_date: ~D[2025-04-21]
      }

      assert {:ok, %Budget{} = budget} = Tracking.update_budget(budget, update_attrs)
      assert budget.name == "some updated name"
      assert budget.description == "some updated description"
      assert budget.start_date == ~D[2025-04-21]
      assert budget.end_date == ~D[2025-04-21]
    end

    test "update_budget/2 with invalid data returns error changeset" do
      budget = budget_fixture()
      assert {:error, %Ecto.Changeset{}} = Tracking.update_budget(budget, @invalid_attrs)
      assert budget == Tracking.get_budget!(budget.id)
    end

    test "delete_budget/1 deletes the budget" do
      budget = budget_fixture()
      assert {:ok, %Budget{}} = Tracking.delete_budget(budget)
      assert_raise Ecto.NoResultsError, fn -> Tracking.get_budget!(budget.id) end
    end

    test "change_budget/1 returns a budget changeset" do
      budget = budget_fixture()
      assert %Ecto.Changeset{} = Tracking.change_budget(budget)
    end
  end
end
