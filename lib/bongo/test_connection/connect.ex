defmodule Bongo.TestConnection.Connect do
  @moduledoc false

  def test_connection do
    {:ok, conn} = Mongo.start_link(url: "mongodb://admin:example@localhost:27017/test")

    cursor =
      conn
      |> Mongo.find("test-collection", %{})

    cursor
    |> Enum.to_list()
    |> IO.inspect()
  end
  
end
