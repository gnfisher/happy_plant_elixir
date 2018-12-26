defmodule HappyPlantTest do
  use ExUnit.Case
  use Timex
  doctest HappyPlant

  test "create/0 creates a new plant with health 3, height 0" do
    assert HappyPlant.Plant.create() == %HappyPlant.Plant{health: 3, height: 0}
  end

  test "create_at/1 creates a new plant with last watered equal to its argument" do
    timestamp = Timex.now()

    result = HappyPlant.Plant.create_at(timestamp)

    assert result.last_watered == timestamp
  end

  describe "water/2" do
    test "deducts 1 health if less than 11 seconds have passed" do
      timestamp = Timex.now()
      three_seconds_from_now = Timex.shift(timestamp, seconds: 3)
      plant = HappyPlant.Plant.create_at(timestamp)

      result = HappyPlant.Plant.water(plant, three_seconds_from_now)

      assert result.health == plant.health - 1
    end

    test "adds 1 health if between 10 and 16 seconds have passed" do
      timestamp = Timex.now
      thirteen_seconds_from_now = Timex.shift(timestamp, seconds: 13)
      plant = HappyPlant.Plant.create_at(timestamp)

      result = HappyPlant.Plant.water(plant, thirteen_seconds_from_now)

      assert result.health == plant.health + 1
    end

    test "deducts 1 health for every interval of 15 seconds that have passed" do
      timestamp = Timex.now
      thirty_seconds_from_now = Timex.shift(timestamp, seconds: 45)
      plant = HappyPlant.Plant.create_at(timestamp)

      result = HappyPlant.Plant.water(plant, thirty_seconds_from_now)

      assert result.health == plant.health - 3
    end
  end
end
