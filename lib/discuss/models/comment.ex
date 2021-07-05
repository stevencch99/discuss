defmodule Discuss.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  # If you own the struct, you can derive the implementation specifying which fields should be encoded to JSON:
  @derive {Jason.Encoder, only: [:content, :user]}

  schema "comments" do
    field :content, :string
    belongs_to :user, Discuss.User
    belongs_to :topic, Discuss.Topic

    timestamps()
  end

  def changeset(struct, attrs \\ %{}) do
    struct
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
