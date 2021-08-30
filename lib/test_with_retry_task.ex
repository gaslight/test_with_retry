defmodule Mix.Tasks.TestWithRetry do
  @preferred_cli_env "test"

  def run(args) do
    case System.cmd("mix", ["test"] ++ args, into: IO.stream(:stdio, :line)) do
      {_output, 0} ->
        nil
      {_, _} ->
        IO.puts("Rerunning failed tests...")
        retry(args)
    end
  end

  def retry(args) do
    case System.cmd("mix", ["test", "--failed"] ++ args, into: IO.stream(:stdio, :line)) do
      {_output, 0} ->
        nil
      {_, _} ->
        exit(1)
    end
  end
end
