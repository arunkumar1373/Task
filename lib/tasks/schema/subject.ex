defmodule Tasks.TaskContext.Subject do
  use Ecto.Schema
  import Ecto.Changeset

  schema "subject" do
    field :subject, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(subject, attrs) do
    subject
    |> cast(attrs, [:subject])
    |> validate_required([:subject])
  end
end
