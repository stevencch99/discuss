defmodule DiscussWeb.CommentsChannel do
  use DiscussWeb, :channel
  import Ecto

  alias Discuss.{Topic, Repo, Comment}
  # pattern match the first passed argument like "comments:topicId",
  # then pull out the topicId into topic_id
  def join("comments:" <> topic_id, _params, socket) do
    topic_id = String.to_integer(topic_id)
    topic = Topic
      |> Repo.get(topic_id)
      |> Repo.preload(comments: [:user])

    {:ok, %{comments: topic.comments}, assign(socket, :topic, topic)}
  end

  def handle_in(name, %{"content" => content}, socket) do
    topic = socket.assigns.topic
    user_id = socket.assigns.user_id

    # TODO: is there any other way to build 2 association at 1 time?
    changeset = topic
      |> build_assoc(:comments, user_id: user_id)
      |> Comment.changeset(%{content: content})

      case Repo.insert(changeset) do
        {:ok, comment} ->
          broadcast!(socket, "comments:#{socket.assigns.topic.id}:new",
            %{comment: comment}
          )
          {:reply, :ok, socket}
        {:error, _reason} ->
          {:reply, {:error, %{errors: changeset}}, socket}

      end
    {:reply, :ok, socket}
  end
end
