defmodule Bongo.TestConnection.Connect do
  @moduledoc false

  defp get_object do
    %{
      name: "John Doe",
      age: 56,
      profession: "Barber"
    }
  end

  defp get_connection do
    # Mongo.start_link(url: "mongodb://guilds:yGIRR856ogRnM0YsXPJOaIkVl2mxHiAAOELpw8339HAMcBMiS791fHg8tpXdhAlgo8URZsMVOG8HcBzZK60EQA==@guilds.mongo.cosmos.azure.com:10255/test-db?ssl=true&retrywrites=false&replicaSet=globaldb&maxIdleTimeMS=120000&appName=@guilds@")
    Mongo.start_link(url: "mongodb://localhost:27017/test-db")
  end

  def add_data do
    {:ok, conn} = get_connection()

    conn
    |> Mongo.insert_one("people", get_object())
  end

  @spec test_connection() :: list(map())
  def test_connection do
    {:ok, conn} = get_connection()

    cursor =
      conn
      |> Mongo.find("people", %{})

    cursor
    |> Enum.to_list()
    |> IO.inspect()
  end
  
end
