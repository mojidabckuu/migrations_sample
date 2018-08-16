defmodule Mix.Tasks.Greet do
  use Mix.Task

  def run(_) do
    Mix.shell.info "Hello!"
  end
end
