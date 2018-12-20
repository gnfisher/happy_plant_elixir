defmodule HappyPlantTest do
  use ExUnit.Case
  doctest HappyPlant

  test "Starts life with 3 health and 0 height" do
    assert HappyPlant.Plant.create == %HappyPlant.Plant{health: 3, height: 0}
  end
end
