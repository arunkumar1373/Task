defmodule Tasks.TaskContext.TeacherSubject do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teacher_subject" do
    field :subject_id, :integer
    field :teacher_id, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(teacher_subject, attrs) do
    teacher_subject
    |> cast(attrs, [:teacher_id, :subject_id])
    |> validate_required([:teacher_id, :subject_id])
  end
end
