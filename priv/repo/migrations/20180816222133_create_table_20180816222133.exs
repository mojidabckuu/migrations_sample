defmodule MigrationsSample.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:table20180816222133) do
      add :field1, :string
      add :field2, :date
      add :field3, :map
      add :field4, {:array, :map}
      add :field5, :string
      add :field6, :naive_datetime
      add :field7, :integer
      add :field8, :integer
    end

    create index(:table20180816222133, [:field7, :field8])
    create unique_index(:table20180816222133, [:field5])
    create constraint(:table20180816222133, :check_field5, check: "field2 > now()")
  end
end
