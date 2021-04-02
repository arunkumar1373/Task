defmodule Tasks.Repo.Migrations.CreateSubject do
  use Ecto.Migration

  def change do
    create table(:subject) do
      add :subject, :string

      timestamps(type: :timestamptz, default: fragment("now()"))
    end

    create unique_index(:subject, [:subject])
  end
end
