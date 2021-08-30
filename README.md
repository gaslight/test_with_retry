# TestWithRetry

This project provides a mix task to retry failed tests. It accepts the same command line
arguments as `mix test`. If failures are encountered on the first test run, it will do another
run add the `--failed` option to only run failed tests. If tests continue to fail, it will
return an exit code of 1 so that CI can report failures appropriately.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `retry_failed_tests` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:test_with_retry, "~> 0.1.0"}
  ]
end
```

## Usage

`mix test_with_retry`
