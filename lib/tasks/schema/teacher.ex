defmodule Tasks.TaskContext.Teacher do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teacher" do
    field :teacher, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(teacher, attrs) do
    teacher
    |> cast(attrs, [:teacher])
    |> validate_required([:teacher])
  end
end
