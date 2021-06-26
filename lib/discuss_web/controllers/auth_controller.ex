defmodule DiscussWeb.AuthController do
  use DiscussWeb, :controller
  plug Ueberauth

  def callback(conn, params) do
    IO.puts "conn+++"
    IO.inspect(conn)
    # IO.puts "pamras+++"
    # IO.inspect(params)
    IO.puts "+++++++"
  end
end
