defmodule Mix.Tasks.TestWithRetry do
  @preferred_cli_env "test"

  @moduledoc """
  A mix task to retry failed tests. It accepts the same command line
  arguments as `mix test`. If failures are encountered on the first test run, it will do another
  run adding the `--failed` option to only run failed tests. If tests continue to fail, it will
  return an exit code of 1 so that CI can report failures appropriately.
  """

  def run(args) do
    case System.cmd("mix", ["test"] ++ args) do
      {output, 0} ->
        IO.puts(output)

      {output, _} ->
        IO.puts(output)
        unless output =~ ~R/CompileError/ do
          IO.puts("Rerunning failed tests...")
          retry(args)
        end
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
