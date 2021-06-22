defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias Discuss.Topic
  alias Discuss.Repo

  def new(conn, _params) do
    # struct = %Discuss.Topic{}
    # params = ${}
    changeset = Topic.changeset(%Topic{}, %{})

    # passing @changeset to template
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic" => topic}) do
    changeset = Topic.changeset(%Topic{}, topic)

    case Repo.insert(changeset) do
      {:ok, post} -> IO.inspect(post)
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end
end
