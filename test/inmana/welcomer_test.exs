defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user name is banana and age is 42, returns a special message" do
      params = %{"name" => "banana", "age" => "42"}
      expected_result = {:ok, "You are very special banana"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user age is greater or equal than 18, returns a message" do
      params = %{"name" => "whatever", "age" => "32"}
      expected_result = {:ok, "Welcome #{params["name"]}"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is under age, returns an error" do
      params = %{"name" => "whatever", "age" => "16"}
      expected_result = {:error, "You shall not pass #{params["name"]}"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end
  end
end
