defmodule BongoWeb.Live.TestMongoLive do
  @moduledoc false

  use BongoWeb, :live_view

  alias Bongo.TestConnection.Connect

  def mount(_params, _session, socket) do
    {
      :ok, 
      socket
      |> assign(:result, "")
    }
  end

  def handle_event("activate", _params, socket) do
    IO.puts "reactivating"

    Connect.add_data()
    result = Connect.test_connection()    

    {
      :noreply, 
      socket
      |> assign(:result, "#{inspect result}")
    }
  end

  def handle_event("reactivate", _params, socket) do
    IO.puts "reactivating"

    result = Connect.test_connection()
    
    {
      :noreply,
      socket
      |> assign(:result, "#{inspect result}")
    }
  end
end

