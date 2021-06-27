defmodule Discuss.Plugs.SetUser do
  import Plug.Conn

  alias Discuss.{Repo, User}

  # Put all the heavy calculating here, the init function will just run one time
  def init(_params) do

  end

  # the _params here is the return from #init()
  def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    cond do
      user = user_id && Repo.get(User, user_id) ->
        # like `conn.assigns.user = user struct` in OOP
        assign(conn, :user, user)
      true ->
        assign(conn, :user, nil)
    end
  end
end
