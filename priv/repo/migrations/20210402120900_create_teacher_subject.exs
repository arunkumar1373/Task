defmodule Tasks.Repo.Migrations.CreateTeacherSubject do
  use Ecto.Migration

  def change do
    create table(:teacher_subject) do
      add :teacher_id, references("teacher",
      column: :id,
      type: :integer,
      on_delete: :delete_all
    ), null: false
      add :subject_id, references("subject",
      column: :id,
      type: :integer,
      on_delete: :delete_all
    ), null: false

    timestamps(type: :timestamptz, default: fragment("now()"))
    end

  end
end
