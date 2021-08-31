defmodule RetryFailedTestsTest do
  use ExUnit.Case

  test "fail every other time" do
    fixture_file = Path.join([__DIR__, "schrodinger.txt"])
    text = File.read!(fixture_file)
    File.write!(fixture_file, "the cat is alive")
    assert String.contains?(text, "the cat is alive")
    File.write!(fixture_file, "the cat is dead")
  end
end
