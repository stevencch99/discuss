defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias Discuss.Topic

  def new(conn, params) do
    # struct = %Discuss.Topic{}
    # params = ${}
    changeset = Topic.changeset(%Topic{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, params) do
    render(conn)
  end
end
