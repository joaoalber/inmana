defmodule InmanaWeb.RestaurantsTest do
  use InmanaWeb.ConnCase, async: true

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{name: "Restaurante brabo", email: "brabo@email.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Restaurant created!",
               "restaurant" => %{
                 "email" => "brabo@email.com",
                 "id" => _id,
                 "name" => "Restaurante brabo"
               }
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{name: "", email: "brabo@email.com"}
      expected_response = %{"message" => %{"name" => ["can't be blank"]}}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end
end
