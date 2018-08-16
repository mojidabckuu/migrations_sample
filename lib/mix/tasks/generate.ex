defmodule Mix.Tasks.Generate do
  use Mix.Task

  require Logger

  defp pad(i) when i < 10, do: << ?0, ?0 + i >>
  defp pad(i), do: to_string(i)

  defp timestamp do
    {{y, m, d}, {hh, mm, ss}} = :calendar.universal_time()
    "#{y}#{pad(m)}#{pad(d)}#{pad(hh)}#{pad(mm)}#{pad(ss)}"
  end

  defp timestamp_from(datetime) do
      %{
        year: y,
        month: m,
        day: d,
        hour: hh,
        minute: mm,
        second: ss
      } = datetime
      "#{y}#{pad(m)}#{pad(d)}#{pad(hh)}#{pad(mm)}#{pad(ss)}"
  end

  @shortdoc "Simply runs the Hello.say/0 function"
  def run(_) do
    Logger.debug "Run"
    path = Application.app_dir(:migrations_sample, "priv/repo/migrations")
    current_datetime = DateTime.utc_now()
    Enum.map(1..10, fn i ->
      Timex.shift(current_datetime, seconds: i)
      |> DateTime.to_naive()
      |> timestamp_from()
    end)
    |> Enum.each(fn timestamp ->
      filepath = path <> "/#{timestamp}_create_table_#{timestamp}.exs"
      Logger.info("Generate #{filepath}")
      {:ok, file} = File.open(filepath, [:read, :write])
      migration = """
      defmodule MigrationsSample.Repo.Migrations.CreateUser do
        use Ecto.Migration

        def change do
          create table(:table#{timestamp}) do
            add :field1, :string
            add :field2, :date
            add :field3, :map
            add :field4, {:array, :map}
            add :field5, :string
            add :field6, :naive_datetime
            add :field7, :integer
            add :field8, :integer
          end

          create index(:table#{timestamp}, [:field7, :field8])
          create unique_index(:table#{timestamp}, [:field5])
          create constraint(:table#{timestamp}, :check_field5, check: "field2 > now()")
        end
      end
      """
      File.write(filepath, migration)
      File.close(file)
    end)
  end
end
