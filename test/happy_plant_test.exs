defmodule HappyPlantTest do
  use ExUnit.Case
  doctest HappyPlant

  test "create/0 creates a new plant with health 3, height 0" do
    assert HappyPlant.Plant.create == %HappyPlant.Plant{health: 3, height: 0}
  end

  test "create_at/1 creates a new plant with last watered equal to its argument" do
    timestamp = DateTime.utc_now

    result = HappyPlant.Plant.create_at timestamp

    assert result.last_watered == timestamp
  end

  @tag :pending
  test "water/2 creates a new plant with +1 health if last_watered is between 10 and 30 seconds ago" do
    # TODO
    assert false
  end
end
