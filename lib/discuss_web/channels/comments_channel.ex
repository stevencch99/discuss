defmodule DiscussWeb.CommentsChannel do
  use DiscussWeb, :channel
  import Ecto

  alias Discuss.{Topic, Repo, Comment}
  # pattern match the first passed argument like "comments:topicId",
  # then pull out the topicId into topic_id
  def join("comments:" <> topic_id, _params, socket) do
    topic_id = String.to_integer(topic_id)
    topic = Repo.get(Topic, topic_id)

    {:ok, %{}, assign(socket, :topic, topic)}
  end

  def handle_in(name, %{"content" => content}, socket) do
    topic = socket.assigns.topic

    changeset = topic
      |> build_assoc(:comments)
      |> Comment.changeset(%{content: content})

      case Repo.insert(changeset) do
        {:ok, comment} ->
          {:reply, :ok, socket}
        {:error, _reason} ->
          {:reply, {:error, %{errors: changeset}}, socket}

      end
    {:reply, :ok, socket}
  end
end
