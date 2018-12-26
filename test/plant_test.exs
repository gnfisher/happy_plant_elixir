defmodule HappyPlant.PlantTest do
  use ExUnit.Case
  use Timex
  doctest HappyPlant.Plant

  test "create/0 creates a new plant with health 3, height 0" do
    assert HappyPlant.Plant.create() == %HappyPlant.Plant{health: 3, height: 0}
  end

  test "create_at/1 creates a new plant with last watered equal to its argument" do
    timestamp = Timex.now()

    result = HappyPlant.Plant.create_at(timestamp)

    assert result.last_watered == timestamp
  end

end
