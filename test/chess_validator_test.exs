defmodule ChessValidatorTest do
  use ExUnit.Case
  doctest ChessValidator

  test "greets the world" do
    assert ChessValidator.hello() == :world
  end
end
