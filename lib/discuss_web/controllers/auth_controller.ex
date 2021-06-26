defmodule Discuss.AuthController do
  use DiscussWeb, :controller
  plug Ueberauth

  def callback(conn, params) do
    IO.puts "pamras+++"
    IO.inspect(params)
    IO.puts "conn+++"
    IO.inspect(conn.assigns)
    IO.puts "+++++++"


  end
end
