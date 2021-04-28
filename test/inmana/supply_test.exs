defmodule Inmana.SupplyTest do
  use Inmana.DataCase, async: true

  alias Ecto.Changeset
  alias Ecto.UUID
  alias Inmana.Supply

  describe("changeset/1") do
    test "when all params are valid, returns a valid changeset" do
      restaurant_id = UUID.generate()
      [yyyy, mm, dd] = String.split("2021/04/12", "/")
      {:ok, date} = Date.from_iso8601("#{yyyy}-#{mm}-#{dd}")
      params = %{
        description: "Molho de tomate",
        expiration_date: date,
        responsible: "Funcionario Joao",
        restaurant_id: restaurant_id
      }

      response = Supply.changeset(params)

      assert %Changeset{
        changes: %{
          description: "Molho de tomate",
          expiration_date: date,
          responsible: "Funcionario Joao",
          restaurant_id: restaurant_id
        },
        valid?: true
      } = response
    end

    test "when there are empty params, returns an invalid changeset" do
      params = %{
        description: "",
        expiration_date: "",
        responsible: "",
      }

      expected_validation = %{
        description: ["can't be blank"],
        expiration_date: ["can't be blank"],
        responsible: ["can't be blank"],
        restaurant_id: ["can't be blank"]
      }

      response = Supply.changeset(params)

      assert errors_on(response) == expected_validation
      assert %Changeset{
        valid?: false
      } = response
    end
  end
end
