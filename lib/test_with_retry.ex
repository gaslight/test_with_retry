defmodule TestWithRetry do
  @moduledoc """
  This module provides a mix task to retry failed tests. It accepts the same command line
  arguments as `mix test`. If failures are encountered on the first test run, it will do another
  run add the `--failed` option to only run failed tests. If tests continue to fail, it will
  return an exit code of 1 so that CI can report failures appropriately.
  """

end
