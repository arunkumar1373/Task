defmodule Tasks.Repo.Migrations.CreateTeacher do
  use Ecto.Migration

  def change do
    create table(:teacher) do
      add :teacher, :string

      timestamps(type: :timestamptz, default: fragment("now()"))
    end

    create unique_index(:teacher, [:teacher])
  end
end
