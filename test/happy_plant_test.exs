defmodule HappyPlantTest do
  use ExUnit.Case
  doctest HappyPlant

  test "greets the world" do
    assert HappyPlant.hello() == :world
  end
end
